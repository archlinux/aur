# Maintainer: yuna0x0 <yuna@yuna0x0.com>

pkgname=godots
pkgver=1.4.2.stable
pkgrel=2
pkgdesc="A hub for managing your Godot versions and projects."
url="https://github.com/MakovWait/godots"
license=('MIT')
arch=('x86_64')
depends=('unzip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MakovWait/godots/archive/refs/tags/v$pkgver.tar.gz")
makedepends=('godot' 'godot-export-templates-linux')
options=('!strip')
sha256sums=('e7d49fe689770b69240d9b85f05b1fd81598f654fc49c31c972ef6720dee29df')

build() {
    local _template=(/usr/share/godot/export_templates/*/linux_release.x86_64)
    [[ -f ${_template[-1]} ]] || return 1
    sed -i "s|custom_template/release=\"\"|custom_template/release=\"${_template[-1]}\"|" "$pkgname-$pkgver/export_presets.cfg"
    cd "$pkgname-$pkgver"

    mkdir build
    rm -R tests
    godot --headless --export-release "Linux/X11" build/godots
}

package() {
    install -Dm755 "$pkgname-$pkgver/build/godots" "$pkgdir/usr/bin/godots"

    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$pkgname-$pkgver/icon.svg" "$pkgdir/usr/share/pixmaps/$pkgname.svg"
    install -Dm644 "$pkgname-$pkgver/packaging/linux/io.github.MakovWait.Godots.desktop" "$pkgdir/usr/share/applications/io.github.MakovWait.Godots.desktop"
}
