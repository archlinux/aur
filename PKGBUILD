# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

pkgbase=vibrant-git
pkgname=(libvibrant-git vibrant-cli-git)
pkgver=1.0.3.r2.g8c5fa72
pkgrel=1
pkgdesc="A simple library to adjust color saturation of X11 outputs."
arch=(x86_64)
url="https://gitlab.com/Scrumplex/vibrant"
license=("GPL3" "custom:MIT")
makedepends=("git" "cmake" "check" "libxrandr" "libxnvctrl")
source=("${pkgbase}::git+https://gitlab.com/Scrumplex/vibrant.git")
sha512sums=('SKIP')


pkgver() {
    cd "$pkgbase"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {

    cmake -B build -S "$pkgbase" \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

check() {

    make -C build test
}

package_libvibrant-git() {
    provides=("libvibrant" "libvibrant.so=1-64")
    conflicts=("vibrant" "libvibrant")
    depends=("libxrandr" "libxnvctrl")

    cd "build"

    env DESTDIR="$pkgdir" cmake -DCOMPONENT=lib -P cmake_install.cmake

    cd "../$pkgbase"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

package_vibrant-cli-git() {
    provides=("vibrant-cli")
    conflicts=("vibrant" "vibrant-cli")
    depends=("libvibrant.so")

    cd "build"

    env DESTDIR="$pkgdir" cmake -DCOMPONENT=cli -P cmake_install.cmake

    cd "../$pkgbase"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
