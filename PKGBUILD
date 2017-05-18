# Maintainer: Leif Middelschulte <leif.middelschulte@gmail.com>
pkgname=native-hdfs-fuse-git
pkgver=r38.60a5f6e
pkgrel=1
pkgdesc="C HDFS FUSE implementation, no libhdfs"
arch=('i686' 'x86_64')
url="https://github.com/remis-thoughts/native-hdfs-fuse"
license=('Apache-2.0')
depends=('fuse2' 'protobuf-c' 'uncrustify')
makedepends=('git' 'fuse2' 'protobuf-c' 'uncrustify')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/remis-thoughts/native-hdfs-fuse')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

    # do not fail because of compiler warnings (i.e. unused variable)
    sed -i  's;-Werror;;g;' Makefile

    # use DESTDIR prefix for install
    sed -i  's; /usr/bin; $(DESTDIR)usr/bin;' Makefile
    # create said DESTDIR+/usr/bin
    sed -i  's;install ;install -D ;' Makefile
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
