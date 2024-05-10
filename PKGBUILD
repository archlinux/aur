# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgbase=vibrant
_pkgbase=libvibrant
pkgname=(libvibrant vibrant-cli)
pkgver=1.1.1
pkgrel=1
pkgdesc="A simple library to adjust color saturation of X11 outputs."
arch=(x86_64)
url="https://github.com/libvibrant/libvibrant"
license=("GPL3" "custom:MIT")
makedepends=("git" "cmake" "libxrandr" "libxnvctrl")
source=("${_pkgbase}-${pkgver}.tar.gz::https://github.com/libvibrant/libvibrant/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('fbcb53ce431bc35c7f0a66e765708dfa5e4bac5bf1bcd20354710e0ff2a63d33f2692aa4671a9452a4a97c928ab1810e6e4a14290f252064619ab9b37294214a')


build() {

    cmake -B build -S "${_pkgbase}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package_libvibrant() {
    provides=("libvibrant.so=1-64" "libvibrant.so=1")
    conflicts=("vibrant")
    depends=("libxrandr" "libxnvctrl")

    cd "build"

    env DESTDIR="$pkgdir" cmake -DCOMPONENT=lib -P cmake_install.cmake

    cd "../${_pkgbase}-${pkgver}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_vibrant-cli() {
    conflicts=("vibrant")
    depends=("libvibrant.so=1-64")

    cd "build"

    env DESTDIR="$pkgdir" cmake -DCOMPONENT=cli -P cmake_install.cmake

    cd "../${_pkgbase}-${pkgver}"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

