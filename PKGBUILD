# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=red
pkgver=0.6.3
pkgrel=2
pkgdesc="An open source, native code compiled, dialect of Rebol"
arch=('i686' 'x86_64')
url="http://www.red-lang.org"
license=('custom:3-clause BSD' 'custom:BSL')
groups=('devel')
depends=('lib32-curl')
makedepends=('wget' 'rebol=2.7.8')
checkdepends=('bash')
conflicts=('ed')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
options=('!strip' 'staticlibs')
sha256sums=('2ec78c1683a63149423661b35571ee4b74306217ab944b23f86efe7f0b216a6c')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  rebol -qw red.r tests/hello.red
  msg2 "Compiling the Red console..."
  rebol -qw red.r -r environment/console/console.red
  msg2 "Generating docs..."
  cd docs
  rebol -qw makedoc2.r red-system-specs.txt
  rebol -qw makedoc2.r red-system-quick-test.txt
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  msg2 Skipping tests...
#  rebol -qws run-all.r --batch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir"/opt/red
  find ./quick-test -type f -executable -print0 | xargs -0 rm
  cp -R * "$pkgdir"/opt/red/
  install -Dm755 "$pkgdir"/opt/red/console "$pkgdir"/usr/bin/red
  rm "$pkgdir"/opt/red/console
  install -Dm644 BSD-3-License.txt "$pkgdir"/usr/share/licenses/$pkgname/BSD-3-License.txt
  install -Dm644 BSL-License.txt "$pkgdir"/usr/share/licenses/$pkgname/BSL-License.txt
  install -Dm644 docs/red-system-quick-test.html "$pkgdir"/usr/share/doc/$pkgname/red-system-quick-test.html
  install -Dm644 docs/red-system-specs.html "$pkgdir"/usr/share/doc/$pkgname/red-system-specs.html
  rm "$pkgdir"/opt/$pkgname/docs/red-system-{quick-test,specs}.html
}

# vim:set ts=2 sw=2 et:
