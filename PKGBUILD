# Maintainer: opecko <https://github.com/opecko>
# AUR package: repackages the .deb from the GitHub release. Updated by scripts/aur.sh.
pkgname=ytdesk-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="YouTube Music desktop client (prebuilt)"
url='https://github.com/opecko/ytdesk'
arch=('x86_64')
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'dbus' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav' 'libayatana-appindicator')
optdepends=('nodejs: JS runtime for the yt-dlp playback fallback'
            'gnome-keyring: stores the login cookie (Secret Service)')
provides=('ytdesk')
conflicts=('ytdesk')
options=('!strip' '!debug')
source=("https://github.com/opecko/ytdesk/releases/download/v$pkgver/ytdesk_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/opecko/ytdesk/v$pkgver/LICENSE")
noextract=("ytdesk_${pkgver}_amd64.deb")
sha256sums=('2d4e7436ac023af27c5a0067bf9b6ee6e076a9bc0f411f1e166da6ef7acc1324'
            'd8246ddc68471e6f5d5eb2bc54b9fb5878d6c362a7d99df0dd8193ec48cbdcce')

prepare() {
  bsdtar -xf "ytdesk_${pkgver}_amd64.deb" data.tar.gz
}

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
  # Tauri names the 2x icon dir "256x256@2"; use the standard hicolor size dir.
  if [ -d "$pkgdir/usr/share/icons/hicolor/256x256@2" ]; then
    mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256"
    mv "$pkgdir/usr/share/icons/hicolor/256x256@2/apps" "$pkgdir/usr/share/icons/hicolor/256x256/"
    rmdir "$pkgdir/usr/share/icons/hicolor/256x256@2"
  fi
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
