# Maintainer: Vinícius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=guapow-staging
_pkgname=guapow
pkgver=1.2.0.RC
pkgrel=1
_commit="9bb67d125f613ec8f79ca72bd4ee4ff1a0431343"
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
sha512sums=('2389070ca8a9b0b4de40692bff9d13754edad8003687c5b31a00d98ea410ac8216ce442fae5addeeb0bdcd850badf8b4bf29c9e31cccaa81381794c61a4e63e9')

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
