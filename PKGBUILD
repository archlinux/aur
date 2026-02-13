# Maintainer: hizani

pkgname=toxcore-c
_pkgname=c-toxcore
pkgver=0.2.22
pkgrel=1
pkgdesc='C backend implementation of the Tox communication protocol'
arch=('x86_64')
url='https://tox.chat'
license=('GPL3')
depends=('systemd' 'libconfig' 'libsodium' 'libvpx' 'opus')
makedepends=('base-devel' 'git' 'cmake')
checkdepends=('gtest')
provides=('tox')
backup=('etc/tox-bootstrapd.conf')
source=("git+https://github.com/TokTok/${_pkgname}.git")
sha512sums=('SKIP')

prepare() {
  cd $_pkgname

  git checkout -q tags/v${pkgver}
  git submodule update --init --recursive
  sed -i "s|/usr/local|/usr|" "other/bootstrap_daemon/tox-bootstrapd.service"

  echo 'u! tox-bootstrapd 199 "Tox bootstrapd"' >"$srcdir/toxcore.conf"
  echo "g tox-bootstrapd 199" >>"$srcdir/toxcore.conf"
  echo "d /var/lib/tox-bootstrapd 0750 tox-bootstrapd tox-bootstrapd - -" >"$srcdir/toxcore.tmpfiles"
}

build() {
  cd $_pkgname
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
  cd $_pkgname
  cmake --build build --target test
}

package() {
  cd $_pkgname
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/toxcore.conf" "$pkgdir/usr/lib/sysusers.d/toxcore.conf"
  install -Dm644 "$srcdir/toxcore.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/toxcore.conf"
  install -Dm644 other/bootstrap_daemon/tox-bootstrapd.service "$pkgdir/usr/lib/systemd/system/tox-bootstrapd.service"
  install -Dm644 other/bootstrap_daemon/tox-bootstrapd.conf "$pkgdir/etc/tox-bootstrapd.conf"
}
