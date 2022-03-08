# Maintainer: Maciek Borzecki <maciek.borzecki@gmail.com>
pkgname=fnotifystat
pkgver=0.02.07
pkgrel=2
pkgdesc="file activity monitoring tool"
arch=('x86_64')
url="https://github.com/ColinIanKing/fnotifystat"
license=('GPL2')
depends=()
optdepends=('bash-completion: bash completion support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ColinIanKing/fnotifystat/archive/refs/tags/V${pkgver}.tar.gz")
sha256sums=('fa0d1bfcb96cdc427b5042d4bfe6e1cb2dc52936e222b5b7aeba3d25a97ee20a')

prepare() {
	  cd "$pkgname-$pkgver"
    for name in "${source[@]}"; do
        if [[ "${name%.patch}" == "$name" ]]; then
            # not a patch
            continue
        fi
        msg2 "applying $name"
        patch -p1 -i "$srcdir/$name"
    done
}

build() {
	  cd "$pkgname-$pkgver"
	  make
}

package() {
	  cd "$pkgname-$pkgver"
	  make DESTDIR="$pkgdir/" install
    # sbin is a symlink to bin, so we need to adjust the path
    mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"
}
