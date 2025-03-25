# Maintainer: Vinícius Moreira <vinicius_fmoreira at hotmail dot com>

pkgname=guapow-staging
_pkgname=guapow
pkgver=1.3.5.RC
pkgrel=1
_commit="a1f142d55ef97d1097c021e25ef3d23ff428f735"
pkgdesc="On-demand and auto performance optimizer for Linux applications (testing branch. It may not be working properly)"
arch=('any')
url="https://github.com/vinifmor/guapow"
license=('zlib/libpng')
depends=('python' 'python-aiofiles' 'python-aiohttp' 'python-pycryptodome' 'systemd')
optdepends=('inxi: guess the window compositor',
            'unclutter: required for hiding the mouse cursor (X11 only)')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${url}/archive/${_commit}.tar.gz")
sha512sums=('fbce7e4efd1b4e31511037c1273c100ac8e50d0e7ba06d9e10925c1a0c045b87de5016c51aa650af50a5698702a1cff81a312c7fbee1dc248834548d9cb90c3a')

build() {
  cd "${srcdir}/${_pkgname}-${_commit}"

  # removing outdated setup files
  rm setup.cfg setup.py requirements.txt

  python -m unittest discover -s tests -t tests -v || return 1
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${_commit}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  
  mkdir -p $pkgdir/etc/$_pkgname
  cp $_pkgname/dist/daemon/opt.conf $pkgdir/etc/$_pkgname/opt.conf.example
  cp $_pkgname/dist/daemon/watch.conf $pkgdir/etc/$_pkgname/watch.conf.example
  cp $_pkgname/dist/default.profile $pkgdir/etc/$_pkgname/default.profile.example

  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $_pkgname/dist/daemon/systemd/root/$_pkgname-opt.service $pkgdir/usr/lib/systemd/system
}
