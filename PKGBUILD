# Maintainer: Jérôme Poulin <jeromepoulin@gmail.com>
# Contributor: Jiri Tyr <jiri.tyr@gmail.com>

pkgname='keyleds'
pkgver=1.2.0
pkgrel=1
pkgdesc='Advanced RGB LED animation driver for G213, G410, G513, G610, G810, G910 and GPro'
arch=('x86_64' 'aarch64')
url="https://github.com/ticpu/keyleds"
license=('GPL-3.0-only')
depends=(
  'libevdev'
  'libuv'
  'libx11'
  'libxi'
  'libyaml'
  'luajit'
  'systemd-libs'
)
makedepends=(
  'cmake'
)
backup=('etc/keyledsd.conf')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('87ea7148c40fe15e8273068f96203a522bb0c95ea7567b75d009f98edc8e55a1')

build() {
  cd "$pkgname-$pkgver"
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=MinSizeRel \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build build -j"$(nproc)"
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build

  # The systemd unit and the udev rule are installed by the build itself
  install -m 644 -D keyledsd/keyledsd.conf.sample "$pkgdir/etc/keyledsd.conf"
  install -m 644 -D keyledsd/keyledsd.1 "$pkgdir/usr/share/man/man1/keyledsd.1"
  install -m 644 -D keyledsctl/keyledsctl.1 "$pkgdir/usr/share/man/man1/keyledsctl.1"
}
