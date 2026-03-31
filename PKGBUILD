# Maintainer: Antranig Vartanian <antranigv@freebsd.am>
pkgname=zelta
pkgver=1.1.0
pkgrel=1
pkgdesc="A safe and powerful ZFS backup and replication suite"
arch=('any')
url="https://zelta.space"
license=('BSD-2-Clause')
depends=('sh' 'gawk')
makedepends=('git')
optdepends=('zfs-utils: ZFS filesystem support'
            'openssh: remote backup operations')
source=("git+https://github.com/bell-tower/zelta.git#tag=v${pkgver}")
sha256sums=('76e3ee5e9db162e59e362ff6b2e13efcb4f99ed7c62cb52052a7bd086c2515a9')

package() {
    cd "$srcdir/$pkgname"
    
    # Override installation paths for Arch packaging
    export ZELTA_BIN="$pkgdir/usr/bin"
    export ZELTA_SHARE="$pkgdir/usr/share/zelta"
    export ZELTA_ETC="$pkgdir/etc/zelta"
    export ZELTA_DOC="$pkgdir/usr/share/man"
    
    # Suppress post-installation messages
    export ZELTA_QUIET=1
    
    # Run the install script
    ./install.sh
    
    # Patch hardcoded /usr/local paths to Arch locations
    sed -i \
        -e 's|/usr/local/etc/zelta|/etc/zelta|g' \
        -e 's|/usr/local/share/zelta|/usr/share/zelta|g' \
        "$pkgdir/usr/bin/zelta"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
