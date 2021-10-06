# Maintainer: Vinícius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=guapow
pkgver=1.0.0
pkgrel=2
pkgdesc="On-demand and auto performance optimizer for Linux applications"
arch=('any')
url="https://github.com/vinifmor/guapow"
license=('zlib/libpng')
depends=('python' 'python-aiofiles' 'python-aiohttp' 'python-pycryptodome' 'systemd')
optdepends=('unclutter: required for hiding the mouse cursor')
makedepends=('git' 'python' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('15de982783170155b81d4d173a9238e543d336f9f94aa06c17efab654a0bc9fc3f36166a2d3c27a119e2cc7f0d4c2f10a4d9bd7102523581b04c6a34811d531e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
  # python3 setup.py test || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py install --root="$pkgdir" --optimize=1 || return 1
  
  mkdir -p $pkgdir/etc/$pkgname
  cp $pkgname/dist/daemon/opt.conf $pkgdir/etc/$pkgname/opt.conf.example
  cp $pkgname/dist/daemon/watch.conf $pkgdir/etc/$pkgname/watch.conf.example
  cp $pkgname/dist/default.profile $pkgdir/etc/$pkgname/default.profile.example

  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $pkgname/dist/daemon/systemd/root/$pkgname-opt.service $pkgdir/usr/lib/systemd/system
}
