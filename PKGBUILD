# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>
# Contributor: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andreas Baumann <mail@andreasbaumann.cc>
 
pkgname=thunderbird-esr140-bin
_pkgname=thunderbird
pkgver=140.15.0
pkgrel=1
pkgdesc="Standalone Mail/News reader - binary version (frozen on the 140.x ESR train)"
arch=('x86_64' 'pentium4' 'i686')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss')
optdepends=('hunspell: Spell checking'
            'hyphen: Hyphenation'
            'libcanberra: Sound support')
provides=("thunderbird=$pkgver")
conflicts=('thunderbird' 'thunderbird-bin' 'thunderbird-esr-bin')
install=$pkgname.install
options=(!strip !debug)
source=(
  'thunderbird-esr140-bin.desktop'
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
sha512sums_x86_64=('76420b6883bf52e082041100e1c211c1b159538907c137a94dc1c4e38a2656ec860953203908c4099bceff047dbcf91d685ac98f80606a1816a4cf269ba684ee'
                   'SKIP')
sha512sums_pentium4=('9cde679ceb2f16ea128c781f8eeab087430660d47840bf035d526f68c6cc855a30d250f95a2f6598ab1651482c871d1957e56119e4590c1cee81cb3c7cb9fffe'
                     'SKIP')
sha512sums_i686=('9cde679ceb2f16ea128c781f8eeab087430660d47840bf035d526f68c6cc855a30d250f95a2f6598ab1651482c871d1957e56119e4590c1cee81cb3c7cb9fffe'
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
