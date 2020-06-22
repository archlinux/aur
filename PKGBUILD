# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.6.3.r3.g4524ac3
pkgrel=1
pkgdesc="Micro-compositor formerly known as steamcompmgr"
arch=(x86_64)
url="https://github.com/Plagman/gamescope"
license=("custom:BSD-2-Clause")
depends=("wlroots-git" "sdl2" "libxcomposite" "vulkan-icd-loader" "libxtst" "libliftoff")
makedepends=("git" "meson" "ninja" "patch" "vulkan-headers" "glslang")
provides=($_pkgname "steamcompmgr")
conflicts=($_pkgname "steamcompmgr")
source=("git+https://github.com/Plagman/gamescope.git"
        "use-system-libs.patch")
sha512sums=('SKIP'
            '2459cca2891c2de061a35dbb8896ac16c51e86e338d042e7a40f8742b59325d412232b653c6a36347af528cde8226e250f315a5b6c98d0b76ac5001099c7a245')


pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    
    patch -p1 < "../use-system-libs.patch"
}

build() {

    meson --prefix /usr --buildtype=release "$srcdir/$_pkgname" build
    ninja -C build
}

check() {

    ninja -C build test
}

package() {

    DESTDIR="$pkgdir" ninja -C build install

    cd "$srcdir/$_pkgname"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
