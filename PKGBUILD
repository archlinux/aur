# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=proselint
pkgver=0.10.2
pkgrel=6
pkgdesc='Linter for prose'
arch=('any')
url=https://github.com/amperser/proselint
license=('BSD')
depends=('python-click' 'python-future' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-mock' 'python-nose' 'python-pytest')
conflicts=('python-proselint')
replaces=('python-proselint')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('76200d75a4adfaf4adcb07e2109707ca3cec322170a070d50b80267125d854cb46fb097f9fe7ce3a584aed8afc35b47749842a36b0d3e19286e1709bbf3d94b5')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

check() {
  cd $pkgname-$pkgver
  mkdir -p temp
  local sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
  python setup.py install --skip-build --root=temp
  PATH="$PWD/temp/usr/bin:$PATH" PYTHONPATH="$PWD/temp/$sitepackages" pytest
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
