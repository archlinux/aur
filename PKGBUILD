# Maintainer: Felix Golatofski <contact@xdfr.de>

pkgname=thunderbird-bin
_pkgname=thunderbird
pkgver=78.6.0
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone Mail/News reader - Bleeding edge binary version"
arch=('x86_64' 'i686')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss')
optdepends=('hunspell: Spell checking'
            'hyphen: Hyphenation'
            'libcanberra: Sound support')
provides=("thunderbird=$pkgver")
conflicts=('thunderbird')
install=$pkgname.install
source=('thunderbird-bin.desktop'
        'vendor.js')
source_x86_64=(https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-x86_64/en-US/thunderbird-$pkgver.tar.bz2{,.asc})
source_i686=(https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-i686/en-US/thunderbird-$pkgver.tar.bz2{,.asc})

sha512sums=('2f2da27d0d677cfee9ed2ff9da74c4e779150d26e369cb6816f2b1962b38af7d0728c9c362304138212b45e9580f65847c3a011b9bd3417a26b1b48c00cabe8d'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')
sha512sums_x86_64=('a4cb67ff69363e89ffcd9b35a292b20a9351b8a817710dd82b2fdbb8e057ab8d71d6c371d60ea5ea8d42707c3484cc3ff7cbd0e004aefbc178ddf2ae7a0e697e'
                   'SKIP')
sha512sums_i686=('a4cb67ff69363e89ffcd9b35a292b20a9351b8a817710dd82b2fdbb8e057ab8d71d6c371d60ea5ea8d42707c3484cc3ff7cbd0e004aefbc178ddf2ae7a0e697e'
                 'SKIP')
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
