# Maintainer: Maciek Borzecki <maciek.borzecki@gmail.com>
pkgname=fnotifystat
pkgver=0.02.10
pkgrel=1
pkgdesc="file activity monitoring tool"
arch=('x86_64')
url="https://github.com/ColinIanKing/fnotifystat"
license=('GPL2')
depends=()
optdepends=('bash-completion: bash completion support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ColinIanKing/fnotifystat/archive/refs/tags/V${pkgver}.tar.gz")
sha256sums=('cef782ca0697dfd98c8db4688caf37749b1a5299681cc1ba6956f051d1312e24')

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
