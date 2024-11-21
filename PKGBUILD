# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.33.0
pkgrel=1
pkgdesc="A CalDAV and CardDAV adapter for EteSync"
arch=('any')
url="https://github.com/etesync/etesync-dav/"
license=('GPL')
depends=(
         'python-setuptools'
         'python-appdirs'
         'python-etesync'
         'python-etebase'
         'radicale>=3.0.0'
         'python-flask'
         'python-flask-wtf'
)
replaces=('python-radicale-storage-etesync')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "add-missing-comma-in-setup.py.patch")
sha256sums=('c299bee88a0503cf39635fc3772ec8e0bd512ced494d7b02050d7ef29b282478'
            '98d3d69d368eedd073245ac0943882455405e519304044e2b571f97bc8487954')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < "$srcdir/add-missing-comma-in-setup.py.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -t "${pkgdir}/usr/share/doc/${pkgname}" \
    -vDm644 {DESCRIPTION.rst,README.md}

  install -Dm644 examples/systemd-user/etesync-dav.service "${pkgdir}/usr/lib/systemd/user/etesync-dav.service"
}

