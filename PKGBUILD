# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Maintainer: Luna Jernberg <droidbittin@gmail.com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=thunderbird-bin
_pkgname=thunderbird
pkgver=102.11.2
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=2
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
source=(
  'thunderbird-bin.desktop'
  'vendor.js'
)
source_x86_64=(
  thunderbird-$pkgver-x86_64.tar.bz2::https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-x86_64/en-US/thunderbird-$pkgver.tar.bz2{,.asc}
)
source_pentium4=(
  thunderbird-$pkgver-pentium4.tar.bz2::https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-i686/en-US/thunderbird-$pkgver.tar.bz2{,.asc}
)
source_i686=(
  thunderbird-$pkgver-i686.tar.bz2::https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-i686/en-US/thunderbird-$pkgver.tar.bz2{,.asc}
)

sha512sums=('6813e1dfd43c67ad7517714988ac27e7fdfe4857c8e6612c165a8aa89fa013c5ab4f270c13945010422d3bda82a7b7cd5496eaa5cb5524f6b2fa1732e59fd737'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')
sha512sums_x86_64=('900badabb48f4cf480e83e1dd77c03db82c1625565ffb483e2c3ba55a775f676f25c0b9915fdfed2ffdef040dc054bbb68d44629fa199ebe28729f9be6c83a97'
                   '900badabb48f4cf480e83e1dd77c03db82c1625565ffb483e2c3ba55a775f676f25c0b9915fdfed2ffdef040dc054bbb68d44629fa199ebe28729f9be6c83a97')
sha512sums_pentium4=('3e3020511de9cb03c274d652894daafe669b06848aa43dd5a8d9277c2a330f9074809bbb76b019141bd47e6f52a3daa95abdef56b7a8aed99a67c0684d85f31c'
                     '3e3020511de9cb03c274d652894daafe669b06848aa43dd5a8d9277c2a330f9074809bbb76b019141bd47e6f52a3daa95abdef56b7a8aed99a67c0684d85f31c')
sha512sums_i686=('3e3020511de9cb03c274d652894daafe669b06848aa43dd5a8d9277c2a330f9074809bbb76b019141bd47e6f52a3daa95abdef56b7a8aed99a67c0684d85f31c'
                 '3e3020511de9cb03c274d652894daafe669b06848aa43dd5a8d9277c2a330f9074809bbb76b019141bd47e6f52a3daa95abdef56b7a8aed99a67c0684d85f31c')

validpgpkeys=(14F26682D0916CDD81E37B6D61B7B526D98F0353) # Mozilla Software Releases <release@mozilla.com>

# RC
if [[ $_build = ? ]]; then
  source[0]="thunderbird-$pkgver.tar.bz2::https://ftp.mozilla.org/pub/thunderbird/candidates/$_major-candidates/build$_build/linux-x86_64/en-US/thunderbird-$_major.tar.bz2"
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
