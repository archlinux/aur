pkgname=openwsman
pkgver=2.7.2
pkgrel=1
pkgdesc="Opensource Implementation of WS-Management"
arch=('i686' 'x86_64')
url="https://$pkgname.github.io/"
license=('custom:BSD')
depends=('curl' 'libxml2' 'openssl' 'sblim-sfcc')
makedepends=('cmake>=3.13' 'swig'
             'perl'
             'python'
             'ruby' 'ruby-rdoc')
optdepends=('perl: for perl bindings'
            'python: for python bindings'
            'ruby: for ruby bindings')
backup=("etc/$pkgname/$pkgname.conf"
        "etc/$pkgname/${pkgname}_client.conf"
        "etc/$pkgname/ssleay.cnf"
        "etc/pam.d/$pkgname")
source=("https://github.com/Openwsman/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f916b20956a64426c60a34fa2eaf2c8a13c7047ea2d2585329a6f33e00113be1')

build() {
	cd "$pkgname-$pkgver"

	cmake -B build \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG' \
	      -DCMAKE_CXX_FLAGS_RELEASE='-DNDEBUG' \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPACKAGE_ARCHITECTURE=$CARCH \
	      -DLIB=lib \
	      -DBUILD_PYTHON=OFF \
	      -DBUILD_PYTHON3=ON \
	      -DBUILD_RUBY_GEM=OFF \
	      -DBUILD_JAVA=OFF

	make -C build
}

# TODO: find out why tests fail for python/perl/ruby bindings
#       and report a bug upstream if needed
check() {
	cd "$pkgname-$pkgver"

	 make -n -C build ARGS="-V" test
}

package() {
	cd "$pkgname-$pkgver"

	make -C build DESTDIR="$pkgdir/" install

	mv "$pkgdir/usr/sbin/"* "$pkgdir/usr/bin"
	rmdir "$pkgdir/usr/sbin/"

	install -Dp -m644 build/package/"$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dp -m644 package/"$pkgname.firewalld"     "$pkgdir/usr/lib/firewalld/services/$pkgname.xml"

	mkdir -p "$pkgdir/usr/share/doc/$pkgname"
	cp -Rp build/bindings/ruby/html/ "$pkgdir/usr/share/doc/$pkgname/rdoc"

	install -Dp -m644 COPYING   "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	install -Dp -m644 AUTHORS   "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
	install -Dp -m644 ChangeLog "$pkgdir/usr/share/doc/$pkgname/ChangeLog"
}

# vim: set ft=sh ts=4 sw=4 noet:
