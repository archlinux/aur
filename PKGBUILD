# Maintainer: Vinícius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=guapow
pkgver=1.3.0
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
sha512sums=('2e0b23ea61513f655492c86d53e4683d3284112f934705a4ca7f10c5aa646942fb1b27e23d194739abc24bab1a3bcdd061be7420527a95dc6103887db272e7eb')

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
