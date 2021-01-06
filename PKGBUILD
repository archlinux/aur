# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.7.1.r9.gcf8cf60
pkgrel=1
pkgdesc="Micro-compositor formerly known as steamcompmgr"
arch=(x86_64)
url="https://github.com/Plagman/gamescope"
license=("custom:BSD-2-Clause")
depends=("wlroots-git" "sdl2" "libxcomposite" "vulkan-icd-loader" "libxtst" "libliftoff-git")
makedepends=("git" "meson" "ninja" "patch" "vulkan-headers" "glslang")
provides=($_pkgname "steamcompmgr")
conflicts=($_pkgname "steamcompmgr")
source=("git+https://github.com/Plagman/gamescope.git"
        "fix-wlserver-update-wlr_headless_backend_create-call.patch")
sha512sums=('SKIP'
            'c79e380f2307744de7fff7d719da6b5ecdaf8daf03771acb2c4bf1770e34692876fa37ce5efc8441dee9d8d386a17331f6991fe635730c59012faaba7db4b50b')


pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {

    rm -rf "$srcdir/$_pkgname/subprojects/libliftoff"
    rm -rf "$srcdir/$_pkgname/subprojects/wlroots"

    cd "$srcdir/$_pkgname"

    patch -Np1 < "$srcdir/fix-wlserver-update-wlr_headless_backend_create-call.patch"
}

build() {

    meson setup --prefix /usr --buildtype=release --wrap-mode=nodownload "$srcdir/$_pkgname" build
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
