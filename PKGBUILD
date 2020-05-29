# Maintainer: Maciek Borzecki <maciek.borzecki@gmail.com>
pkgname=fnotifystat
pkgver=0.02.05
pkgrel=1
pkgdesc="file activity monitoring tool"
arch=('x86_64')
url="https://kernel.ubuntu.com/~cking/fnotifystat/"
license=('GPL2')
depends=()
optdepends=('bash-completion: bash completion support')
source=("https://kernel.ubuntu.com/~cking/tarballs/fnotifystat/$pkgname-$pkgver.tar.gz")
sha256sums=('293e12ffb7890bc8af8dce498b3742062be5b085c0a926aa3949ea300eee17ad')

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
