# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.35.1
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
        "0001-Fix-usage-with-radicale-3.5.1.patch"
        "0002-Fix-compatibility-with-radicale-3.5.5.patch"
        "0003-fix-compatibility-with-radicale-3.5.9-362.patch"
        "0004-Fix-WSGIResponse-for-Radicale-3.5.10.patch"
)
sha256sums=('1f2eee6a4b32fe2d3de238b4efeebae9a7ea433c930e84d632c14166a019fb97'
            '6412279a366eeece0f7aa153a70b1ab9860567d4b98c0d041a371116f04c84d5'
            'dccdc895410f8b2d5a3c0f0aeac13742161dec18ea4be78a6fa4222cc795fe25'
            '7cff60d2e45f399a0ffb65a309725fd72b869701305ccf5fdab2df3346c89bfd'
            'ce0864322ca2933156e61b604fe5a78c9204cb86889b91ff180d50301c8df38b')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < "$srcdir/0001-Fix-usage-with-radicale-3.5.1.patch"
  patch -p1 < "$srcdir/0002-Fix-compatibility-with-radicale-3.5.5.patch"
  patch -p1 < "$srcdir/0003-fix-compatibility-with-radicale-3.5.9-362.patch"
  patch -p1 < "$srcdir/0004-Fix-WSGIResponse-for-Radicale-3.5.10.patch"
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

