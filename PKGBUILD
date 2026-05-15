# Maintainer: yuna0x0 <yuna@yuna0x0.com>

: ${_godot_version:=$(LC_ALL=C pacman -Si extra/godot | grep -Pom1 '^Version\s+:\s+\K\S+(?=-[0-9])').stable}
pkgname=godots
pkgver=1.4.1.stable
pkgrel=1
pkgdesc="A hub for managing your Godot versions and projects."
url="https://github.com/MakovWait/godots"
license=('MIT')
arch=('x86_64')
conflicts=('godots-bin' 'godots-git')
depends=('unzip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MakovWait/godots/archive/refs/tags/v$pkgver.tar.gz")
makedepends=('godot' 'godot-export-templates-linux')
options=('!strip')
sha256sums=('bb952d8a0ded95aac76909459ac877a4a24861af1a709eac9a06304a67d14b14')

build() {
    sed -i "s|custom_template/release=\"\"|custom_template/release=\"/usr/share/godot/export_templates/${_godot_version}/linux_release.x86_64\"|" $pkgname-$pkgver/export_presets.cfg
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
