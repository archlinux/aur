# Maintainer: Mado <madoushi@tutanota.com>

pkgname=etterna
pkgver=0.70.4
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
    "cmake_warn_fix.patch"
)
sha256sums=('c5ac4ceb6eb872ed3bbcc25ccd11b0e784d454f588df409c7c42ee79d8d32dae'
            '652b94614a6371c227ccf5a034e7ea98e937a0f350723f50ea40d03724c799a4'
            'c19f63ab90cdd0cc1c9be17a3994bf8fe61e142bff1c644945f6290bc41c8db4'
)

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    sed -i CMakeLists.txt -e 's/\(set(OPENSSL_USE_STATIC_LIBS\) ON/\1 OFF/'
    cd "$srcdir"
    patch --forward --strip=1 --input="${srcdir}/cmake_warn_fix.patch"
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
