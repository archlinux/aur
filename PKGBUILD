# MAINTAINER username227 gfrank227[at]gmail[dot]com
# MAINTAINER qu1ck anlutsenko[at]gmail[dot]com
pkgname=trgui-ng-git
pkgver=r460.a377568
pkgrel=2
pkgdesc='Remote GUI for Transmission torrent daemon'
url="https://github.com/openscopeproject/TrguiNG"
arch=('x86_64')
license=('AGPL-3.0')
provides=('trgui-ng-git')
conflicts=('trgui-ng' 'trgui-ng-bin')
depends=('alsa-lib' 'cairo' 'desktop-file-utils' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'libsoup' 'openssl' 'webkit2gtk-4.1')
makedepends=('rust>=1.70.0' 'nodejs>=16.0.0' 'npm' 'git')
source=("TrguiNG::git+https://github.com/openscopeproject/TrguiNG"
        "https://github.com/openscopeproject/TrguiNG/releases/download/v1.5.0/dbip.mmdb"
        "TrguiNG.desktop"::"https://raw.githubusercontent.com/flathub/org.openscopeproject.TrguiNG/master/org.openscopeproject.TrguiNG.desktop")
noextract=('dbip.mmdb')
sha256sums=('SKIP'
            '15291b7961766f54fc1ff8afac4189a67850920cd8b555b3dc6ddf9d02fc3ada'
            'b349711b9c7c2df5d328fc1b29c31174389fce7b53869b7b3c5c305f2cc0e5bd')
options=('!lto' '!debug')

pkgver() {
  cd "$srcdir/TrguiNG"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
   cd $srcdir/TrguiNG
   cp "../dbip.mmdb" "src-tauri/dbip.mmdb"
}

build()	{
	cd "$srcdir/TrguiNG"

	npm install
	npm run build -- -b
}

package() {
	install -dm755 "$pkgdir/usr/bin"
	install -dm755 "$pkgdir/usr/lib/trgui-ng"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
	install -dm755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"
	install -Dm755 "$srcdir/TrguiNG/src-tauri/target/release/TrguiNG" "$pkgdir/usr/bin/TrguiNG"
	install -Dm644 "$srcdir/TrguiNG/src-tauri/dbip.mmdb" "$pkgdir/usr/lib/trgui-ng/dbip.mmdb"
	install -Dm755 "$srcdir/TrguiNG.desktop" "$pkgdir/usr/share/applications/TrguiNG.desktop"
	install -Dm644 "$srcdir/TrguiNG/src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/TrguiNG.png"
	install -Dm644 "$srcdir/TrguiNG/src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/TrguiNG.png"
	install -Dm644 "$srcdir/TrguiNG/src-tauri/icons/app.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/TrguiNG.svg"
}
