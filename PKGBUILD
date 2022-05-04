# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Duru Can Celasun <can at dcc dot im>
pkgname=pymdown-extensions
_name=pymdown_extensions
pkgver=9.4
pkgrel=1
pkgdesc="Extensions for Python Markdown"
arch=('any')
url="https://facelessuser.github.io/pymdown-extensions"
license=('MIT')
depends=('python-markdown')
# FS#74636 - [python-hatchling] Missing dependency on python-editables
# https://bugs.archlinux.org/task/74636
makedepends=('python-build' 'python-editables' 'python-hatchling' 'python-installer'
             'python-packaging>=21.3' 'python-wheel')
optdepends=('python-pygments>=2.12: syntax highlighting')
checkdepends=('python-pyaml' 'python-pygments>=2.12' 'python-pytest-cov')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_name-$pkgver.tar.gz")
#source=("$pkgname-$pkgver.tar.gz::https://github.com/facelessuser/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('1baa22a60550f731630474cad28feb0405c8101f1a7ddc3ec0ed86ee510bcc43')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  python run_tests.py
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # symlink license to proper directory
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "${site_packages}/$_name-$pkgver.dist-info/LICENSE.md" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
