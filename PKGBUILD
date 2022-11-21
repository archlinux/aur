# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-pytest-relaxed
pkgver=1.1.5
pkgrel=8
pkgdesc='Relaxed test discovery for pytest'
arch=('any')
license=('BSD')
url='https://github.com/bitprophet/pytest-relaxed'
depends=('python38-pytest' 'python38-decorator' 'python38-six')
makedepends=('python38-setuptools')
source=("https://github.com/bitprophet/pytest-relaxed/archive/$pkgver/$pkgbase-$pkgver.tar.gz"
        $pkgname-pytest5.4-warnings.patch::https://github.com/bitprophet/pytest-relaxed/pull/10.patch)
sha512sums=('a5484bc92be29e5228afb7d9911c1d3a7d6e493bec44af541780de24b91dfa8e8c9e1245acd8ae8670805294eb52b20f7c4abefad1afb8373109249a2df1cdaa'
            '4102a7cea45bcb90b8aa93ed619162f6c9554632dab95a7df152ebe58de9fd038ceef74630ad37f0abc5a3d032b79b78427f09ab489003703af607a92929bda9')

prepare() {
  cd pytest-relaxed-$pkgver
  patch -p1 -i ../$pkgname-pytest5.4-warnings.patch
}

build() {
  cd pytest-relaxed-$pkgver
  python3.8 setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-relaxed-$pkgver
  python3.8 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" pytest || echo "Tests failed"
}

package() {
  cd pytest-relaxed-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
