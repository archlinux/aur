# Maintener: Marc Cousin <cousinmarc@gmail.com>
# Contributor: Filipe Laíns (FFY00) <filipe.lains@gmail.com>
# Contributor: defkeh <defkeh@gmail.com>
pkgname=rivalcfg-sensei-310
_pkgname=${pkgname%-git}
pkgver=2.6.0.r81.1820b76
pkgrel=1
pkgdesc='SteelSeries Rival gaming mouse configuration utility - Sensei 310 compatible'
arch=('any')
url='https://github.com/flozz/rivalcfg'
license=('custom:WTFPL')
depends=('python' 'hidapi' 'python-hidapi' 'python-setuptools')
makedepends=('git')
conflicts=('rivalcfg')
provides=('rivalcfg')
source=('git+https://github.com/Gazler/rivalcfg')
sha256sums=('SKIP')

prepare() {
  cd "$srcdir"/rivalcfg
  git checkout feat/sensei310
  patch -p2 < ../..//python_3.8.patch
}

pkgver() {
  cd "$srcdir"/rivalcfg
  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g;s/\.rc./rc/g'
}

package() {
  cd "$srcdir"/rivalcfg
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1

  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 doc/rival-spec.md "$pkgdir"/usr/share/doc/$pkgname/rival-spec.md
  install -D -m644 doc/rival100-spec.md "$pkgdir"/usr/share/doc/$pkgname/rival-spec100.md
  install -D -m644 doc/rival300-spec.md "$pkgdir"/usr/share/doc/$pkgname/rival-spec300.md
  install -D -m644 rivalcfg/data/99-steelseries-rival.rules "$pkgdir"/etc/udev/rules.d/99-steelseries-rival.rules
}
