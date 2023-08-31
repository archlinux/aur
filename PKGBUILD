# Maintainer: Amos Onn <amosonn at gmail dot com>

pkgname=firefox-userchromejs
_pkgname=firefox-scripts
pkgver=117
_pkgver=b013243f1916576166a02d816651c2cc6416f63e
pkgrel=1
pkgdesc="Patching Firefox to enable JS injection (userchrome-js)"
arch=('any')
depends=('firefox')
url="https://github.com/xiaoxiaoflood/firefox-scripts"
license=('MPL2')
source=(https://codeload.github.com/xiaoxiaoflood/$_pkgname/tar.gz/$_pkgver
        fix117.patch)
sha512sums=('5ce25bc5a239b6bdd60578caddcf97f1af05db06309fee91165ea10be4dafbb43ee26515eaeff398947926c74e0253b0a02e8106941c55e593667e7c1dd7542d'
            'SKIP')
install=firefox-userchromejs.install

prepare() {
  cd $srcdir/$_pkgname-$_pkgver/
  dos2unix chrome/utils/xPref.jsm
  dos2unix chrome/utils/userChrome.jsm
  patch -p1 -i ../fix117.patch
  unix2dos chrome/utils/xPref.jsm
  unix2dos chrome/utils/userChrome.jsm
}

package() {
  cd $srcdir/$_pkgname-$_pkgver/
  install -d $pkgdir/usr/share/licenses/$pkgname
  install LICENSE $pkgdir/usr/share/licenses/$pkgname/

  cd installation-folder
  install -d $pkgdir/usr/lib/firefox/browser/defaults/preferences
  install config.js $pkgdir/usr/lib/firefox/
  install config-prefs.js $pkgdir/usr/lib/firefox/browser/defaults/preferences/

  cd ../chrome/utils
  install -d $pkgdir/usr/share/$pkgname/base/chrome/utils
  install BootstrapLoader.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install RDFDataSource.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install RDFManifestConverter.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install chrome.manifest $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install hookFunction.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install userChrome.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/
  install xPref.jsm $pkgdir/usr/share/$pkgname/base/chrome/utils/

  cd ../..
  install -d $pkgdir/usr/share/$pkgname/misc
  install README.md $pkgdir/usr/share/$pkgname/misc/
  find chrome -type f -exec install -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
  find extensions -type f -exec install -D "{}" "$pkgdir/usr/share/$pkgname/misc/{}" \;
}

# vim:set ts=2 sw=2 et:
