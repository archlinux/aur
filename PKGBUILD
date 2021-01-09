# Maintainer: Mathijs van Westendorp <mathijs at vanwestendorp dot org>
# Contributor: Jason Huang <jasonhuang20035 at gmail dot com>

# Based on the zotero PKGBUILD

pkgname=jurism
pkgver=5.0.93m18
pkgrel=1
pkgdesc="Juris-M Standalone. Is a variant of Zotero, with legal and multilingual support."
arch=('x86_64')
url="https://juris-m.github.io/downloads"
license=('AGPL3')
depends=('dbus-glib' 'gtk3' 'nss' 'libxt')

sha256sums=('e77753174477bfd22d9b983e9e53954e9579e944c2b62bf32fcbdf17f1b36281')
sha256sums_x86_64=('0bd8a76cfbe776afb41ba12627a57cd99d06aa7843282137cff73710c8858d0d')

install='jurism.install'

source=("jurism.desktop")
source_x86_64=("Jurism-${pkgver}_linux_$CARCH.tar.bz2::https://our.law.nagoya-u.ac.jp/jurism/dl?channel=release&platform=linux-$CARCH&version=${pkgver}")

package() {
  install -dDm755 "$pkgdir"/usr/{bin,lib/jurism}
  mv "$srcdir"/Jurism_linux-$CARCH/* "$pkgdir"/usr/lib/jurism
  ln -s /usr/lib/jurism/jurism "$pkgdir"/usr/bin/jurism
  install -Dm644 "$srcdir"/jurism.desktop "$pkgdir"/usr/share/applications/jurism.desktop
  # Copy jurism icons to a standard location
  install -Dm644 "$pkgdir"/usr/lib/jurism/chrome/icons/default/default16.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/jurism.png
  install -Dm644 "$pkgdir"/usr/lib/jurism/chrome/icons/default/default32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/jurism.png
  install -Dm644 "$pkgdir"/usr/lib/jurism/chrome/icons/default/default48.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/jurism.png
  install -Dm644 "$pkgdir"/usr/lib/jurism/chrome/icons/default/default256.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/jurism.png
  # Disable APP update
  sed -i '/pref("app.update.enabled", true);/c\pref("app.update.enabled", false);' "$pkgdir"/usr/lib/jurism/defaults/preferences/prefs.js
  # No need to keep a shell around when launching Juris-M
  sed -i -r 's/^("\$CALLDIR\/jurism-bin" -app "\$CALLDIR\/application.ini" "\$@")/exec \1/' "$pkgdir"/usr/lib/jurism/jurism
}
