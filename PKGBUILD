# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="qdl"
pkgver=2.6
pkgrel=2
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
b2sums=('5c4069086ba637f7c4c8da98a794e7e2fdc30c229c9e7cb35a8de1cd057a42acaec83477a9003f0a2b1f30f7107f7e99b7e49b10d29d3a353d114b5916e6cc2e')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  sed -e 's/-O2//g' \
      -e "s|\$(VERSION)|v${pkgver}|g" \
      -i 'Makefile'
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  make # VERSION="v${pkgver}"
  make manpages
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make tests
}

package(){
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" prefix="/usr" install

  install -vDm644 ./*.1 -t "${pkgdir}/usr/share/man/man1"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
