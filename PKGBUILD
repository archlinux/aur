# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>

_pkgname=gamescope
pkgname=${_pkgname}-git
pkgver=3.7.1.r58.g7dfb55c8a8db62ac
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
        "https://patch-diff.githubusercontent.com/raw/Plagman/gamescope/pull/150.patch"
        "https://patch-diff.githubusercontent.com/raw/Plagman/gamescope/pull/181.patch")
sha512sums=('SKIP'
            '939b87c9c83ba957ad1eda6b89d281fc03365f2c1e01377a4b1cb06647ceeba0cf00f6df100891d81b3b585a29d850089440c6ae62bc077554c9e5c32eca85df'
            '430db3983a92b664ab0f0ed1246d430a657122b68a9c14fb8f37d430987fc15ab6fcd1f70e18d4e4fd5891899963f766ea48ddf5b6085262080dedcb3ceecd65')


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
