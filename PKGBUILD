# Maintainer: Semyon Ivanov <aur at semyon dot dev>

pkgname=srb-id-pkcs11-git
pkgver=0.2.0.r14.g215f330
pkgrel=1
pkgdesc='An open source PKCS11 v2.40 module for Serbian ID smart cards'
arch=('x86_64')
url='https://github.com/ubavic/srb-id-pkcs11'
license=('Unlicense')
depends=('pcsclite')
makedepends=('nss' 'zig')
optdepends=('ccid: USB Chip/Smart Card Interface Devices driver')
provides=('srb-id-pkcs11')
conflicts=('srb-id-pkcs11')
source=("$pkgname::git+https://github.com/ubavic/srb-id-pkcs11.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    zig build -Doptimize=ReleaseSmall -Duse_system_pkcs11
}

package() {
    cd "$srcdir/$pkgname"
    install -dm755 "$pkgdir/usr/lib"
    cp -a zig-out/lib/*.so "$pkgdir/usr/lib/"
    cp -a zig-out/lib/*.so.* "$pkgdir/usr/lib/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
