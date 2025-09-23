# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: tleydxdy <shironeko(at)waifu(dot)club>
pkgname=system76-power
pkgver=1.2.8
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
sha256sums=('6c3f145b6c7abb7b4251dc29a77a0ce395ac0939a71d540032e2e153e2542b78'
            'fd69c70b5c64516c92418bda6bad7a21e0695f47ad85def4132b12a97916ed02')

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
