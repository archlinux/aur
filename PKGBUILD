# Maintainer: Vinícius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=guapow-staging
_pkgname=guapow
pkgver=1.3.2.RC
pkgrel=2
_commit="5a023565121ede23607324ca884bb8732ba4fd8d"
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
sha512sums=('1798c989557bc774f0fe654da5733dcc98511735b6430616dbe5779ff7af31aa5190e8d12f556e4ee8a671cfd614764908ad27fd79eadf8f58c1131e18885304')

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
