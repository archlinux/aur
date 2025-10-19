pkgname=twintaillauncher-git
_pkgname="${pkgname%-git}"
pkgver=r468.ee85eeb
pkgrel=1
pkgdesc='A multi-platform launcher for your anime games'
arch=('x86_64')
license=('GPL-3.0-only')
url=https://github.com/TwintailTeam/TwintailLauncher
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'pango' 'webkit2gtk-4.1' 'libappindicator-gtk3' 'libayatana-appindicator')
makedepends=('git' 'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg' 'cargo' 'pnpm' 'nodejs')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "twintaillauncher-bin")
source=("${_pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')
options=('!lto' '!debug')

prepare() {
	cd $_pkgname
	pnpm i
}

build() {
	cd $_pkgname
	pnpm build:native --no-bundle
}

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package(){
	install -Dm644 $_pkgname/LICENSE -t $pkgdir/usr/share/licenses/$pkgname
	install -Dm755 $_pkgname/src-tauri/target/release/resources/mangohud_default.conf -t $pkgdir/usr/lib/twintaillauncher/resources/
	install -Dm755 $_pkgname/src-tauri/target/release/resources/krpatchz -t $pkgdir/usr/lib/twintaillauncher/resources/
	install -Dm755 $_pkgname/src-tauri/target/release/resources/hpatchz -t $pkgdir/usr/lib/twintaillauncher/resources/
	install -Dm755 $_pkgname/src-tauri/target/release/resources/7zr -t $pkgdir/usr/lib/twintaillauncher/resources/
	install -Dm755 $_pkgname/src-tauri/target/release/resources/reaper -t $pkgdir/usr/lib/twintaillauncher/resources/
	install -Dm644 $_pkgname/src-tauri/target/release/resources/hkrpg_patch.dll -t $pkgdir/usr/lib/twintaillauncher/resources/
	install -Dm755 $_pkgname/src-tauri/target/release/twintaillauncher -t $pkgdir/usr/bin
	install -Dm644 $_pkgname/twintaillauncher.desktop -t $pkgdir/usr/share/applications
	install -Dm644 $_pkgname/src-tauri/icons/32x32.png $pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname.png
	install -Dm644 $_pkgname/src-tauri/icons/128x128.png $pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png
	install -Dm644 $_pkgname/src-tauri/icons/128x128@2x.png $pkgdir/usr/share/icons/hicolor/256x256@2/apps/$_pkgname.png
}
