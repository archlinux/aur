# Maintainer: Vinícius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=guapow
pkgver=1.3.4
pkgrel=1
pkgdesc="On-demand and auto performance optimizer for Linux applications"
arch=('any')
url="https://github.com/vinifmor/guapow"
license=('zlib/libpng')
depends=('python' 'python-aiofiles' 'python-aiohttp' 'python-pycryptodome' 'systemd')
optdepends=('inxi: required for guessing the window compositor',
            'unclutter: required for hiding the mouse cursor')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('8a75f15fe30c5eb0d03e086a612742f27b8483bf62cb2ce8e54f569815e4fd1ff2f5d31b9715a6b1b915fe7b68a014a787571e1300e1054cf5e4f53a78ee4a12')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # removing outdated setup files
  rm setup.cfg setup.py requirements.txt

  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  mkdir -p $pkgdir/etc/$pkgname
  cp $pkgname/dist/daemon/opt.conf $pkgdir/etc/$pkgname/opt.conf.example
  cp $pkgname/dist/daemon/watch.conf $pkgdir/etc/$pkgname/watch.conf.example
  cp $pkgname/dist/default.profile $pkgdir/etc/$pkgname/default.profile.example

  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $pkgname/dist/daemon/systemd/root/$pkgname-opt.service $pkgdir/usr/lib/systemd/system
}
