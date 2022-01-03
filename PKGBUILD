# Maintainer: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
# Contributor: Torge Matthies <openglfreak@googlemail.com>

_pkgname=latencyflex
pkgname=(latencyflex-git latencyflex-wine-git)
pkgver=r24.514fed6
pkgrel=1
pkgdesc="Vendor and game agnostic latency reduction middleware"
arch=('x86_64')
url="https://github.com/ishitatsuyuki/LatencyFleX"
license=('Apache')
makedepends=('cmake' 'meson' 'vulkan-headers' 'vulkan-validation-layers' 'wine')
source=("git+https://github.com/ishitatsuyuki/LatencyFleX.git"
        "git+https://github.com/kubo/funchook.git"
        "git+https://github.com/gdabah/distorm.git"
        "latencyflex-wine.install")
sha256sums=('SKIP'
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

    git submodule init layer/subprojects/funchook
    git config submodule.layer/subprojects/funchook.url "$srcdir/funchook"
    git submodule update layer/subprojects/funchook
    git -C layer/subprojects/funchook submodule init distorm
    git -C layer/subprojects/funchook config submodule.distorm.url "$srcdir/distorm"
    git -C layer/subprojects/funchook submodule update distorm
}

build() {
    cd "$srcdir/$_vcsname/layer"
	arch-meson build
	meson compile -C build
	cd "$srcdir/$_vcsname/layer/wine"
	export LIBRARY_PATH="$PWD/../build/"
	arch-meson build -D b_lto=false --cross cross-wine64.txt
	meson compile -C build
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
	DESTDIR="$pkgdir" meson install -C build --skip-subprojects
}
