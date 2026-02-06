# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="qdl"
pkgver=2.4
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
b2sums=('691dc7e6625ea7c19c62aed41a4bb6c63b8371c1f1182b88e5b0173b8cd5e5799e23ef99e4c09f82cd5d4060bc5b48e96a607ee9d6e19104a5d42c4adc797d82')

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
