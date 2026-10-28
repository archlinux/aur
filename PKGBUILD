# Maintainer: opecko <https://github.com/opecko>
# AUR package: repackages the .deb from the GitHub release. Updated by scripts/aur.sh.
pkgname=sonolith-bin
pkgver=2.4.0
pkgrel=1
pkgdesc="YouTube Music desktop client (prebuilt)"
url='https://github.com/opecko/sonolith'
arch=('x86_64')
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'dbus' 'gst-plugins-base' 'gst-plugins-good' 'gst-libav' 'libayatana-appindicator')
optdepends=('nodejs: JS runtime for the yt-dlp playback fallback'
            'gnome-keyring: stores the login cookie (Secret Service)')
# Sonolith was called ytdesk until 2.2.0. The ytdesk packages of the same version are transitional (empty, they
# depend on this one), so only the real old ones conflict.
provides=('sonolith' 'ytdesk')
conflicts=('sonolith' "ytdesk<$pkgver" "ytdesk-bin<$pkgver")
replaces=('ytdesk-bin')
options=('!strip' '!debug')
source=("https://github.com/opecko/sonolith/releases/download/v$pkgver/sonolith_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/opecko/sonolith/v$pkgver/LICENSE")
noextract=("sonolith_${pkgver}_amd64.deb")
sha256sums=('fdd72542793232f84fe4ecd0a9596a1365ae57d61b72de94bfa6a9af08bdd6d5'
            'd8246ddc68471e6f5d5eb2bc54b9fb5878d6c362a7d99df0dd8193ec48cbdcce')

prepare() {
  bsdtar -xf "sonolith_${pkgver}_amd64.deb" data.tar.gz
}

package() {
  bsdtar -xf data.tar.gz -C "$pkgdir"
  # Tauri names the 2x icon dir "256x256@2"; use the standard hicolor size dir.
  if [ -d "$pkgdir/usr/share/icons/hicolor/256x256@2" ]; then
    mkdir -p "$pkgdir/usr/share/icons/hicolor/256x256"
    mv "$pkgdir/usr/share/icons/hicolor/256x256@2/apps" "$pkgdir/usr/share/icons/hicolor/256x256/"
    rmdir "$pkgdir/usr/share/icons/hicolor/256x256@2"
  fi
  # The old command keeps working for one release.
  ln -s sonolith "$pkgdir/usr/bin/ytdesk"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
