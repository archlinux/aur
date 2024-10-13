# Maintainer: Maxim Kovkel
pkgname="godots-git"
pkgver=1.3.stable.r6.gc152061
pkgrel=1
pkgdesc=" A hub for managing your Godot versions and projects."
url="https://github.com/MakovWait/godots"
license=("MIT")
arch=("x86_64")
provides=()
conflicts=('godots' 'godots-bin')
replaces=()
depends=()
source=("git+https://github.com/MakovWait/godots.git")
makedepends=('git' 'godot=4.3' 'curl')
b2sums=()
options=("!strip")
sha256sums=('SKIP')
pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare(){
 cd "${pkgname%-git}"
 curl -o template.tpz https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_export_templates.tpz
}
build(){
 cd "${pkgname%-git}"
 sed -i "s|custom_template/release=\"\"|custom_template/release=\"$(pwd)/template.tpz\"|" export_presets.cfg
 mkdir build
 godot --headless --export-debug "Linux/X11" build/godot

}

package(){
 install -Dm644 "${pkgname%-git}/icon.svg" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.svg"
 install -Dm644 "../godots.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
 install -Dm755  "${pkgname%-git}/build/godot"  "$pkgdir/usr/bin/godots"
}
