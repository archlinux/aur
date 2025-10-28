# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Maintainer: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Andreas Baumann <mail@andreasbaumann.cc>
 
pkgname=thunderbird-bin
_pkgname=thunderbird
pkgver=144.0.1
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
conflicts=('thunderbird')
install=$pkgname.install
options=(!strip !debug)
source=(
  'thunderbird-bin.desktop'
  'vendor.js'
)
source_x86_64=(
  thunderbird-$pkgver-x86_64.tar.xz::https://archive.mozilla.org/pub/thunderbird/releases/144.0.1/linux-x86_64/en-US/thunderbird-144.0.1.tar.xz
#thunderbird-$pkgver-x86_64.tar.xz.asc::https://archive.mozilla.org/pub/thunderbird/releases/144.0.1/linux-x86_64/thunderbird-$pkgver.tar.xz.asc
)
source_pentium4=(
  thunderbird-$pkgver-pentium4.tar.xz::https://archive.mozilla.org/pub/thunderbird/releases/144.0.1/linux-i686/en-US/thunderbird-144.0.1.tar.xz
#thunderbird-$pkgver-pentium4.tar.xz.asc::https://archive.mozilla.org/pub/thunderbird/releases/144.0.1/linux-i686/thunderbird-$pkgver.tar.xz.asc
)
source_i686=(
  thunderbird-$pkgver-i686.tar.xz::https://archive.mozilla.org/pub/thunderbird/releases/144.0.1/linux-i686/en-US/thunderbird-144.0.1.tar.xz
#thunderbird-$pkgver-i686.tar.xz.asc::https://archive.mozilla.org/pub/thunderbird/releases/144.0.1/thunderbird-$pkgver.tar.xz.asc
)

validpgpkeys=(14F26682D0916CDD81E37B6D61B7B526D98F0353) # Mozilla Software Releases <release@mozilla.com>

sha512sums=('6813e1dfd43c67ad7517714988ac27e7fdfe4857c8e6612c165a8aa89fa013c5ab4f270c13945010422d3bda82a7b7cd5496eaa5cb5524f6b2fa1732e59fd737'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')
sha512sums_x86_64=('33d7fc4c22e4871a31857bd1b43aff0bdd9b50578521352104524e4835657add26ee14d8083e843f9dc50f9fbaf4e673e7f771db9e96bb6afa1e59a4ec48e477')
sha512sums_pentium4=('92592613ca0aeb8e48750ca32c2af4f71735b39b3cc0e935a03bb70c75b29b664cc94489acb8a155be43278885bb00bb6c53e2b7e517ad6ba0ced55538f3d1d7')
sha512sums_i686=('92592613ca0aeb8e48750ca32c2af4f71735b39b3cc0e935a03bb70c75b29b664cc94489acb8a155be43278885bb00bb6c53e2b7e517ad6ba0ced55538f3d1d7')



# RC
if [[ $_build = ? ]]; then
  source[0]="thunderbird-$pkgver.tar.xz::https://ftp.mozilla.org/pub/thunderbird/candidates/136.0-candidates/build3/linux-x86_64/en-US/thunderbird-$_pkgver.tar.xz"
fi

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
  # ln -sf thunderbird "$pkgdir"/opt/$_pkgname/thunderbird-bin

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
