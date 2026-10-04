# Maintainer: Simon Schubert <simon@librem.one>
#
# Authenticator as an app: the QML tree in /usr/share/moarchy-authenticator,
# started by /usr/bin/moarchy-authenticator. That launcher opens it in the
# running Omarchy shell when the plugin is installed there, and as its own
# Quickshell process everywhere else -- so this package needs Quickshell, not
# Omarchy.
#
# The codes are worked out in the app's own JavaScript (SHA-1, SHA-256,
# SHA-512 and HMAC, checked in check() against RFC 6238's table), so there
# is no oathtool and no Python behind it.
pkgname=moarchy-authenticator
pkgver=0.1.0
pkgrel=1
pkgdesc='Two-factor sign-in codes (TOTP), one tap from the clipboard, for Quickshell'
arch=('any')
url='https://github.com/SimonSchubert/moarchy-apps'
license=('MIT')
# qt6-declarative (QtQuick) comes with quickshell. The kit's icons are Nerd
# Font glyphs, which namcap cannot see, so it calls that dependency unneeded.
depends=('quickshell' 'ttf-jetbrains-mono-nerd' 'hicolor-icon-theme')
optdepends=('grim: scan a QR code off the screen'
            'slurp: scan a QR code off the screen'
            'zbar: scan a QR code off the screen')
# A release asset that packaging/release.sh builds from apps/authenticator at
# the tag, with shared/kit in place of the kit link.
source=("$url/releases/download/authenticator-v$pkgver/$pkgname-$pkgver.tar.gz")
# Pinned in the commit after the tag, as every app's here is.
sha256sums=('4bfdfd11776d4865619decb865c82e47d2599741c48f157eb8d26addd8470a49')

check() {
  cd "$pkgname-$pkgver"
  # The hashes against RFC 6238, the links, the export and the file. No
  # display needed.
  QT_QPA_PLATFORM=offscreen /usr/lib/qt6/bin/qmltestrunner -input tests
}

package() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/share/$pkgname/kit"
  install -m644 manifest.json ./*.qml ./*.js icon.svg "$pkgdir/usr/share/$pkgname/"
  install -m644 kit/*.qml kit/*.js "$pkgdir/usr/share/$pkgname/kit/"

  install -Dm755 bin/moarchy-authenticator "$pkgdir/usr/bin/moarchy-authenticator"
  install -Dm644 org.moarchy.Authenticator.desktop \
    "$pkgdir/usr/share/applications/org.moarchy.Authenticator.desktop"
  install -Dm644 icon.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/org.moarchy.Authenticator.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
