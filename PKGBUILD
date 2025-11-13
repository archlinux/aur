# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgbase=libdlo
pkgbase="${_pkgbase}"
pkgname=(
  "${_pkgbase}"
)
pkgver=0.1.2
pkgrel=2
pkgdesc="User space library that supports DL1xx DisplayLink devices. Can be used to drive those displays directly."
url="https://libdlo.freedesktop.org/wiki/"
arch=(
  'aarch64'
  'x86_64'
  'i686'
  'pentium4'
  'armv5h'
  'armv6h'
  'armv7h'
)
license=(GPL-2.0-only)
depends=(
  'glibc'
  'libusb-compat'
)
makedepends=(
  'libusb-compat'
)
optdepends=()
provides=(
  "${_pkgbase}.so"
  "${_pkgbase}.a"
)
conflicts=(
  "${_pkgbase}.so"
  "${_pkgbase}.a"
)
options+=('staticlibs')
source=(
  "${_pkgbase}-${pkgver}.tar.gz::http://people.freedesktop.org/~berniet/${_pkgbase}-${pkgver}.tar.gz"
)
sha256sums=(
  'c5f75baf4424348580ca988e17bb752f68c29978cfbb01bae543d2dc9bb193fd'  # libdlo-0.1.2.tar.gz
)

_CFLAGSADDITIONS="-w -Wno-error=aggressive-loop-optimizations -Wno-error=attributes -Wno-error=discarded-qualifiers -Wno-error=pointer-to-int-cast"

#prepare() {
#
#}

build() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}/${_pkgbase}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --enable-shared \
    --enable-static \
    --with-pic

  make
}

## Don't use `check()` since it requires root privileges and a connected supported DisplayLink device.
# check() {
#   CFLAGS+=" ${_CFLAGSADDITIONS}"
#   CXXFLAGS+=" ${_CFLAGSADDITIONS}"
#   export CFLAGS
#   export CXXFLAGS
# 
#   cd "${srcdir}/${_pkgbase}-${pkgver}"
# 
#   make check
# }

package() {
  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  cd "${srcdir}/${_pkgbase}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  ## Install the static library
  #install -Dvm644 -t "${pkgdir}/usr/lib/" "src/.libs/${_pkgbase}.a"

  ## Remove test executable
  rm    "${pkgdir}/usr/bin/test1"
  rmdir "${pkgdir}/usr/bin"

  ## `make install` already installs the `README` file.
  install -Dvm644 -t "${pkgdir}/usr/share/doc/${pkgbase}"       "Guide-v104.pdf" # "README"
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  "COPYING"
}
