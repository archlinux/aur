# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd-git
_pkgname=zstd
pkgver=1.1.0.r0.g83543a7
pkgrel=2
pkgdesc='A fast and efficient compression algorithm.'
arch=('i686' 'x86_64')
url='https://github.com/facebook/zstd'
license=('custom:BSD3' 'GPL2')
groups=()
depends=('glibc')
makedepends=('git')
conflicts=('zstd')
provides=('zstd')
# Use the dev branch by default; upstream merges only full releases to master.
source=('git://github.com/facebook/zstd.git#branch=dev')
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
    cd "$srcdir/$_pkgname"
    make
    make -C contrib/pzstd
}

package() {
    cd "$srcdir/$_pkgname"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
    install -D -m755 contrib/pzstd/pzstd "$pkgdir/usr/bin/pzstd"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -D -m644 PATENTS "${pkgdir}/usr/share/licenses/${_pkgname}/PATENTS"
}

check() {
    cd "$srcdir/$_pkgname"

    # The distribution includes a full test suite which unfortunately takes
    # several minutes to run. Here we just perform a quick smoke test.
    (
        file="$(mktemp)"
        trap "rm $file" exit
        dd if=/dev/urandom of="$file" bs=4M count=1 status=none
        <"$file" ./zstd - - | ./zstd -d - - | cmp "$file" -
    )
}

