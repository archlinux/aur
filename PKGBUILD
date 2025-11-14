# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: mvdberge (https://aur.archlinux.org/account/mvdberge)
# Contributor: maronvl <maron.vl@gmx.de>

_pkgname=lcd4linux
pkgname="${_pkgname}-full-git"
pkgver=0.11.0_SVN.r1167.20170527.cb69a93
pkgrel=2
pkgdesc="Grabs information from the kernel and other systems and displays it on an LCD. Compiled with all possible drivers, also obscure ones."
arch=(
  'i686'
  'x86_64'
)
url="https://wiki.lcd4linux.tk/doku.php"
license=('GPL-2.0-only')
depends=(
  'gd'              # libgd.so
  'glibc'           # libm.so
  'libdbus-1.so'
  'libftdi-compat'  # libftdi.so
  'libjpeg.so'
  'libmpdclient.so'
  'libserdisp.so'
  'libst2205.so'
  'libluise.so'
  'libnmeap.so'
  'libusb-1.0.so'   # Provided by 'libusb'
  'libusb-compat'   # libusb-0.1.so
  'libvncserver'    # libvncserver.so
  'libx11'          # libX11.so
  'libmariadb.so'
  'libncursesw.so'
  'libsqlite3.so'
)
makedepends=(
  'git'
  'automake'
  'autoconf'
  'pkg-config'

  'dbus'
  'libluise'
  'libjpeg'
  'libmpdclient'
  'libst2205'
  'libusb'
  'mariadb-libs'
  'ncurses'
  'nmeap'
  'serdisplib-full'
  'sqlite'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-full=${pkgver}"
  "${_pkgname}-git=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
backup=(
  'etc/lcd4linux.conf'
)
options+=('staticlibs')
#options+=('!lto')
source=(
  'lcd4linux::git+https://github.com/jmccrohan/lcd4linux'
  'lcd4linux.service'
)
sha256sums=(
  'SKIP'
  '4db8fcd0f63669cac8eb9acbc250d5e9604644a97edb35a8819778e2ade97b78'
)

prepare() {
  cd "${_pkgname}"

  git log > git.log
}

pkgver() {
  cd "${_pkgname}"

  _ver_package="$(grep -E '^[[:space:]]*PACKAGE_VERSION[[:space:]]*=' configure | head -n1 | awk -F= '{print $2}' | sed 's|#.*$||' | tr -d \"\'[[:space:]] | tr '-' '_')"
  _ver="${_ver_package}"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${_pkgname}"

  export ACLOCAL_PATH="/usr/share/aclocal:/usr/share/gettext/m4${ACLOCAL_PATH:+:}$ACLOCAL_PATH"
  CFLAGS+=" -std=gnu90"
  CFLAGS+=" -Wno-incompatible-pointer-types -Wno-error=incompatible-pointer-types"
  export CFLAGS

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --exec-prefix=/usr \
    --enable-shared \
    --enable-static \
    --with-sco \
    --with-x \
    --without-python \
    --with-outb \
    --with-drivers=all \
    --with-plugins=all
  # --with-python would lead to linking error "plugin_python.c:(.text+0x58): undefined reference to `PyString_FromString'". (2025-11-14.)

  make -j1
}

check() {
  cd "${_pkgname}"

  make -k check
}

package() {
  cd "${_pkgname}"

  make DESTDIR="${pkgdir}/" install

  install -Dvm0644 "${srcdir}/lcd4linux.service" "${pkgdir}/usr/lib/systemd/system/lcd4linux.service"
  # Only root is allowed to read `/etc/lcd4linux.conf`, otherwise `lcd4linux` aborts with `security error: group or other have access to '/etc/lcd4linux.conf'`.
  install -Dvm0600 "lcd4linux.conf.sample" "${pkgdir}/etc/lcd4linux.conf"

  install -Dvm0644 -t "${pkgdir}/usr/share/pixmaps"  lcd4linux.xpm

  install -Dvm0644 -t "${pkgdir}/usr/share/doc/${_pkgname}"  git.log TODO tux.png README NEWS AUTHORS ChangeLog lcd4linux.conf.sample
  install -Dvm0644 -t "${pkgdir}/usr/share/doc/${_pkgname}/contrib/picoLCD"  contrib/picoLCD/*

  install -Dvm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
