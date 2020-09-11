# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.6.9.r21.g5644232
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
            'a36d6bef5ea19a0754ab82df5bc2c5f64c23321fde7be33073953dad76eb8c0af64ae1b5723f4e778a403c6bf75d4df27a524899de3b412d2bacd1cd4052e86a')


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
