# Maintainer: Semyon Ivanov <aur at semyon dot dev>

_pkgname=srb-id-pkcs11
pkgname=$_pkgname-git
pkgver=0.4.0.r1.g48153cf
pkgrel=1
pkgdesc='An open source PKCS11 v2.40 module for Serbian ID smart cards'
arch=('x86_64')
url='https://github.com/ubavic/srb-id-pkcs11'
license=('Unlicense')
depends=('ccid' 'p11-kit' 'pcsclite')
makedepends=('zig')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/ubavic/srb-id-pkcs11.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$_pkgname"
    zig build -Doptimize=ReleaseSmall
}

check() {
    cd "$srcdir/$_pkgname"
    zig build test
}

package() {
    cd "$srcdir/$_pkgname"

    install -dm755 "$pkgdir/usr/lib/pkcs11"
    cp -a zig-out/lib/*.so "$pkgdir/usr/lib/pkcs11"
    cp -a zig-out/lib/*.so.* "$pkgdir/usr/lib/pkcs11"

    install -dm755 "$pkgdir/usr/share/p11-kit/modules"
    echo "module: /usr/lib/pkcs11/libsrb-id-pkcs11.so" > srb-id-pkcs11.module
    install -Dm644 srb-id-pkcs11.module -t "$pkgdir/usr/share/p11-kit/modules"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
