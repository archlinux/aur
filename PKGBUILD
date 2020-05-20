# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.6.1.r24.g66722b1
pkgrel=2
pkgdesc="Micro-compositor formerly known as steamcompmgr"
arch=(x86_64)
url="https://github.com/Plagman/gamescope"
license=("custom:BSD-2-Clause")
depends=("wlroots-git" "sdl2" "libxcomposite" "vulkan-icd-loader" "libxtst")
makedepends=("git" "meson" "ninja")
provides=($_pkgname "steamcompmgr" "libliftoff")
conflicts=($_pkgname "steamcompmgr" "libliftoff")
source=("git+https://github.com/Plagman/gamescope.git" 
        "use-system-wlroots.patch")
sha512sums=('SKIP'
            '6f3b95ac6d95cfc5c1dd82c995b7492505507171f7d4df5c59dba3e8b66eda696328e71fc49e4df8cbf8a7aab252946c9ceb75080d062b30b8cf31dedba58717')


pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    
    git am "../use-system-wlroots.patch"

    git submodule init
    git submodule update
}

build() {
    meson --prefix /usr --buildtype=release "$srcdir/$_pkgname" build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install

    cd "$srcdir/$_pkgname"

    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
