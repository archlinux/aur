# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.7.1.r65.g4f24653d776f570b
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
        "fix-wlroots-master-$pkgrel.patch::https://patch-diff.githubusercontent.com/raw/Plagman/gamescope/pull/150.patch")
sha512sums=('SKIP'
            'e5769d1b67c1d19b0142faadd752178f398ca1b893d01683d95658c4eaad15cc5921552fa89b302891f75fbc6ff67b65dced856808d7ac9d80d3812cc8d9441f')


pkgver() {
    cd "$srcdir/$_pkgname"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"

    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"
        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        git apply "../$src"
    done

    rm -rf "subprojects/libliftoff" "subprojects/wlroots"
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
