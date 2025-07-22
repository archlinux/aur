# Maintainer: Novadragon <me@novadragon.space>
# Contributor: DragonWoven

: ${_godot_version:=$(LC_ALL=C pacman -Si extra/godot | grep -Pom1 '^Version\s+:\s+\K\S+(?=-[0-9])').stable}
pkgname="godots-git"
pkgver=1.3.r38.gdbb263b
pkgrel=5
pkgdesc="A hub for managing your Godot versions and projects."
url="https://github.com/MakovWait/godots"
license=("MIT")
arch=("x86_64")
provides=('godots')
conflicts=('godots')
depends=('unzip')
source=("git+https://github.com/MakovWait/godots.git")
makedepends=('git' 'godot' 'godot-export-templates-linux')
options=("!strip")
sha256sums=('SKIP' )


pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 --match='*stable*' \
  | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g;s/\.stable\././'
}

build(){
 sed -i "s|custom_template/release=\"\"|custom_template/release=\"/usr/share/godot/export_templates/${_godot_version}/linux_release.x86_64\"|" godots/export_presets.cfg
 cd "${pkgname%-git}"

 mkdir build
 rm -R tests
 godot --headless --export-release "Linux/X11" build/godots

}

package(){
 install -Dm644 "${pkgname%-git}/icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.svg"
 install -Dm644 "${pkgname%-git}/packaging/linux/io.github.MakovWait.Godots.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
 install -Dm755  "${pkgname%-git}/build/godots"  "$pkgdir/usr/bin/godots"
}
