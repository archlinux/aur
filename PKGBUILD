# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andreas Baumann <mail@andreasbaumann.cc>
 
pkgname=thunderbird-esr-bin
_pkgname=thunderbird
pkgver=140.14.0
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

sha512sums=('510ac3042dffcaf40938047906f3beaf6d51f4d64e65ab302abe11e6a6018289a62586ee7b162ca6b587bd7390efe453f17919fcdbb940590334bc72c9d292b6'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')
sha512sums_x86_64=('bba64d64b087e1dcc2000240995a267aa9097d7f79c6f6bd743a6631a91f1205533296ae77f2a2c97ad68f9532b3dd4d7133d2440aff04918667ec2509753586'
                   'SKIP')
sha512sums_pentium4=('5bc2c5ef7c8d490a7b930d4f709918a5ba1cf1f0c07744981f70b67625d282d4f7b605295768d186074e382c08d94e43d29fcdacc82f2fa6d3b283dc02985ab5'
                     'SKIP')
sha512sums_i686=('5bc2c5ef7c8d490a7b930d4f709918a5ba1cf1f0c07744981f70b67625d282d4f7b605295768d186074e382c08d94e43d29fcdacc82f2fa6d3b283dc02985ab5'
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
