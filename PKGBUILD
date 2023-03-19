# Maintainer: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
# Contributor: Torge Matthies <openglfreak@googlemail.com>
# Contributor: TheBill2001 <tuantran1632001@gmail.com>

_pkgname=latencyflex
pkgname=(latencyflex-git latencyflex-wine-git)
pkgver=r61.0470806
pkgrel=1
pkgdesc="Vendor and game agnostic latency reduction middleware"
arch=('x86_64')
url="https://github.com/ishitatsuyuki/LatencyFleX"
license=('Apache')
makedepends=('git' 'cmake' 'meson' 'vulkan-headers' 'vulkan-validation-layers' 'wine' 'mingw-w64-gcc')
source=("git+https://github.com/ishitatsuyuki/LatencyFleX.git"
        "git+https://github.com/kubo/funchook.git"
        "git+https://github.com/gdabah/distorm.git"
        "git+https://android.googlesource.com/platform/external/perfetto"
        "git+https://github.com/ishitatsuyuki/unhollowed-assemblies.git"
        "latencyflex-wine.install")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '30861957636eed47ee70461dc377e8dcd23b1acfa8b7bb570196e1347d121bb6')

_vcsname=LatencyFleX

pkgver() {
    cd "$srcdir/$_vcsname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_vcsname"

    git submodule init
    git config submodule.layer/funchook.url "$srcdir/funchook"
    git config submodule.layer/subprojects/perfetto.url "$srcdir/perfetto"
    git config submodule.layer/unity/unhollowed.url "$srcdir/unhollowed-assemblies"
    git -c protocol.file.allow=always submodule update

    git -C layer/subprojects/funchook submodule init
    git -C layer/subprojects/funchook config submodule.distorm.url "$srcdir/distorm"
    git -c protocol.file.allow=always -C layer/subprojects/funchook submodule update
}

build() {
    cd "$srcdir/$_vcsname/layer"
    arch-meson build
    meson compile -C build
    cd "$srcdir/$_vcsname/layer/wine"
    export LIBRARY_PATH="$PWD/../build/"
    # Bug: Meson leaks LDFLAGS into cross targets
    LDFLAGS= meson --prefix=/usr build-wine64 --cross cross-wine64.txt
    meson compile -C build-wine64
    LDFLAGS= meson --prefix=/usr build-mingw64 --cross cross-mingw64.txt
    meson compile -C build-mingw64
}

package_latencyflex-git() {
    depends=()
    provides=('latencyflex')
    conflicts=('latencyflex')
    cd "$srcdir/$_vcsname/layer"
    DESTDIR="$pkgdir" meson install -C build --skip-subprojects
}

package_latencyflex-wine-git() {
    depends=('latencyflex-git')
    provides=('latencyflex-wine')
    conflicts=('latencyflex-wine')
    install='latencyflex-wine.install'
    cd "$srcdir/$_vcsname/layer/wine"
    DESTDIR="$pkgdir" meson install -C build-wine64 --skip-subprojects
    DESTDIR="$pkgdir" meson install -C build-mingw64 --skip-subprojects
}
