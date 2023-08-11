# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=dbxfs
pkgver=1.0.65
pkgrel=1
pkgdesc="User-space file system for Dropbox"
arch=('x86_64')
url="https://thelig.ht/code/dbxfs"
license=('GPL3')
depends=('fuse2' 'python-dropbox' 'python-appdirs' 'python-userspacefs'
         'python-block_tracing' 'python-privy' 'python-keyrings-alt' 'python-sentry_sdk'
         'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz"
        "$pkgname.patch")
sha256sums=('aed1ca8ed48299834d0f00828f674c73759a444d7fec43b7521f338f61ead626'
            'cc238c6562ec327efeba4f48e4523808338658b2b1f38b1fb6a901ba938c4868')

prepare() {
  cd $pkgname-$pkgver

  # Disable update check
  patch -Np1 -i "$srcdir/$pkgname.patch"

  # Relax requirements
  for f in setup.py "$pkgname.egg-info/requires.txt"; do
    sed -i 's/keyrings.alt>=3.1,<5/keyrings.alt>=3.1/g' "${f}"
  done
}

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
