# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=zstd-git
_pkgname=zstd
pkgver=1.4.4.r598.gf03192c1
pkgrel=2
pkgdesc='A fast and efficient compression algorithm.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/facebook/zstd'
license=('custom:BSD3' 'GPL2')
groups=()
depends=('xz' 'zlib' 'lz4')
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
}
