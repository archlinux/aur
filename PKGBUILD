# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.36.0
pkgrel=2
pkgdesc="A CalDAV and CardDAV adapter for EteSync"
arch=('any')
url="https://github.com/etesync/etesync-dav/"
license=('GPL-3.0-only')
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
        "0001-Fix-compatibility-with-radicale-3.5.5.patch"
        "0002-Fix-WSGIResponse-for-Radicale-3.5.10.patch"
        "0003-Fix-compatibility-with-radicale-3.9.0.patch"
		"0004-Fix-compatibility-with-peewee-4.0.1.patch"
)
sha256sums=('067c9ae36af4548e8eff15d18330d9e62c674c9393b1bfce741651bce6f871d1'
            '9c41622ce3b1e4f5836e05070953fc993fc13c5b9c7a3a26c13ba3411e996b38'
            '319620f6d9584ea98a22191d609f2729ae1dd0ec53a130aaeddd6272b632dee5'
            'c7d649d09b45faf0928c5328afbd5c1039d730b2f385eef9a23286d276152f3b'
            'fb1d70b02d5ab4ce4addebe0de82822f0b616cce61a3c3507bed275e11ef5c2e')

prepare() {
  cd "${pkgname}-${pkgver}"
  for f in "$srcdir"/*.patch; do
    patch -p1 < "$f"
  done
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

