# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.7.1.r40.g79acc09
pkgrel=1
pkgdesc="Micro-compositor formerly known as steamcompmgr"
arch=(x86_64)
url="https://github.com/Plagman/gamescope"
license=("custom:BSD-2-Clause")
depends=("libxcomposite" "libxtst" "libxres" "sdl2" "wlroots-git" "libliftoff-git")
makedepends=("git" "meson" "ninja" "patch" "vulkan-headers" "glslang")
provides=($_pkgname "steamcompmgr")
conflicts=($_pkgname "steamcompmgr")
source=("git+https://github.com/Plagman/gamescope.git"
        "0001-packaging-archlinux-Use-libliftoff-s-new-pkg-config-.patch"
        "0002-fix-wlserver-update-wlr_headless_backend_create-call.patch")
sha512sums=('SKIP'
            '7876353d4e7f4f81083dede3d77dc778e65a87dd8ae021e3976d4999431f6a30ab305c79f13d4ff9280ad2bae294525f45bf791b65b7e2af3efa65a76397a4cf'
            'c79e380f2307744de7fff7d719da6b5ecdaf8daf03771acb2c4bf1770e34692876fa37ce5efc8441dee9d8d386a17331f6991fe635730c59012faaba7db4b50b')


pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {

    rm -rf "$srcdir/$_pkgname/subprojects/libliftoff"
    rm -rf "$srcdir/$_pkgname/subprojects/wlroots"

    cd "$srcdir/$_pkgname"

    patch -Np1 < "$srcdir/0001-packaging-archlinux-Use-libliftoff-s-new-pkg-config-.patch"
    patch -Np1 < "$srcdir/0002-fix-wlserver-update-wlr_headless_backend_create-call.patch"
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
