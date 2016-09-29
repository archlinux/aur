# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd
pkgver=1.1.0
pkgrel=2
pkgdesc='A fast and efficient compression algorithm.'
arch=('i686' 'x86_64')
url='https://github.com/facebook/zstd'
license=('custom:BSD3' 'GPL2')
groups=()
depends=('glibc')
source=("https://github.com/facebook/zstd/archive/v${pkgver}.tar.gz")
noextract=()
sha1sums=('6c24a604cf71a961d4172cbced6b10470d1b416e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
    make -C contrib/pzstd
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
    install -D -m755 contrib/pzstd/pzstd "$pkgdir/usr/bin/pzstd"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 PATENTS "$pkgdir/usr/share/licenses/$pkgname/PATENTS"
}

check() {
    cd "$srcdir/$pkgname-$pkgver"

    # The distribution includes a full test suite which unfortunately takes
    # several minutes to run. Here we just perform a quick smoke test.
    (
        file="$(mktemp)"
        trap "rm $file" exit
        dd if=/dev/urandom of="$file" bs=4M count=1 status=none
        <"$file" ./zstd - - | ./zstd -d - - | cmp "$file" -
    )
}

