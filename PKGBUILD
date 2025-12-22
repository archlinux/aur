# Maintainer: yuna0x0 <yuna@yuna0x0.com>
# Contributor: Novadragon <me@novadragon.space>
# Contributor: DragonWoven

: ${_godot_version:=$(LC_ALL=C pacman -Si extra/godot | grep -Pom1 '^Version\s+:\s+\K\S+(?=-[0-9])').stable}
pkgname=godots-git
pkgver=1.4.stable.r1.g72d4df0
pkgrel=1
pkgdesc="A hub for managing your Godot versions and projects."
url="https://github.com/MakovWait/godots"
license=('MIT')
arch=('x86_64')
provides=("godots=$pkgver-$pkgrel")
conflicts=('godots' 'godots-bin')
depends=('unzip')
source=("git+https://github.com/MakovWait/godots.git")
makedepends=('git' 'godot' 'godot-export-templates-linux')
options=('!strip')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    sed -i "s|custom_template/release=\"\"|custom_template/release=\"/usr/share/godot/export_templates/${_godot_version}/linux_release.x86_64\"|" godots/export_presets.cfg
    cd "${pkgname%-git}"

    mkdir build
    rm -R tests
    godot --headless --export-release "Linux/X11" build/godots
}

package() {
    install -Dm755 "${pkgname%-git}/build/godots" "$pkgdir/usr/bin/godots"

    install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "${pkgname%-git}/icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.svg"
    install -Dm644 "${pkgname%-git}/packaging/linux/io.github.MakovWait.Godots.desktop" "$pkgdir/usr/share/applications/io.github.MakovWait.Godots.desktop"
}
