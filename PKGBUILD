# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>
pkgname=system76-io-dkms
pkgver=1.0.4
pkgrel=1
pkgdesc="DKMS module for controlling System76 Io board"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/system76-io-dkms"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/pop-os/system76-io-dkms.git#tag=$pkgver")
sha256sums=('b80de8520d0635500eb13b857578b6c0a817e610b14d26d192af936d61dc9286')
#validpgpkeys=('DA0878FCF806089ED4FDDF58E988B49EE78A7FB1') # Jeremy Soller <jeremy@system76.com>

package() {
  cd "$pkgname"

  # Install source files
  for file in {Makefile,*.c,*.h}; do
    [ -f "${file}" ] || continue
    install -D -m644 -t "$pkgdir/usr/src/system76-io-$pkgver/" "${file}"
  done

  # Edit and install dkms configuration
  sed "s/#MODULE_VERSION#/$pkgver/" "debian/system76-io-dkms.dkms" > \
    "$pkgdir/usr/src/system76-io-$pkgver/dkms.conf"

  # Load the module at boot
  install -Dm644 "usr/share/initramfs-tools/modules.d/$pkgname.conf" \
    "$pkgdir/usr/lib/modules-load.d/system76-io.conf"
}
