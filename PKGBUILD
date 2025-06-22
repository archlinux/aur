# Maintainer: Novadragon <me@novadragon.space>
# Contributor: DragonWoven
pkgname="godots-git"
pkgver=1.3.stable.r34.g5d80ab9
pkgrel=2
pkgdesc="A hub for managing your Godot versions and projects."
url="https://github.com/MakovWait/godots"
license=("MIT")
arch=("x86_64")
provides=('godots')
conflicts=('godots' 'godots-bin')
replaces=()
depends=('unzip')
source=("git+https://github.com/MakovWait/godots.git" "https://github.com/godotengine/godot/releases/download/4.4.1-stable/Godot_v4.4.1-stable_export_templates.tpz")
makedepends=('git' 'godot=4.4.1')
b2sums=()
options=("!strip")
sha256sums=('SKIP' '7a8d14ade489fd4d22f178193021fe8a876a9e51068ed4dde26dac3ae4c59a88')
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
