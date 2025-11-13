# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: M-Reimer (https://aur.archlinux.org/account/M-Reimer)
# Contributor: CReimer (https://aur.archlinux.org/account/CReimer)

_pkgname=serdisplib
pkgname="${_pkgname}-svn"
#epoch=0
pkgver=2.02.r383.d20191027
pkgrel=3
pkgdesc="Library to drive displays with built-in controllers. Built with all available features."
arch=(
  'aarch64'
  'arm'
  'arm64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://serdisplib.sourceforge.net/"
license=('GPL-2.0-only')
depends=(
  'gd'
  'glibc'
)
optdepends=()
makedepends=(
  'subversion'

  'libdlo.a'
  'libusb-compat'
  'sdl'

  # 'doxygen'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-full=${pkgver}"
  "${_pkgname}-tools=${pkgver}"
  "libserdisp.so"
  "libserdisp.a"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-tools"
  "libserdisp.so"
  "libserdisp.a"
)
replaces=()
backup=(
  'etc/serdispd.cfg'
)
options=('staticlibs')
source=(
  "${_pkgname}::svn+svn://svn.code.sf.net/p/${_pkgname}/code/${_pkgname}/trunk"
  'serdisplib-2.01-add-destdir-support.patch'
  # '99-serdisplib.rules'
)

sha256sums=(
  'SKIP'  # Main source, SVN
  'f00cb2183d6dc447d0bbcc2e501732bfab7b61c3059c25dbbebe4a88012003e3'  # serdisplib-2.01-add-destdir-support.patch
  # '6d3bb4bc9ddac58d5c1b188fcb71c154d26250a15c085e1b16adfd2f2a7887fc'  # 99-serdisplib.rules
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  local _patch
  for _patch in "${srcdir}/serdisplib-2.01-add-destdir-support.patch"; do
    printf '%s\n' "   > Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  printf '%s\n' "   > Generating svn commit messages file ..."
  svn log > svn.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver_package="$(grep -E '^[[:space:]]*PACKAGE_VERSION[[:space:]]*=' configure | head -n1 | awk -F= '{print $2}' | sed 's|#.*$||' | tr -d \"\'[[:space:]])"
  _ver_extra="$(grep -E '^[[:space:]]*PACKAGE_VERSION_EXTRA[[:space:]]*=' configure | head -n1 | awk -F= '{print $2}' | sed 's|#.*$||' | tr -d \"\'[[:space:]])"
  _ver="${_ver_package}"
  if [ -n "${_ver_extra}" ]; then
    _ver+=".${_ver_extra}"
  fi
  _rev="$(svn info | grep '^Revision' | cut -d' ' -f2)"
  _date="$(svn info --show-item last-changed-date | awk -FT '{print $1}' | tr -d '-')"

  if [ -z "${_ver_package}" ]; then
    printf '%s\n' "$0: Error: Could not determine package version." > /dev/stderr
    printf '%s\n' "Aborting." > /dev/stderr
    false
    return 1
  fi
  if [ -z "${_rev}" ]; then
    printf '%s\n' "$0: Error: Could not determine SVN revision." > /dev/stderr
    printf '%s\n' "Aborting." > /dev/stderr
    false
    return 1
  fi
  if [ -z "${_date}" ]; then
    printf '%s\n' "$0: Error: Could not determine latest commit date." > /dev/stderr
    printf '%s\n' "Aborting." > /dev/stderr
    false
    return 1
  fi

  printf '%s' "${_ver}.r${_rev}.d${_date}"
}

build() {
  cd "${srcdir}/${_pkgname}"

  ### Silent some warnings/ do not treat them as errors.
  local _silentwarnings _warning
  _silentwarnings=('calloc-transposed-args' 'pointer-arith' 'unused-parameter' 'stringop-overread')
  for _warning in "${_silentwarnings[@]}"; do
    CFLAGS+=" -Wno-${_warning} -Wno-error=${_warning}"
  done
  export CFLAGS

  ### Configure the Makefile.
  printf '%s\n' "   > Running './configure' (with options) ..."
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --exec-prefix=/usr \
    --enable-experimental \
    --enable-deprecated \
    --enable-tools \
    --enable-dynloading \
    --enable-statictools \
    --enable-libusb \
    --enable-libSDL \
    --enable-libdlo \
    --enable-pthread \
    --with-drivers=all

  ### Build the software.
  printf '%s\n' "   > Running 'make' ..."
  make

  ## Documentation generates just some sample doxygen stuff.
  # ### Build the documentation.
  # printf '%s\n' "   > Running 'doxygen DOCS' ..."
  # doxygen DOCS
}

package() {
  cd "${srcdir}/${_pkgname}"

  ### Install the software.
  printf '%s\n' "   > Runnung 'make install' ..."
  make DESTDIR="${pkgdir}" install


  printf '%s\n' "   > Installing other files ..."
  install -Dvm644 -t "${pkgdir}/usr/lib/udev/rules.d"           90-libserdisp.rules
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      svn.log AUTHORS BUGS HISTORY INSTALL PINOUTS README TODO
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}/DOCS" DOCS/txt/mainpage.txt
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  COPYING
}
