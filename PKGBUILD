# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Duru Can Celasun <can at dcc dot im>
pkgname=pymdown-extensions
pkgver=9.2
pkgrel=2
pkgdesc="Extensions for Python Markdown"
arch=('any')
url="https://facelessuser.github.io/pymdown-extensions"
license=('MIT')
depends=('python-markdown')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-pygments: syntax highlighting')
checkdepends=('python-pyaml' 'python-pygments' 'python-pytest-cov')
source=("https://pypi.org/packages/source/${pkgname:0:1}/$pkgname/$pkgname-$pkgver.tar.gz")
#source=("$pkgname-$pkgver.tar.gz::https://github.com/facelessuser/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ed8f69a18bc158f00cbf03abc536b88b6e541b7e699156501e767c48f81d8850')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  python run_tests.py
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Move license to proper directory
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  mv "${pkgdir}${site_packages}/pymdown_extensions-$pkgver.dist-info/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
