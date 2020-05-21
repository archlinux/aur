# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.6.1.r23.g5ab3129
pkgrel=1
pkgdesc="Micro-compositor formerly known as steamcompmgr"
arch=(x86_64)
url="https://github.com/Plagman/gamescope"
license=("custom:BSD-2-Clause")
depends=("wlroots-git" "sdl2" "libxcomposite" "vulkan-icd-loader" "libxtst")
makedepends=("git" "meson" "ninja" "patch")
provides=($_pkgname "steamcompmgr" "libliftoff")
conflicts=($_pkgname "steamcompmgr" "libliftoff")
source=("git+https://github.com/Plagman/gamescope.git"
        "git+https://github.com/emersion/libliftoff.git#commit=cfeee41ec1aa03578bfbe4cd513a25e84c407dec"
        "use-system-wlroots.patch")
sha512sums=('SKIP'
            'SKIP'
            '11878aae7f7c0f7ef01f0b85ce83d5fcea2b339d309dc34dea55d7bcd04ea9d03257f23313c464296b46e1e61e14b91d007c7cfb0d993434afab07f280d9961c')


pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    
    patch -p1 < "../use-system-wlroots.patch"
    git rm "subprojects/wlroots"  # remove wlroots submodule, to avoid downloading unneccessary dependencies
    git submodule init
    git config submodule.subprojects/libliftoff.url $srcdir/libliftoff

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
