# Maintainer: hizani

pkgname=toxcore-c
pkgver=0.2.22
pkgrel=4
pkgdesc='C backend implementation of the Tox communication protocol'
arch=('x86_64')
url='https://tox.chat'
license=('GPL3')
depends=('systemd' 'libconfig' 'libsodium' 'libvpx' 'opus')
makedepends=('base-devel' 'cmake')
checkdepends=('gtest')
provides=('tox')
conflicts=('tox')
backup=('etc/tox-bootstrapd.conf')
source=("https://github.com/TokTok/c-toxcore/releases/download/v${pkgver}/c-toxcore-v${pkgver}.tar.xz")
sha512sums=('49dc04f187014619b3857b780321b6c45311eb73ebdbaef25c0f8cbf708a14d80c3a6f6b896c6ececcc593dc65b54b93a103f0af78a9b6a7bb2c821371450fc9')

prepare() {
  sed -i "s|/usr/local|/usr|" "other/bootstrap_daemon/tox-bootstrapd.service"

  echo 'u! tox-bootstrapd 199 "Tox bootstrapd"' >"$srcdir/toxcore.conf"
  echo "g tox-bootstrapd 199" >>"$srcdir/toxcore.conf"
  echo "d /var/lib/tox-bootstrapd 0750 tox-bootstrapd tox-bootstrapd - -" >"$srcdir/toxcore.tmpfiles"
}

build() {
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DDHT_BOOTSTRAP=on \
    -DBOOTSTRAP_DAEMON=on \
    -DBUILD_TOXAV=on \
    -DBUILD_MISC_TESTS=ON \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DENABLE_STATIC=on \
    -DENABLE_SHARED=on
  cmake --build build --parallel $(nproc)
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/toxcore.conf" "$pkgdir/usr/lib/sysusers.d/toxcore.conf"
  install -Dm644 "$srcdir/toxcore.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/toxcore.conf"
  install -Dm644 other/bootstrap_daemon/tox-bootstrapd.service "$pkgdir/usr/lib/systemd/system/tox-bootstrapd.service"
  install -Dm644 other/bootstrap_daemon/tox-bootstrapd.conf "$pkgdir/etc/tox-bootstrapd.conf"
}
