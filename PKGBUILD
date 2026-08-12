# Maintainer: yuna0x0 <yuna@yuna0x0.com>
# Contributor: Novadragon <me@novadragon.space>
# Contributor: DragonWoven

pkgname=godots-git
pkgver=1.4.2.stable.r0.g8e4eb2b
pkgrel=2
pkgdesc="A hub for managing your Godot versions and projects."
url="https://github.com/MakovWait/godots"
license=('MIT')
arch=('x86_64')
provides=("godots=$pkgver-$pkgrel")
conflicts=('godots')
depends=('unzip')
source=("git+https://github.com/MakovWait/godots.git")
makedepends=('git' 'godot' 'godot-export-templates-linux')
options=('!strip' '!debug')
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 --match='*stable*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir -p data/godot
    ln -sfn /usr/share/godot/export_templates data/godot/export_templates
    cd "${pkgname%-git}"

    mkdir -p build
    rm -rf tests
    XDG_DATA_HOME="$srcdir/data" godot --headless --export-release "Linux/X11" build/godots
}

package() {
    install -Dm755 "${pkgname%-git}/build/godots" "$pkgdir/usr/bin/godots"

    install -Dm644 "${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "${pkgname%-git}/icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.svg"
    install -Dm644 "${pkgname%-git}/packaging/linux/io.github.MakovWait.Godots.desktop" "$pkgdir/usr/share/applications/io.github.MakovWait.Godots.desktop"
}
