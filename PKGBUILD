# Maintainer: Amos Onn <amosonn at gmail dot com>

pkgname=firefox-userchromejs
_pkgname=firefox-scripts
pkgver=136
_pkgver=a898ac59fb0ca3886c0c46b184fdbc037c83c037
pkgrel=1
pkgdesc="Patching Firefox to enable JS injection (userchrome-js)"
arch=('any')
depends=('firefox')
url="https://github.com/xiaoxiaoflood/firefox-scripts"
license=('MPL2')
source=(
  "https://codeload.github.com/xiaoxiaoflood/$_pkgname/tar.gz/$_pkgver"
  "https://github.com/user-attachments/files/19132964/chrome.zip"
  "https://github.com/user-attachments/files/18858682/config.zip"
)
sha512sums=(
  'a57f0239fac97e36ad6c86b588db7d49c86d5f0a77a74d5aaa7e45d6d406bd7d3316882010fe2db244f23266ad601cf63cb63ab50078d168e9fcd705f6ccf1ee'
  '0303e7b143cccf1d8218568cefa0c30c633e70ca385af7bc8af204f38605dfa0e99260b4f75fe2d3bbce60202cc54e813a89e20c531edb91751e06f616955f0f'
  '44134b5c226d52341d546e3743d2af65d2f4dc5f56e4ba97315b8208a7fa0c9641a8ac87790622ba9ff908d6ebce1ded5ee06c9ab63810a0ea27eb4202fefecc'
)
install=firefox-userchromejs.install

prepare() {
  # Leave only first dir once changes get merged upstream
  find "$srcdir/$_pkgname-$_pkgver" "$srcdir/chrome" "$srcdir/config.js" -type f -exec chmod 644 "{}" \;
  find "$srcdir/$_pkgname-$_pkgver" "$srcdir/chrome" "$srcdir/config.js" -type d -exec chmod 755 "{}" \;
}

package() {
  install -d "$pkgdir/usr/lib/firefox/browser/defaults/preferences"
  # For some other firefox installations
  #install -d "$pkgdir/usr/lib/firefox/defaults/pref"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -d "$pkgdir/usr/share/$pkgname/base/chrome/utils"
  install -d "$pkgdir/usr/share/$pkgname/misc"

  cd "$srcdir/$_pkgname-$_pkgver/installation-folder"
  install -m 644 config-prefs.js "$pkgdir/usr/lib/firefox/browser/defaults/preferences/"
  # For some other firefox installations
  #install config-prefs.js $pkgdir/usr/lib/firefox/defaults/pref/

  # Delete this cd once changes get merged upstream, join to section above
  cd "$srcdir"
  install -m 644 config.js "$pkgdir/usr/lib/firefox/"

  # Switch to this cd once changes get merged upstream
  #cd "$srcdir/$_pkgname-$_pkgver/chrome"
  cd "$srcdir/chrome/utils"
  install -m 644 BootstrapLoader.js "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  install -m 644 RDFDataSource.sys.mjs "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  install -m 644 RDFManifestConverter.sys.mjs "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  install -m 644 chrome.manifest "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install hookFunction.jsm "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install userChrome.jsm "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  install -m 644 userChrome.js "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  #install xPref.jsm "$pkgdir/usr/share/$pkgname/base/chrome/utils/"
  install -m 644 xPref.mjs "$pkgdir/usr/share/$pkgname/base/chrome/utils/"

  cd "$srcdir/$_pkgname-$_pkgver/"
  install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/"
  install -m 644 README.md "$pkgdir/usr/share/$pkgname/misc/"
  find chrome -type f -exec install -m 644 -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
  find extensions -type f -exec install -m 644 -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
}

# vim:set ts=2 sw=2 et:
