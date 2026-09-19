# Maintainer: Nikolay Bryskin <nikicat@users.noreply.github.com>
# OP-TEE normal-world userspace: libteec, libckteec (PKCS#11), tee-supplicant.
# udev starts tee-supplicant@teepriv0 as soon as the optee driver binds.
pkgname=optee-client
pkgver=4.10.0
pkgrel=1
pkgdesc="OP-TEE client library, PKCS#11 library (libckteec) and tee-supplicant"
arch=('aarch64' 'x86_64')
url="https://github.com/OP-TEE/optee_client"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('cmake' 'systemd')
source=("optee_client-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'optee-client.sysusers' 'optee-client.tmpfiles')
sha256sums=('984084a465f55ed8037e0e27eb4399149b5cec981ed295c2f0ee0dd515f60af9'
            '5cd1063e78a60d273b7f995796c1e0ae92d1ada7fddef2183d8028af1dbab272'
            'a79dad28d5ec7a88a2c1f06894199ba7f44d1444c3f09d1c4802ccb36be8e637')

build() {
  cmake -S optee_client-$pkgver -B build -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_INSTALL_SBINDIR=bin \
    -DCMAKE_INSTALL_LOCALSTATEDIR=/var -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DBUILD_SHARED_LIBS=ON -DCFG_USE_PKGCONFIG=OFF -DWITH_TEEACL=OFF -DWITH_ASTEEC=OFF \
    -DSYSTEMD_UNIT_DIR=/usr/lib/systemd/system -DUDEV_UDEV_DIR=/usr/lib/udev/rules.d \
    -DCFG_TEE_CLIENT_LOAD_PATH=/usr/lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 optee-client.sysusers "$pkgdir/usr/lib/sysusers.d/optee-client.conf"
  install -Dm644 optee-client.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/optee-client.conf"
  install -Dm644 optee_client-$pkgver/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
