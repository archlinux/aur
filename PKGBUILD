# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=aces-container
_srcname=aces_container
pkgver=1.0.2
pkgrel=2
pkgdesc="ACES Container Reference Implementation"
arch=('x86_64')
url="https://github.com/ampas/aces_container"
license=('custom')
depends=('gcc-libs')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ampas/${_srcname}/archive/v${pkgver}.tar.gz"
        "Switch-to-CMAKE-default-variables.patch"
        "Set-the-appropriate-SONAME-for-the-library.patch")
sha256sums=('cbbba395d2425251263e4ae05c4829319a3e399a0aee70df2eb9efb6a8afdbae'
            '3f1d84e01eed4a6300fdb7ac6d242e617eb530207bd95283ff1e34eddc99a41d'
            '7ac19a147d590471c585fcf73a424a9cb99b164e673f861ca1a0db3d2d907068')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}"
  patch -Np1 -i "${srcdir}/Switch-to-CMAKE-default-variables.patch"
  patch -Np1 -i "${srcdir}/Set-the-appropriate-SONAME-for-the-library.patch"

  # fix issue with permissions of aces_writeattributes.*
  chmod 644 aces_writeattributes.*
}

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
  cmake "../${_srcname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  
  # License file
  install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
