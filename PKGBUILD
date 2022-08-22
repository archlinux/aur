# Maintainer: Vinícius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=guapow
pkgver=1.2.1
pkgrel=1
pkgdesc="On-demand and auto performance optimizer for Linux applications"
arch=('any')
url="https://github.com/vinifmor/guapow"
license=('zlib/libpng')
depends=('python' 'python-aiofiles' 'python-aiohttp' 'python-pycryptodome' 'systemd')
optdepends=('inxi: required for guessing the window compositor',
            'unclutter: required for hiding the mouse cursor')
makedepends=('git' 'python' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('88171cfff6959d4a1c094f71c5272646f4a65d3434a993abe708f6d6933cf7574cac75bcd1998b0fde515f20aa33f03fcc5617a73fe1c58d17ad742ced111e3e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python3 setup.py build
  python3 setup.py test || return 1
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
