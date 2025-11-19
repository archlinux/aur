# Maintainer: Tom Hacohen <tom@stosb.com>
# Contributor: David Runge <dave@sleepmap.de>

pkgname=etesync-dav
pkgver=0.35.1
pkgrel=1
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
        "0001-Fix-compatibility-with-radicale-3.5.5.patch")
sha256sums=('1f2eee6a4b32fe2d3de238b4efeebae9a7ea433c930e84d632c14166a019fb97'
            '0b6397033b4ff33f2fed0b6ef6bc5e4b0a134c328309c207a0934856c0e18058'
            'f1367eff9b3048c5e83fd2db9d4a326b3ff0705c53cce95a544a6a9759342f6f')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < "$srcdir/0001-Fix-usage-with-radicale-3.5.1.patch"
  patch -p1 < "$srcdir/0001-Fix-compatibility-with-radicale-3.5.5.patch"
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

