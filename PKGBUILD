# Maintainer: Maciej Łoziński <maciej@robotix-lozinski.pl>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=red
pkgver=0.6.6
pkgrel=1
pkgdesc="An open source, native code compiled, dialect of Rebol"
arch=('i686' 'x86_64')
url="http://www.red-lang.org"
license=('custom:3-clause BSD' 'custom:BSL')
groups=('devel')
depends=('lib32-gdk-pixbuf2' 'lib32-curl')
makedepends=('wget' 'rebol=2.7.8')
checkdepends=('bash')
conflicts=('ed')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
options=('!strip' 'staticlibs')
sha256sums=('23a02a53e0dcbf8da24c639014685de935d74c19a0b5b70a4ecade7b917bb63b')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  rebol -qws red.r tests/hello.red
  msg2 "Compiling the Red console..."
  rebol -qws red.r -r environment/console/CLI/console.red
  msg2 "Generating docs..."
  cd docs/red-system
  rebol -qws makedoc2.r red-system-specs.txt
  rebol -qws makedoc2.r red-system-quick-test.txt
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  msg2 Skipping tests...
#  rebol -qws run-all.r --batch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir"/opt/$pkgname
  find ./quick-test -type f -executable -print0 | xargs -0 rm
  cp -R * "$pkgdir"/opt/$pkgname/
  install -Dm755 "$pkgdir"/opt/$pkgname/console "$pkgdir"/usr/bin/red
  rm "$pkgdir"/opt/$pkgname/console
  install -Dm644 BSD-3-License.txt "$pkgdir"/usr/share/licenses/$pkgname/BSD-3-License.txt
  install -Dm644 BSL-License.txt "$pkgdir"/usr/share/licenses/$pkgname/BSL-License.txt
  install -Dm644 docs/red-system/red-system-quick-test.html "$pkgdir"/usr/share/doc/$pkgname/red-system/red-system-quick-test.html
  install -Dm644 docs/red-system/red-system-specs.html "$pkgdir"/usr/share/doc/$pkgname/red-system/red-system-specs.html
  rm "$pkgdir"/opt/$pkgname/docs/red-system/red-system-{quick-test,specs}.html
}

# vim:set ts=2 sw=2 et:
