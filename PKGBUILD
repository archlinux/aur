# Maintainer: Luis Vervaet <luisvervaet@gmail.com>

pkgname=zen-twilight-bin
_pkgname=zen-twilight
_realpkgver=twilight-1
_desktopname=zen-twilight
pkgver=1.23t.2026.09.06
pkgrel=1
pkgdesc="Official package for Zen's nightly release, a privacy-focused, feature packed Firefox-based web browser"
arch=('x86_64' 'aarch64')
url="https://github.com/zen-browser/desktop"
license=(MPL-2.0)
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font systemd ffmpeg)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!strip)
provides=("zen-twilight=$pkgver")
conflicts=('zen-twilight')

source_x86_64=("zen-browser-twilight-$pkgver-$pkgrel-x86_64.tar.xz::https://github.com/zen-browser/desktop/releases/download/$_realpkgver/zen.linux-x86_64.tar.xz")
source_aarch64=("zen-browser-twilight-$pkgver-$pkgrel-aarch64.tar.xz::https://github.com/zen-browser/desktop/releases/download/$_realpkgver/zen.linux-aarch64.tar.xz")

source=("$_pkgname.sh"
        "$_desktopname.desktop"
        "policies.json")
sha256sums=('b26c2221dc9ee8b6041aea31ae7b030bf9de5facc9933109f829559bd1bdb4fb'
            '3c8dfd8d12a6ac0c106b7d738718df37e979275c1dc85aa678f6b10b9ca8603c'
            'fd9572d178ea1a5edf427ca85bad3fb2d83be2e250e62bad13951d70d977bd0f')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  # Create directories
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/applications
  mkdir -p "$pkgdir"/opt

  # Install
  cp -r zen/ "$pkgdir"/opt/$pkgname

  # Launchers
  install -m755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname

  # Desktops
  install -m644 *.desktop "$pkgdir"/usr/share/applications/

  # Icons
  for i in 16x16 32x32 48x48 64x64 128x128; do
    install -d "$pkgdir"/usr/share/icons/hicolor/$i/apps/
    ln -s /opt/$pkgname/browser/chrome/icons/default/default${i/x*}.png \
          "$pkgdir"/usr/share/icons/hicolor/$i/apps/$_pkgname.png
  done

  # Use system-provided dictionaries
  ln -Ts /usr/share/hunspell "$pkgdir"/opt/$pkgname/dictionaries
  ln -Ts /usr/share/hyphen "$pkgdir"/opt/$pkgname/hyphenation

  # Use system certificates
  ln -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$pkgname/libnssckbi.so

  # Disable update checks (managed by pacman)
  mkdir "$pkgdir"/opt/$pkgname/distribution
  install -m644 "$srcdir"/policies.json "$pkgdir"/opt/$pkgname/distribution/
}
