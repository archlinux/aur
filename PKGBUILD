# Maintainer: Luis Vervaet <luisvervaet@gmail.com>

pkgname=zen-twilight-bin
_pkgname=zen-twilight
_realpkgver=twilight
_desktopname=zen-twilight
pkgver=1.18t.2025.10.18
pkgrel=1
pkgdesc="Unstable Nightly release of the Performance oriented Firefox-based web browser"
arch=('x86_64' 'aarch64')
url="https://github.com/zen-browser/desktop"
license=(MPL-2.0)
depends=(gtk3 libxt mime-types dbus-glib nss ttf-font systemd ffmpeg4.4)
optdepends=('networkmanager: Location detection via available WiFi networks'
            'libnotify: Notification integration'
            'pulseaudio: Audio support'
            'speech-dispatcher: Text-to-Speech'
            'hunspell-en_US: Spell checking, American English')
options=(!strip)
provides=("zen-twilight=$pkgver")
conflicts=('zen-twilight')

source_x86_64=("zen-browser-$_realpkgver-$pkgver-$pkgrel-x86_64.tar.xz::https://github.com/zen-browser/desktop/releases/download/$_realpkgver/zen.linux-x86_64.tar.xz")
source_aarch64=("zen-browser-$_realpkgver-$pkgver-$pkgrel-aarch64.tar.xz::https://github.com/zen-browser/desktop/releases/download/$_realpkgver/zen.linux-aarch64.tar.xz")

source=("$_pkgname.sh"
        "$_desktopname.desktop"
        "policies.json")
sha256sums=('b26c2221dc9ee8b6041aea31ae7b030bf9de5facc9933109f829559bd1bdb4fb'
            '837bfee0672d9548d92da125e28e05089bbd722f0cf48d6d9765a832c610b32c'
            'e977c3d690224dd727d8761d2c0a66ba41bfd02ae0fd7850c4545d06b5a8e63c')
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
