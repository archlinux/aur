# Maintainer: Vinícius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=guapow-staging
_pkgname=guapow
pkgver=1.3.1.RC
pkgrel=1
_commit="a9bc33b9eeb588a0a00485549e6880c7cd93cd99"
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
sha512sums=('059dfd0d2d7f4ff64319819acdc760745ae1aa00c36bdf9834e283cc2182b85d9ab2cd9310a022850e73969baac7bf1149ce0bbc65d12d7b9d97a467d042dab6')

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
