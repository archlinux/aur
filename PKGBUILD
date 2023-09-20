# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Corey Hinshaw <coreyhinshaw(at)gmail(dot)com>
pkgname=system76-io-dkms
_modname=system76-io
pkgver=1.0.3
pkgrel=1
pkgdesc="DKMS module for controlling System76 Io board"
arch=('x86_64')
url="https://github.com/pop-os/system76-io-dkms"
license=('GPL3')
depends=('dkms')
makedepends=('git')
_commit=0f86350b4f608f0dca7d87ab95d035137995b88d  # tags/1.0.3^0
source=("git+https://github.com/pop-os/system76-io-dkms.git#commit=${_commit}")
sha256sums=('SKIP')
#validpgpkeys=('DA0878FCF806089ED4FDDF58E988B49EE78A7FB1') # Jeremy Soller <jeremy@system76.com>

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed 's/-/+/g'
}

package() {
  cd "$srcdir/$pkgname"

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
