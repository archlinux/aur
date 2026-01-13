# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Penguin <TGates81.at.gmail.dot.com>

_pkgname=pylzma
pkgname=python-$_pkgname
pkgver=0.6.0
pkgrel=1
pkgdesc='Platform independent python bindings for the LZMA compression library'
url='https://www.joachim-bauch.de/projects/pylzma/'
license=("LGPL-2.1-or-later")
arch=(i686 x86_64)
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=($_pkgname-$pkgver.tar.gz::https://github.com/fancycode/pylzma/archive/v$pkgver.tar.gz
        # testing data
        https://archive.org/download/stackexchange/ux.stackexchange.com.7z)
sha256sums=('9ebaa893117f5579da3a81bf3315e4467d998bdd17f3d803f1f031f7d1f2b58a'
            'SKIP')
noextract=(ux.stackexchange.com.7z)

prepare() {
  cd "$_pkgname-$pkgver"
  # Create symlink for test data
  mkdir -p tests/data
  ln -sf "$srcdir/ux.stackexchange.com.7z" tests/data/ux.stackexchange.com.7z
}

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  
  # Install to a temporary directory
  python -m installer --destdir="$srcdir/test_dir" dist/*.whl
  
  # Find the site-packages path within that temp directory
  local _site_packages=$(find "$srcdir/test_dir" -name site-packages -type d -print -quit)
  
  # Run tests using the temp site-packages
  PYTHONPATH="$_site_packages:$PWD" python tests/__init__.py
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  # Install license
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
