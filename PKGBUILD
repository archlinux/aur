# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgbase=vibrant
pkgname=(libvibrant vibrant-cli)
pkgver=1.0.3
pkgrel=2
pkgdesc="A simple library to adjust color saturation of X11 outputs."
arch=(x86_64)
url="https://gitlab.com/Scrumplex/vibrant"
license=("GPL3" "custom:MIT")
makedepends=("git" "cmake" "libxrandr" "libxnvctrl")
source=("${pkgbase}::git+https://gitlab.com/Scrumplex/vibrant.git#tag=${pkgver}")
sha512sums=('SKIP')


build() {

    cmake -B build -S "$pkgbase" \
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

    cd "../$pkgbase"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_vibrant-cli() {
    conflicts=("vibrant")
    depends=("libvibrant.so=1-64")

    cd "build"

    env DESTDIR="$pkgdir" cmake -DCOMPONENT=cli -P cmake_install.cmake

    cd "../$pkgbase"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

