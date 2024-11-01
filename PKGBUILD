# MAINTAINER username227 gfrank227[at]gmail[dot]com
# MAINTAINER qu1ck anlutsenko[at]gmail[dot]com
# This file is generated automatically by CI job at https://github.com/openscopeproject/TrguiNG
pkgname=trgui-ng
pkgver='1.4.0'
pkgrel=3
pkgdesc='Remote GUI for Transmission torrent daemon'
url="https://github.com/openscopeproject/TrguiNG"
arch=('x86_64')
license=('AGPL-3.0')
depends=('alsa-lib' 'cairo' 'desktop-file-utils' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator' 'libsoup' 'openssl' 'webkit2gtk')
makedepends=('rust>=1.70.0' 'nodejs>=16.0.0' 'npm' 'git')
conflicts=('trgui-ng-git' 'trgui-ng-bin')
source=("git+https://github.com/openscopeproject/TrguiNG#tag=v$pkgver"
        "https://github.com/openscopeproject/TrguiNG/releases/download/v$pkgver/dbip.mmdb"
        "TrguiNG.desktop"::"https://raw.githubusercontent.com/flathub/org.openscopeproject.TrguiNG/master/org.openscopeproject.TrguiNG.desktop"
        "0001-Change-webpack-configs-to-mjs.patch")
noextract=('dbip.mmdb')
sha256sums=('d0fea8b3f54282fa28ad589558c4c31ff3c225e14eddc5a4e4c50753e3391eed'
            '0f9a459f66aa99138412213ec9d5a2635ab6e623759a8326f49ea508db0eed62'
            '21bef47c8cddae5365a7af8867d43c25e80db53ec8dbb1940138ad26d02a401a'
            '733b80e9e0adcbbb2d1f5bd1d142e87ceb60397acf7e611b8d5322aecc70fb8a')
options=('!lto')

prepare() {
   cd "$srcdir/TrguiNG"
   patch -p1 < $srcdir/0001-Change-webpack-configs-to-mjs.patch
   cp "../dbip.mmdb" "src-tauri/dbip.mmdb"
  
}

build() {
    cd "$srcdir/TrguiNG"

    npm ci
    npm run build -- -b
}

package() {
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/trgui-ng"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/32x32/apps"
    install -dm755 "$pkgdir/usr/share/icons/hicolor/128x128/apps"
    install -Dm755 "$srcdir/TrguiNG/src-tauri/target/release/trgui-ng" "$pkgdir/usr/bin/trgui-ng"
    install -Dm644 "$srcdir/TrguiNG/src-tauri/dbip.mmdb" "$pkgdir/usr/lib/trgui-ng/dbip.mmdb"
    install -Dm755 "$srcdir/TrguiNG.desktop" "$pkgdir/usr/share/applications/TrguiNG.desktop"
    install -Dm644 "$srcdir/TrguiNG/src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/trgui-ng.png"
    install -Dm644 "$srcdir/TrguiNG/src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/trgui-ng.png"
    install -Dm644 "$srcdir/TrguiNG/src-tauri/icons/app.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/trgui-ng.svg"
}
