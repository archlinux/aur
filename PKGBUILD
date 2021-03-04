# Maintainer: Zachery Gyurkovitz <zgyurkovitz@gmail.com>
# Maintainer: Mado <madoushi@tutanota.com>

pkgname=etterna
pkgver=0.70.3
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
sha256sums=('SKIP'
            '7b497e7d3d74c2f3ebf1634fe0b576603099c372f7787a21646976d76e0e0995'
)

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    sed -i CMakeLists.txt -e 's/\(set(OPENSSL_USE_STATIC_LIBS\) ON/\1 OFF/'
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -G 'Unix Makefiles' ..
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || exit 2
    install -dm777 "${pkgdir}/opt/${pkgname}"
    chmod +s "${pkgdir}/opt/${pkgname}"
    install -dm777 "${pkgdir}/opt/${pkgname}/Cache"

    install -Dm755 "Etterna" "${pkgdir}/opt/${pkgname}/Etterna"
    
    cp -r -t "${pkgdir}/opt/${pkgname}" \
        "Assets/" \
        "BackgroundEffects/" \
        "Data/" \
        "NoteSkins/" \
        "Scripts/" \
        "Songs/" \
        "Themes/" \
        "portable.ini"
    
    install -Dm644 "CMake/CPack/Windows/Install.ico" "$pkgdir/opt/${pkgname}/icon.ico" 

    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    cd "${pkgdir}/opt/${pkgname}"
    
    chmod 777 -R \
        "Assets/" \
        "BackgroundEffects/" \
        "Data/" \
        "NoteSkins/" \
        "Scripts/" \
        "Songs/" \
        "Themes/"
}
