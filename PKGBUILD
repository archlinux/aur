# Maintainer: Vinícius Moreira <vinicius_fmoreira at hotmail dot com>

pkgname=guapow-staging
_pkgname=guapow
pkgver=1.3.4.RC
pkgrel=2
_commit="a2ee990c61c5d3ba14d8a4c02d07f74fdbbd193b"
pkgdesc="On-demand and auto performance optimizer for Linux applications (testing branch. It may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/guapow"
license=('zlib/libpng')
depends=('python' 'python-aiofiles' 'python-aiohttp' 'python-pycryptodome' 'systemd')
optdepends=('inxi: guess the window compositor',
            'unclutter: required for hiding the mouse cursor')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${url}/archive/${_commit}.tar.gz")
sha512sums=('e67c0d2a8df7e706da63bca01b1f235a20c02f5838a51e6733b657be82a6ac8c22430b2a02e6ce2c63dcca2f1a606133891b4b11f2a75eb7bc838c84e892a13d')

build() {
  cd "${srcdir}/${_pkgname}-${_commit}"

  # removing outdated setup files
  rm setup.cfg setup.py requirements.txt

  python -m unittest discover -s tests -t tests -v || return 1
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${_commit}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  mkdir -p $pkgdir/etc/$_pkgname
  cp $_pkgname/dist/daemon/opt.conf $pkgdir/etc/$_pkgname/opt.conf.example
  cp $_pkgname/dist/daemon/watch.conf $pkgdir/etc/$_pkgname/watch.conf.example
  cp $_pkgname/dist/default.profile $pkgdir/etc/$_pkgname/default.profile.example

  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $_pkgname/dist/daemon/systemd/root/$_pkgname-opt.service $pkgdir/usr/lib/systemd/system
}
