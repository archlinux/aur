# Maintainer: Vinícius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=guapow
pkgver=1.1.1
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
sha512sums=('e3f0b90f9c250ac7e881da99540c3dd9e93a8dee950c698fe32bf12dfeb331092459ca9d654fb0ccb5715922f325cada1fa2b2306002bf91d3edb571171eacc2')

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
