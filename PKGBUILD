# Maintainer: Rin Cat <me@rin.cat>

pkgname=wireguard-hardened
pkgver=0.0.20191012
pkgrel=1
pkgdesc='Wireguard module for Hardened Kernel'
arch=('x86_64')
url='http://www.wireguard.com/'
license=('GPL')
depends=('linux-hardened')
makedepends=('gcc' 'linux-hardened-headers')
conflicts=('wireguard-dkms')
provides=('WIREGUARD-MODULE')
validpgpkeys=('AB9942E6D4A4CFC3412620A749FC7012A5DE03AE') # Jason A. Donenfeld <Jason@zx2c4.com>
source=("https://git.zx2c4.com/WireGuard/snapshot/WireGuard-${pkgver}.tar"{.xz,.asc})
sha256sums=('93573193c9c1c22fde31eb1729ad428ca39da77a603a3d81561a9816ccecfa8e'
            'SKIP')

build() {
        cd "${srcdir}/WireGuard-${pkgver}/src/"
    make KERNELRELEASE="$(file -b /boot/vmlinuz-linux-hardened | sed 's/.*version //;s/ .*//')" module
}

package() {
    cd "${srcdir}/WireGuard-${pkgver}/src/"
    xz wireguard.ko
    install -Dt "$pkgdir/usr/lib/modules/$(file -b /boot/vmlinuz-linux-hardened | sed 's/.*version //;s/ .*//')/extramodules/" -m0644 wireguard.ko.xz
}

