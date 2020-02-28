# Maintainer: Your Name <syr.chloe@gmail.com>
pkgname=libbitcoin-system-3.6.0
pkgver=3.6.0
pkgrel=2
pkgdesc="Bitcoin Cross-Platform C++ Development Toolkit"
arch=('aarch64' 'x86_64')
license=('AGPLv3')
groups=('libbitcoin')
url="https://github.com/libbitcoin"
depends=('boost'
         'boost-libs'
         'icu'
         'libpng'
         'libsecp256k1'
         'qrencode')
makedepends=('autoconf'
             'automake'
             'gcc>=4.8.0'
             'git'
             'libtool'
             'm4'
             'make'
             'pkg-config')
conflicts=("libbitcoin<$pkgver"
	       "libbitcoin-system-git<$pkgver")
source=("$pkgname.tar.gz::https://github.com/libbitcoin/libbitcoin-system/archive/v$pkgver.tar.gz"
        "git+https://github.com/libbitcoin/libbitcoin-system.wiki")
sha256sums=('5bcc4c31b53acbc9c0d151ace95d684909db4bf946f8d724f76c711934c6775c'
            'SKIP')

threads=$(nproc)

prepare() {
	cd "$pkgname"
	msg2 'Preparing...'
	# Bug fix, ref: https://github.com/libbitcoin/libbitcoin-system/pull/1136
	cd src/chain
	sed 's/std::fesetround(FE_UPWARD);/std::fesetround(FE_TONEAREST);/g' block.cpp > tmp.cpp
	rm block.cpp && mv tmp.cpp block.cpp
}

build() {
	msg2 'Building...'
	cd "$pkgname"
	./autogen.sh
	./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --libexecdir=/usr/lib/libbitcoin \
        --sysconfdir=/etc \
        --sharedstatedir=/usr/share/libbitcoin \
        --localstatedir=/var/lib/libbitcoin \
        --with-icu \
        --with-png \
        --with-qrencode \
        --with-gnu-ld \
        --without-examples
	make -j$threads
}

check() {
	msg2 'Testing...'
	cd "$pkgname"
	make -j$threads check
}

package() {
	cd "$pkgname"

    msg2 'Installing license...'
    install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libbitcoin"

    msg2 'Installing...'
    make DESTDIR="$pkgdir" install

    msg2 'Installing documentation...'
    cp -dpr --no-preserve=ownership "$srcdir/libbitcoin-system.wiki" \
        "$pkgdir/usr/share/doc/libbitcoin/wiki"

    msg2 'Cleaning up pkgdir...'
    find "$pkgdir" -type d -name .git -exec rm -r '{}' +
    find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
