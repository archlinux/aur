# Maintainer: Vinícius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=guapow-staging
_pkgname=guapow
pkgver=1.1.0.RC
pkgrel=2
_commit="e8a8475a02ce8cf38505a02d408d6736a597d075"
pkgdesc="On-demand and auto performance optimizer for Linux applications (testing branch. It may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/guapow"
license=('zlib/libpng')
depends=('python' 'python-aiofiles' 'python-aiohttp' 'python-pycryptodome' 'systemd')
optdepends=('inxi: guess the window compositor',
            'unclutter: required for hiding the mouse cursor')
makedepends=('git' 'python' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${url}/archive/${_commit}.tar.gz")
sha512sums=('f63356b39ae44f90c4622b812ebe94eb88591ad8a3bb824e90a12cd7171b2d8639073f22720ec46ff5c443a19730e22c3fc194a7fd4921ed4a15abf3ba9e60e4')

build() {
  cd "${srcdir}/${_pkgname}-${_commit}"
  python3 setup.py build
  python3 setup.py test || return 1
}

package() {
  cd "${srcdir}/${_pkgname}-${_commit}"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  
  mkdir -p $pkgdir/etc/$_pkgname
  cp $_pkgname/dist/daemon/opt.conf $pkgdir/etc/$_pkgname/opt.conf.example
  cp $_pkgname/dist/daemon/watch.conf $pkgdir/etc/$_pkgname/watch.conf.example
  cp $_pkgname/dist/default.profile $pkgdir/etc/$_pkgname/default.profile.example

  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $_pkgname/dist/daemon/systemd/root/$_pkgname-opt.service $pkgdir/usr/lib/systemd/system
}
