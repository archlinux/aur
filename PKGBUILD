pkgname=openwsman
pkgver=2.6.5
pkgrel=1
pkgdesc="Opensource Implementation of WS-Management"
arch=('i686' 'x86_64')
url="https://$pkgname.github.io/"
license=('BSD')
depends=('libxml2' 'openssl-1.0' 'sblim-sfcc')
makedepends=('cmake' 'swig'
             'perl'
             'python'
             'ruby' 'ruby-docs')
optdepends=('perl: for perl bindings'
            'python: for python bindings'
            'ruby: for ruby bindings')
backup=("etc/$pkgname/$pkgname.conf"
        "etc/$pkgname/${pkgname}_client.conf"
        "etc/$pkgname/ssleay.cnf"
        "etc/pam.d/$pkgname")
source=("https://github.com/Openwsman/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('84d066233a0b9d6ef00657dc8241d353')

prepare() {
	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"/build
	export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig/
	cmake -DCMAKE_BUILD_TYPE=Release           \
	      -DCMAKE_C_FLAGS=-I/usr/include/openssl-1.0 \
	      -DCMAKE_INSTALL_PREFIX=/usr          \
	      -DPACKAGE_ARCHITECTURE=$CARCH        \
	      -DLIB=lib                            \
	      -DBUILD_RUBY_GEM=OFF                 \
	      -DBUILD_JAVA=OFF                     \
	..
	make
}

# TODO: find out why tests fail for python/perl/ruby bindings
#       and report a bug upstream if needed
#check() {
#	 cd "$pkgname-$pkgver"/build
#	 make ARGS="-V" test
#}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install

	mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin"
	rmdir "$pkgdir/usr/sbin/"

	install -Dp -m644 ../AUTHORS   "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
	install -Dp -m644 ../ChangeLog "$pkgdir/usr/share/doc/$pkgname/ChangeLog"
	install -Dp -m644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	cp -Rp "bindings/ruby/html/"   "$pkgdir/usr/share/doc/$pkgname/rdoc"

	install -Dp -m644 ../COPYING   "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: set ft=sh ts=4 sw=4 noet:
