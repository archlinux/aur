# Maintainer: André Silva <emulatorman@parabola.nu>
# Contributor: Luke Shumaker <lukeshu@sbcglobal.net>

# Based on linux-api-headers package

# toolchain build order: linux-libre-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-libre-api-headers
_pkgbasever=4.10-gnu
_pkgver=4.10.1-gnu

_srcname=linux-${_pkgbasever%-*}
_archpkgver=${_pkgver%-*}
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=('i686' 'x86_64' 'armv7h')
url="https://www.gnu.org/software/libc"
license=('GPL2')
provides=("linux-api-headers=${_archpkgver}")
conflicts=('linux-api-headers')
replaces=('linux-api-headers')
source=("https://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz"
        "https://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgbasever}/linux-libre-${_pkgbasever}.tar.xz.sign"
        "https://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz"
        "https://linux-libre.fsfla.org/pub/linux-libre/releases/${_pkgver}/patch-${_pkgbasever}-${_pkgver}.xz.sign")
sha512sums=('44d1774a1d43a15322297d351737fbcbf92c6f433266ce2b17587437d433562cf5811fdae48fafd5a8e00d18ed9ac2e1ad4b12a657f322eb234384316ad131e0'
            'SKIP'
            '03669d17c68d1a845db36dcc953fd98450c692d97c4273c91ae17ad5e4ec395834f6320e4862ffe5fff7eecbe2ea5888cbe3c9c9093dd16fad8603db756b8053'
            'SKIP')
validpgpkeys=(
              '474402C8C582DAFBE389C427BCB7CF877E7D47A7' # Alexandre Oliva
)

prepare() {
  cd "${srcdir}/${_srcname}"

  # add upstream patch
  if [ "${_pkgbasever}" != "${_pkgver}" ]; then
    patch -p1 -i "${srcdir}/patch-${_pkgbasever}-${_pkgver}"
  fi
}

build() {
  cd "${srcdir}/${_srcname}"

  make mrproper
  make headers_check
}

package() {
  cd "${srcdir}/${_srcname}"
  make INSTALL_HDR_PATH="${pkgdir}"/usr headers_install

  # use headers from libdrm
  rm -r "${pkgdir}"/usr/include/drm
  
  # clean-up unnecessary files generated during install
  find "${pkgdir}" \( -name .install -o -name ..install.cmd \) -delete
}
