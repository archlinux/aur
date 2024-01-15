# Maintainer: Maciek Borzecki <maciek.borzecki@gmail.com>
pkgname=fnotifystat
pkgver=0.02.11
pkgrel=1
pkgdesc="file activity monitoring tool"
arch=('x86_64')
url="https://github.com/ColinIanKing/fnotifystat"
license=('GPL2')
depends=()
optdepends=('bash-completion: bash completion support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ColinIanKing/fnotifystat/archive/refs/tags/V${pkgver}.tar.gz")
sha256sums=('cb0f7388fe65eb5ab85ee51da569f3cb84bc76fb94ab83c1be1b5541bd745726')

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
