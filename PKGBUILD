# Contributor: Matthias Fulz < mfulz [at] olznet [dot] de >

pkgname=openvas-scanner
pkgver=23.9.0
pkgrel=5
pkgdesc='Vulnerability scanning Daemon'
arch=('x86_64')
url="https://github.com/greenbone/openvas-scanner"
license=('GPL-2.0-only')
depends=('gvm-libs' 'json-glib' 'libbsd' 'libgcrypt' 'redis' 'rsync')
makedepends=('cmake' 'doxygen')
groups=('greenbone-vulnerability-manager')
install=openvas.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        ${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.gz.asc
        openvas-scanner.tmpfiles)
sha512sums=('820510e7ae7c738796809d010ef5d177f002cd6dfe2c36354e47e1bda8f32ecd1c4bdc1779d4ff3bdc5d9ab31fe4e8330b0142206b54132c84dfc5f8b37bd87e'
            'SKIP'
            '3df08a3e16f16a1735a4d6aa09b34fd0c04e4af95ef4264002a7f50447d9e200531551f162571b59e0c61707c09ca25f66e8a17baa8a42e2745752a5a6717672')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity


prepare() {
	cd "$pkgname-$pkgver"
	sed -i '/-Werror/d' CMakeLists.txt
}

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DSBINDIR=/usr/bin \
    -DLIBDIR=/usr/lib \
    -DSYSCONFDIR=/etc \
    -DLOCALSTATEDIR=/var \
    -DOPENVAS_FEED_LOCK_PATH=/run/gvm/feed-update.lock \
    -DOPENVAS_NVT_DIR=/var/lib/openvas
  make -C build
}

package() {
  make DESTDIR="${pkgdir}/" -C build install

  install -Dm 644 ${srcdir}/openvas-scanner.tmpfiles -t "${pkgdir}"/usr/lib/tmpfiles.d/
}
