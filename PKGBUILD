# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="qdl"
pkgver=2.5
pkgrel=1
pkgdesc="Tool to communicate with Qualcomm System On a Chip bootroms to install or execute code"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/linux-msm/${pkgname}"
license=(
  'BSD-3-Clause'
)
depends=(
  'glibc'
  'libusb'
  'libxml2'
)
makedepends=(
  'help2man'
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "${url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('c523c01c9a9d5c8902679ec76e88ea7068a4e8c0485bd5ac462fc150cc0b4029439723640eaecf7fdc547faea98760d9e108d8555ef275498291d78eeaaebeef')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e 's/-O2//g' \
      -i 'Makefile'
}

build(){
  cd "${srcdir}/${_pkgsrc}"
  make
  make manpages
}

package(){
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" prefix="/usr" install

  install -vDm644 ./*.1 -t "${pkgdir}/usr/share/man/man1"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
