# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=treesheets
pkgname=$_pkgname-git
pkgver=r113.3a6be83
pkgrel=1
pkgdesc='The ultimate replacement for spreadsheets, mind mappers, outliners, PIMs, text editors and small databases'
url='http://treesheets.com/'
license=('zlib')
depends=('wxgtk' 'webkitgtk2')
makedepends=('git')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')

source=("git://github.com/aardappel/$_pkgname.git#branch=master"
        "$_pkgname.desktop"
        "myframe.patch")
sha512sums=('SKIP'
            'e423f46c1ea08d7429a3ffe027911dba52ded81228c6110f695ff19d56090ed93a6081bbc98329aa509f9888b042f995bfa3ce87cbcb34db9aab352f929b5bc2'
            '6c4db7d55a4df02b4b71674fc4ae2f303886d62bef2b0673fa6f5d05257021d771eb18075e96087f365fe0c91b989cc82c171ff8cea8f5cce9b85e4b4df97410')

pkgver() {
  cd $_pkgname
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  patch -p1 < ../myframe.patch
  find TS/examples -type f -exec chmod 644 '{}' \;
  find TS/images -type f ! -iname '*.png' -delete
}

build() {
  cd $_pkgname/src
  make
}

package() {
  install -Dm644 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  cd $_pkgname
  install -Dm644 ZLIB_LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 TS/$_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -d "$pkgdir/usr/share/$_pkgname"
  cp -R TS/examples "$pkgdir/usr/share/$_pkgname/examples"
  cp -R TS/images "$pkgdir/usr/share/$_pkgname/images"
}

