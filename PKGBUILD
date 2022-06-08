# Maintainer: Vinícius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=guapow-staging
_pkgname=guapow
pkgver=1.1.1.RC
pkgrel=1
_commit="d4604a232d7c8b5b9194691fd3ffef9deab98709"
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
sha512sums=('807edb8c6c87aa63f787cef6d3885c08e934cf9a8c9c5fba6306120ab4a14077a89b14f54b6c2769d849f2374458cbc08d0952d9970ca6c9484ab058b3060bfa')

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
