# Maintainer: Vinícius Moreira <vinicius_fmoreira@hotmail.com>

pkgname=guapow
pkgver=1.3.5
pkgrel=1
pkgdesc="On-demand and auto performance optimizer for Linux applications"
arch=('any')
url="https://github.com/vinifmor/guapow"
license=('zlib/libpng')
depends=('python' 'python-aiofiles' 'python-aiohttp' 'python-pycryptodome' 'systemd')
optdepends=('inxi: required for guessing the window compositor',
            'unclutter: required for hiding the mouse cursor (X11 only)')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${url}/archive/${pkgver}.tar.gz")
sha512sums=('8eda8081548706ed71163cf54379156e93214d90c851d4c60f90362339ac0f8524d3abbd950b3579efdc99276619342bc2281737e1825d3bfb47387dfcd5970d')

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
