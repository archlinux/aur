# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: mvdberge (https://aur.archlinux.org/account/mvdberge)
# Contributor: maronvl <maron.vl@gmx.de>

_pkgname=lcd4linux
pkgname="${_pkgname}-full-git"
pkgver=0.11.0.r1245.20250802.63fffaf
pkgrel=1
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
  'python>=3'       # Depends if we build with or without python support. See in 'build()' below.
)
makedepends=(
  'git'
  'automake'
  'autoconf'
  'pkg-config'

  'dbus>=1.0.0'
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
  #'lcd4linux::git+https://github.com/jmccrohan/lcd4linux.git'  # "Original" branch.
  #'lcd4linux::git+https://github.com/Hierosoft/lcd4linux.git'  # Fork with, as of 2025-11-14, 55 commits ahead of "original" branch.
  'lcd4linux::git+https://github.com/TangoCash/lcd4linux.git'  # Another fork.
  #'lcd4linux::git+https://github.com/MaxWiesel/lcd4linux-max.git'  # Another fork.
  #'add_USB2VFD.patch::https://patch-diff.githubusercontent.com/raw/jmccrohan/lcd4linux/pull/8.patch'
  'plugin_python3.c_fix.patch::https://github.com/Hierosoft/lcd4linux/commit/8e94752fdcf7e34aa5f310007b06dbae010c4b09.patch'
  #'remove_chmod_check_for_cfg_file.patch::https://github.com/MaxWiesel/lcd4linux-max/commit/e8ef33653e75182d8ddbe9854468858a523d4252.patch'
  # 'README.md_add_wiki.patch'
  'lcd4linux.service'
  'wiki.url'
)
sha256sums=(
  'SKIP'  # Main source
  #'f346f217dd6a178f5ba5e45cb2e798bb2fe212d3f931faac58de665580064d2f'  # add_USB2VFD.patch  # Already present in 'https://github.com/Hierosoft/lcd4linux'.
  'fa8785a8e785a316ab82e6a7ef55708c8ffcd68cd0fc582febbf6561d5cc2439'  # plugin_python3.c_fix.patch  # Already present in 'https://github.com/Hierosoft/lcd4linux'.
  #'5611c9fa8a51fc62a2108a93dffb39e1459b4c451fd38b778ff157ab6159784e'  # 'remove_chmod_check_for_cfg_file.patch'  # Already present in 'https://github.com/TangoCash/lcd4linux' and 'https://github.com/MaxWiesel/lcd4linux-max'.
  # '8a0e0a89a254889ac00a169c1fb719ed603a0462043b63ebc929bfd94b55fa2d'  # README.md_add_wiki.patch
  '4db8fcd0f63669cac8eb9acbc250d5e9604644a97edb35a8819778e2ade97b78'  # lcd4linux.service
  '52bf0933e8a3a00dcb0f39384196b25c9ed7ff4443c191ef3ccac2bc57cbc655'  # wiki.url
)

prepare() {
  cd "${_pkgname}"

  local _patches_to_apply _patch
  _patches_to_apply=(
    # 'add_USB2VFD.patch'  # Already present in 'https://github.com/Hierosoft/lcd4linux'.
    'plugin_python3.c_fix.patch'  # Already present in 'https://github.com/Hierosoft/lcd4linux'.
    #'remove_chmod_check_for_cfg_file.patch'
    # 'README.md_add_wiki.patch'
  )
  for _patch in "${_patches_to_apply[@]}"; do
    printf '%s\n' "   > Applying patch '${_patch}'"
    patch -Np1 --follow-symlinks -i "${srcdir}/${_patch}"
  done

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
    --enable-cxx-stdlib \
    --with-sco \
    --with-x \
    --with-python \
    --with-outb \
    --with-drivers='all' \
    --with-plugins='all'

  # * Plugin 'proc_stat' fails to build when using 'Hierosoft' fork, see https://github.com/Hierosoft/lcd4linux/issues/20. (2025-11-14.)

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
  # Only root is allowed to read `/etc/lcd4linux.conf`, otherwise `lcd4linux` aborts with `security error: group or other have access to '/etc/lcd4linux.conf'`. EXCEPT: If patched accordingly :-), which we do in `prepare()` or we use a source that is already patched accordingly.
  install -Dvm0644 "lcd4linux.conf.sample" "${pkgdir}/etc/lcd4linux.conf"

  install -Dvm0644 -t "${pkgdir}/usr/share/pixmaps"  lcd4linux.xpm

  install -Dvm0644 -t "${pkgdir}/usr/share/doc/${_pkgname}"  "${srcdir}"/wiki.url git.log TODO tux.png NEWS AUTHORS ChangeLog lcd4linux.conf.sample README
  install -Dvm0644 -t "${pkgdir}/usr/share/doc/${_pkgname}/contrib/picoLCD"  contrib/picoLCD/*

  install -Dvm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
