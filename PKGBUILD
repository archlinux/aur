# Maintainer: Jack <jack@local>

pkgname=zen-browser-hdr-bin
_pkgname=zen-browser
_pkgdir=zen-browser-bin
pkgver=1.21.1b_hdr1
_zenver=1.21.1b-hdr1
pkgrel=1
pkgdesc="Zen Browser fork with Linux Wayland HDR support"
arch=('x86_64')
url="https://github.com/slobodaapl/zen-desktop-hdr-linux"
license=('MPL-2.0')
depends=(
  'gtk3'
  'libxt'
  'mime-types'
  'dbus-glib'
  'nss'
  'ttf-font'
  'systemd'
  'ffmpeg4.4'
)
optdepends=(
  'networkmanager: Location detection via available WiFi networks'
  'libnotify: Notification integration'
  'pulse-native-provider: Audio support'
  'speech-dispatcher: Text-to-Speech'
  'hunspell-en_US: Spell checking, American English'
  'libva-nvidia-driver: NVIDIA VA-API backend used for tested HDR hardware decode path'
  'nvidia-utils: NVIDIA userspace driver libraries'
)
provides=("zen-browser=$pkgver")
conflicts=('zen-browser' 'zen-browser-bin')
options=('!strip' '!debug' '!emptydirs')
source=(
  "${_pkgname}-${pkgver}-${pkgrel}-x86_64.tar.xz::https://github.com/slobodaapl/zen-desktop-hdr-linux/releases/download/v1.21.1b-hdr1/zen-browser-hdr-linux-x86_64.tar.xz"
  "${_pkgname}.sh"
  'zen.desktop'
  'policies.json'
  'LICENSE'
)
sha256sums=(
  '5a255dab7c6578414e1fffcce10305c438fdfa4a6fda6fa41c1a2d22315afdaf'
  '1bd067ddd692ee41ebf23626086c3d2501523e5c839c9411610db5d6ce725f27'
  '61958b910b545374c46e1e43f13413ee8df58499012382f2f058dc02f7c386f3'
  'fd9572d178ea1a5edf427ca85bad3fb2d83be2e250e62bad13951d70d977bd0f'
  'c76f740d1521b9bed9ca7a04ad526c310493c62621b1341d623b431736533b30'
)

package() {
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/opt"

  cp -a "$srcdir/zen" "$pkgdir/opt/$_pkgdir"

  install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/zen.desktop" "$pkgdir/usr/share/applications/zen.desktop"

  local size
  for size in 16x16 32x32 48x48 64x64 128x128; do
    install -d "$pkgdir/usr/share/icons/hicolor/$size/apps"
    ln -s "/opt/$_pkgdir/browser/chrome/icons/default/default${size/x*}.png" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/$_pkgname.png"
  done

  ln -Ts /usr/share/hunspell "$pkgdir/opt/$_pkgdir/dictionaries"
  ln -Ts /usr/share/hyphen "$pkgdir/opt/$_pkgdir/hyphenation"
  ln -sf /usr/lib/libnssckbi.so "$pkgdir/opt/$_pkgdir/libnssckbi.so"

  install -Dm644 "$srcdir/policies.json" "$pkgdir/opt/$_pkgdir/distribution/policies.json"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
