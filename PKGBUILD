# Maintainer: Det <nimetonmaili g-mail>
# Based on [extra]'s thunderbird

pkgname=thunderbird-beta-bin
pkgver=56.0b2
_major=${pkgver/rc*}
_build=${pkgver/*rc}
pkgrel=1
pkgdesc="Standalone Mail/News reader - Bleeding edge binary version"
arch=('i686' 'x86_64')
url="https://www.mozilla.org/thunderbird"
license=('GPL' 'LGPL' 'MPL')
depends=('dbus-glib' 'gtk3' 'libxt' 'nss')
optdepends=('libcanberra: for sound support')
provides=("thunderbird=$pkgver")
conflicts=('thunderbird-beta')
install=$pkgname.install
source=('thunderbird-beta-bin.desktop'
        'vendor.js')
source_i686=("https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-i686/en-US/thunderbird-$pkgver.tar.bz2")
source_x86_64=("https://ftp.mozilla.org/pub/thunderbird/releases/$pkgver/linux-x86_64/en-US/thunderbird-$pkgver.tar.bz2")
sha512sums=('e5649ddee3ca9cfdcf56652e9c8e6160d52c69d1439f9135b0c0d436ce61a25f17758afc0dd6cac3434c26234c584828eb07fdf9604797f7dd3f617ec194b79a'
            'aeb444784732267f1b1e87e6084a776f82a1912c4c2637d2cf1de1c135dd9d41d2ef66d2bd3f9cbd3a79fad32d17ea6e2968ba644d5f887cb66ba6c09a2098f5')
sha512sums_i686=('ec1bf3eb5e1ffd4c2049ca990ca03152b118b309ce65b3447582fad5946532ff36a57e8d8914b36a974b03ff82b31e57ac5bff66f88adea71dbf91e1e6f69da8')
sha512sums_x86_64=('b448e2940d9bbab3eeee336b628f47f13e1500d492f3cdfb6f6c48720f11454c371bd99484e7bda152405d2384e7ce9bb40610a693d82ac6992c78f9c4571187')
# RC
if [[ $_build = ? ]]; then
  source_i686=("https://ftp.mozilla.org/pub/thunderbird/candidates/$_major-candidates/build$_build/linux-i686/en-US/thunderbird-$_major.tar.bz2")
  source_x86_64=("https://ftp.mozilla.org/pub/thunderbird/candidates/$_major-candidates/build$_build/linux-x86_64/en-US/thunderbird-$_major.tar.bz2")
fi

package() {
  # Create directories
  msg2 "Creating directory structure..."
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/applications
  install -d "$pkgdir"/opt

  msg2 "Moving stuff in place..."
  # Install
  cp -r thunderbird/ "$pkgdir"/opt/thunderbird-beta

  # vendor.js
  _vendorjs="$pkgdir/opt/thunderbird-beta/defaults/preferences/vendor.js"
  install -Dm644 /dev/stdin "$_vendorjs" <<END
// Use LANG environment variable to choose locale
pref("intl.locale.matchOS", true);

// Disable default mailer checking.
pref("mail.shell.checkDefaultMail", false);

// Don't disable our bundled extensions in the application directory
pref("extensions.autoDisableScopes", 11);
pref("extensions.shownSelectionUI", true);
END

  # Icons
  for i in 16 22 24 32 48 256; do
    install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
    ln -s /opt/thunderbird-beta/chrome/icons/default/default$i.png \
          "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/thunderbird-beta.png
  done
  
  # Desktop
  install -m644 $pkgname.desktop "$pkgdir"/usr/share/applications/

  # /usr/bin symlink
  ln -s /opt/thunderbird-beta/thunderbird "$pkgdir"/usr/bin/thunderbird-beta
}