# Maintainer: DragonWoven
pkgname="godots-git"
pkgver=1.3.stable.r6.gc152061
pkgrel=3
pkgdesc="A hub for managing your Godot versions and projects."
url="https://github.com/MakovWait/godots"
license=("MIT")
arch=("x86_64")
provides=('godots')
conflicts=('godots' 'godots-bin')
replaces=()
depends=()
source=("git+https://github.com/MakovWait/godots.git" "https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_export_templates.tpz")
makedepends=('git' 'godot=4.3')
b2sums=()
options=("!strip")
sha256sums=('SKIP' 'f5f10dbaf56a7908349e64b94ea8c2c93c2cc11fb1014c9565b68a2bb437b922')
pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare(){
 sed -i "s|custom_template/release=\"\"|custom_template/release=\"$srcdir/templates/linux_release.x86_64\"|" godots/export_presets.cfg

}

build(){
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
