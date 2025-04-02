# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.33.0
pkgrel=4
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
        "0001-Fix-radicale-compatibility.patch")
sha256sums=('dcc85d168fe74c0350991dca45788b93100460bc23339432ca836165adc47c5e'
            'c7f20e8f7e21d1a05fb9408658d3475851e7b75f42c2fb414683963e9ccceefb')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < "$srcdir/0001-Fix-radicale-compatibility.patch"
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

