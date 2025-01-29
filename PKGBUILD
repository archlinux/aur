# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Maintainer: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andreas Baumann <mail@andreasbaumann.cc>
 
pkgname=thunderbird-esr-bin
_pkgname=thunderbird
pkgver=128.6.1
_major=${pkgver/rc*}
_build=${pkgver/*rc}
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
  thunderbird-${pkgver}esr-x86_64.tar.bz2::https://ftp.mozilla.org/pub/thunderbird/releases/${pkgver}esr/linux-x86_64/en-US/thunderbird-${pkgver}esr.tar.bz2
  thunderbird-${pkgver}esr-x86_64.tar.bz2.asc::https://ftp.mozilla.org/pub/thunderbird/releases/${pkgver}esr/linux-x86_64/en-US/thunderbird-${pkgver}esr.tar.bz2.asc
)
source_pentium4=(
  thunderbird-${pkgver}esr-pentium4.tar.bz2::https://ftp.mozilla.org/pub/thunderbird/releases/${pkgver}esr/linux-i686/en-US/thunderbird-${pkgver}esr.tar.bz2
  thunderbird-${pkgver}esr-pentium4.tar.bz2.asc::https://ftp.mozilla.org/pub/thunderbird/releases/${pkgver}esr/linux-i686/en-US/thunderbird-${pkgver}esr.tar.bz2.asc
)
source_i686=(
  thunderbird-${pkgver}esr-i686.tar.bz2::https://ftp.mozilla.org/pub/thunderbird/releases/${pkgver}esr/linux-i686/en-US/thunderbird-${pkgver}esr.tar.bz2
  thunderbird-${pkgver}esr-i686.tar.bz2.asc::https://ftp.mozilla.org/pub/thunderbird/releases/${pkgver}esr/linux-i686/en-US/thunderbird-${pkgver}esr.tar.bz2.asc
)

sha512sums=('6813e1dfd43c67ad7517714988ac27e7fdfe4857c8e6612c165a8aa89fa013c5ab4f270c13945010422d3bda82a7b7cd5496eaa5cb5524f6b2fa1732e59fd737'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')
sha512sums_x86_64=('0255e237b390705327b8864bb55a7febf36d0bd1eb5d18c8b3c75663c7a1641bd97081403b7638733cc975c2bfc101c479afa51c0e44f7fc26f8a8eb3a02d97d'
                   'SKIP')
sha512sums_pentium4=('b1d8d558bb032585afe9b65001015a62e8706bc4df6cab604494be57d7335faf450309a7d42789442ab62ba6bab3b6251dde7549c0f113a2e1adaab9cbd8ca6e'
                     'SKIP')
sha512sums_i686=('b1d8d558bb032585afe9b65001015a62e8706bc4df6cab604494be57d7335faf450309a7d42789442ab62ba6bab3b6251dde7549c0f113a2e1adaab9cbd8ca6e'
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
