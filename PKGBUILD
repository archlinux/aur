# Maintainer: hizani

pkgname=toxcore-c
pkgver=0.2.25
pkgrel=1
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
sha512sums=('fa5fc1001285796ac7f55f3993e2bb0e197db365d06a8aca0bfcdbdf03703377d98754561308290a41be0cbf53f7c9996ad4c7833677c33900358ed0f16730fe')

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
