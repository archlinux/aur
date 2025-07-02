# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: tleydxdy <shironeko(at)waifu(dot)club>
pkgname=system76-power
pkgver=1.2.6
pkgrel=1
pkgdesc="System76 Power Management"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/system76-power"
license=('GPL-3.0-or-later')
depends=(
  'dbus'
  'libusb'
  'polkit'
)
makedepends=('cargo')
optdepends=(
  'system76-acpi-dkms: only needed for systems using open firmware with kernels <5.16'
  'system76-dkms: needed for systems using proprietary firmware'
)
provides=('power-profiles-daemon')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'use-mkinitcpio.patch')
sha256sums=('28a5eba1b8ff5fef5e0b2629b71a8290e7c1b9ffb7bb09f584c621bd1df39de4'
            'bae03d96faea0f7ea80cb1cc5d4f2f97804509db378aaacb3e1d08cd38e05765')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # use 'mkinitcpio -P' in place of 'update-initramfs -u'
  patch -Np1 -i "$srcdir/use-mkinitcpio.patch"
}

build() {
  cd "$pkgname-$pkgver"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  ARGS+=" --frozen" make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
