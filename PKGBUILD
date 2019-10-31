# Maintainer: Zachery Gyurkovitz <zgyurkovitz@gmail.com>

pkgname=etterna
pkgver=0.66.1
pkgrel=1
pkgdesc="A advanced cross-platform rhythm game focused on keyboard play"
arch=('i686' 'x86_64')
url="https://etternaonline.com"
license=('MIT')
depends=('glu' 'libpulse' 'libxrandr' 'curl')
makedepends=('cmake')
optdepends=('jack: Audio server')
provides=('etterna')
conflicts=('etterna-git')
install='etterna.install'
changelog=
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/etternagame/${pkgname}/archive/v${pkgver}.tar.gz"
    "${pkgname}.desktop"
)
sha256sums=(
    "25e62a9de6fdfd33068dd7579d2d3b383ee95bdc0c4096af28059fe67a9a645e"
    "c02e9be96fd447c9240b2510feab98a29df5ce0d694dad00baf8b92d79983115"
)
build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
  
  mkdir -p build
  cd build
  cmake -G 'Unix Makefiles' ..
  make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
    mkdir -p "${pkgdir}/opt/${pkgname}/Cache"

    install -Dm755 "Etterna" "${pkgdir}/opt/${pkgname}/Etterna"

    mkdir "${pkgdir}/opt/${pkgname}/Songs"
    
    cp -r -t "${pkgdir}/opt/${pkgname}" \
        "Assets/" \
        "BackgroundEffects/" \
        "Characters/" \
        "Data/" \
        "NoteSkins/" \
        "Scripts/" \
        "Songs/" \
        "Themes/" 
    
    install -Dm644 "CMake/CPack/Windows/Install.ico" "$pkgdir/opt/${pkgname}/icon.ico" 

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
