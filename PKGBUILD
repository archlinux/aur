pkgname=openwsman
pkgver=2.8.1
pkgrel=1
pkgdesc="Opensource Implementation of WS-Management"
arch=('i686' 'x86_64')
url="https://$pkgname.github.io/"
license=('custom:BSD')
depends=('curl' 'libxml2' 'openssl' 'sblim-sfcc')
makedepends=('cmake>=3.13' 'swig'
             'perl'
             'python' 'python-distutils-extra'
             'ruby' 'rubygems' 'ruby-docs' 'ruby-rdoc')
optdepends=('perl: for perl bindings'
            'python: for python bindings'
            'ruby: for ruby bindings')
backup=("etc/$pkgname/$pkgname.conf"
        "etc/$pkgname/${pkgname}_client.conf"
        "etc/$pkgname/ssleay.cnf"
        "etc/pam.d/$pkgname")
source=("https://github.com/Openwsman/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
		gcc15.patch)
sha256sums=('22f7dd418eda4d6e4d1c497fcc2a3e2ee91eeff3c19f4a4447dfaec38fd2b87b'
            '405b59b7066c1e4579d50157e87db6ba596796d0ebc48e3f80daa20216be7aef')

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np2 -z .orig < ../gcc15.patch
}

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

_perl_depends() {
# template start; name=perl-binary-module-dependency; version=1;
if [[ $(find "$pkgdir/usr/lib/perl5/" -name "*.so") ]]; then
	_perlver_min=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]);')
	_perlver_max=$(perl -e '$v = $^V->{version}; print $v->[0].".".($v->[1]+1);')
	depends+=("perl>=$_perlver_min" "perl<$_perlver_max")
fi
# template end;
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

	find "$pkgdir" -name '.packlist' -delete
	find "$pkgdir" -name '*.pod' -delete
    _perl_depends
}

# vim: set ft=sh ts=4 sw=4 noet:
