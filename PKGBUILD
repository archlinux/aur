# Maintainer: Adrian Grzeca <adrian@grzeca.me>

pkgname=ragtime
_tag=v0.2.0-beta
pkgver=0.2.0beta
pkgrel=1
pkgdesc='Chat and file transfer over HF with Data2G'
arch=(x86_64 aarch64)
url='https://github.com/baitisj/ragtime'
license=(MIT)
depends=(glibc libgcc libstdc++ glib2 gtk3 hamlib libpipewire pango wxwidgets-common wxwidgets-gtk3)
makedepends=(cmake ninja)
optdepends=('data2g: data2g-host, the modem Ragtime talks to (can also run on another machine)')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('13452092555fbf840970a0b61e141b0be0167cf48b8d6d74af6bc3a8bf47192f')

build() {
    cmake -S $pkgname-${_tag#v} -B build -G Ninja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DRAGTIME_TESTS=OFF \
        -DRAGTIME_WERROR=OFF
    cmake --build build
}

package() {
    local s=$pkgname-${_tag#v}

    install -Dm755 build/app/ragtime -t "$pkgdir/usr/bin"
    install -Dm644 "$s/packaging/linux/ragtime.desktop" -t "$pkgdir/usr/share/applications"
    install -Dm644 "$s/app/res/ragtime.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "$s/app/res/ragtime.png" -t "$pkgdir/usr/share/icons/hicolor/256x256/apps"
    install -Dm644 "$s/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 "$s/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
