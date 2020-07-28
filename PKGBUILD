# Maintainer: Maciek Borzecki <maciek.borzecki@gmail.com>
pkgname=fnotifystat
pkgver=0.02.06
pkgrel=1
pkgdesc="file activity monitoring tool"
arch=('x86_64')
url="https://kernel.ubuntu.com/~cking/fnotifystat/"
license=('GPL2')
depends=()
optdepends=('bash-completion: bash completion support')
source=("https://kernel.ubuntu.com/~cking/tarballs/fnotifystat/$pkgname-$pkgver.tar.gz")
sha256sums=('3e5a2795da012940621e15543712f12c335aa688ec61f2153c18a38ce0c722d7')

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
