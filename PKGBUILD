# Maintainer: Kevin MacMartin <prurigro at gmail dot com>

_pkgname=treesheets
pkgname=$_pkgname-git
pkgver=r122.2ce41d5
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
            '50ea4008f10d0e0248b77295fe664ca341a6225f4d3edb040d3bd0bba90943bcfe5372224cc92ea4047f1e7c4515ab32508752ba32c183faa195bcb239240e4b')

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
  install -dm755 "$pkgdir/usr/share/$_pkgname"
  cp -R TS/examples "$pkgdir/usr/share/$_pkgname/examples"
  cp -R TS/images "$pkgdir/usr/share/$_pkgname/images"
  cp -R TS/docs "$pkgdir/usr/share/$_pkgname/docs"
}

