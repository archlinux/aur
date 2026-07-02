# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andreas Baumann <mail@andreasbaumann.cc>
 
pkgname=thunderbird-esr-bin
_pkgname=thunderbird
pkgver=140.12.1
pkgrel=1
pkgdesc="Standalone Mail/News reader - binary version"
arch=('x86_64' 'pentium4' 'i686')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss')
optdepends=('hunspell: Spell checking'
            'hyphen: Hyphenation'
            'libcanberra: Sound support')
provides=("thunderbird=$pkgver")
conflicts=('thunderbird' 'thunderbird-bin')
install=$pkgname.install
options=(!strip !debug)
source=(
  'thunderbird-esr-bin.desktop'
  'vendor.js'
)

source_x86_64=(
  thunderbird-${pkgver}esr-x86_64.tar.xz::https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}esr/linux-x86_64/en-US/thunderbird-${pkgver}esr.tar.xz
  thunderbird-${pkgver}esr-x86_64.tar.xz.asc::https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}esr/linux-x86_64/en-US/thunderbird-${pkgver}esr.tar.xz.asc
)
source_pentium4=(
  thunderbird-${pkgver}esr-pentium4.tar.xz::https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}esr/linux-i686/en-US/thunderbird-${pkgver}esr.tar.xz
  thunderbird-${pkgver}esr-pentium4.tar.xz.asc::https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}esr/linux-i686/en-US/thunderbird-${pkgver}esr.tar.xz.asc
)
source_i686=(
  thunderbird-${pkgver}esr-i686.tar.xz::https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}esr/linux-i686/en-US/thunderbird-${pkgver}esr.tar.xz
  thunderbird-${pkgver}esr-i686.tar.xz.asc::https://archive.mozilla.org/pub/thunderbird/releases/${pkgver}esr/linux-i686/en-US/thunderbird-${pkgver}esr.tar.xz.asc
)

sha512sums=('6813e1dfd43c67ad7517714988ac27e7fdfe4857c8e6612c165a8aa89fa013c5ab4f270c13945010422d3bda82a7b7cd5496eaa5cb5524f6b2fa1732e59fd737'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')
sha512sums_x86_64=('44e05f4ecd2064b31ede3cb6cb85f89ca50d13bf157790d234b9cc666f87c0b725ebe7afc4b94c248b508f7da873414dec3626252116e406558845bf916d69d5'
                   'SKIP')
sha512sums_pentium4=('b155e521724c63cbddecd58b69c51c80b0081b5c5afd7e181fa1246f1d8e3707a7ad6b91eb711ec52e64158bea69b080e457e3b4fb236807ec55330eea657f3c'
                     'SKIP')
sha512sums_i686=('b155e521724c63cbddecd58b69c51c80b0081b5c5afd7e181fa1246f1d8e3707a7ad6b91eb711ec52e64158bea69b080e457e3b4fb236807ec55330eea657f3c'
                 'SKIP')

validpgpkeys=(14F26682D0916CDD81E37B6D61B7B526D98F0353) # Mozilla Software Releases <release@mozilla.com>

package() {
  # Create directories
  msg2 "Creating directory structure..."
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/applications
  install -d "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r thunderbird/ "$pkgdir"/opt/$_pkgname

  # Launchers
  ln -s /opt/$_pkgname/thunderbird "$pkgdir"/usr/bin/$_pkgname
  # breaks application as of 68.0b1
  # ln -sf thunderbird "$pkgdir"/opt/$_pkgname/thunderbird-esr-bin

  # vendor.js
  _vendorjs="$pkgdir/opt/$_pkgname/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default mailer checking.
pref("mail.shell.checkDefaultMail", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
END

  # Desktop
  install -m644 $pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop

  # Icons
  for i in 16 22 24 32 48 256; do
    install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
    ln -s /opt/$_pkgname/chrome/icons/default/default$i.png \
          "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
  done

  # Use system-provided dictionaries
  # rm -r "$pkgdir"/opt/$_pkgname/dictionaries # Not in 68.0
  ln -Ts /usr/share/hunspell "$pkgdir"/opt/$_pkgname/dictionaries
  ln -Ts /usr/share/hyphen "$pkgdir"/opt/$_pkgname/hyphenation

  # Use system certificates
  ln -sf /usr/lib/libnssckbi.so "$pkgdir"/opt/$_pkgname/libnssckbi.so
}
