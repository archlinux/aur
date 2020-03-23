pkgname=dnf
pkgver=4.2.19
pkgrel=1
pkgdesc="Package manager forked from Yum, using libsolv as a dependency resolver"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2' 'GPL')
depends=('libdnf>=0.45.0' 'libcomps>=0.1.8'
         'python' 'python-gpgme' 'rpm-tools>=4.14.0')
makedepends=('bash-completion' 'cmake' 'python-sphinx')
checkdepends=('python-nose')
optdepends=('python-unbound: for gpgkey_dns_verification option')
backup=("etc/$pkgname/automatic.conf"
        "etc/$pkgname/$pkgname.conf"
        "etc/$pkgname/aliases.d/zypper.conf"
        "etc/$pkgname/protected.d/$pkgname.conf"
        "etc/$pkgname/protected.d/yum.conf"
        "etc/libreport/events.d/collect_$pkgname.conf"
        "etc/logrotate.d/$pkgname")
options=('!emptydirs')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('8be015daec301a44228160b0f5b43187')

prepare() {
	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build

	# sphinx-build-3 does not exist on Arch Linux,
	# use sphinx-build instead
	sed -e 's/sphinx-build-3/sphinx-build/' \
	    -i doc/CMakeLists.txt
}

build() {
	cd "$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3          \
	      ..
	make
	make doc-man
}

# Tests seem to need a non-empty RPM database installed on the system
#check() {
#	cd "$pkgname-$pkgver"/build
#	make ARGS="-V" test
#}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install

	rm "$pkgdir/usr/share/man/man8/yum.8" \
	   "$pkgdir/usr/share/man/man5/yum.conf.5" \
	   "$pkgdir/usr/share/man/man1/yum-aliases.1" \
	   "$pkgdir/usr/share/man/man8/yum-shell.8"
	ln -s $pkgname-3 "$pkgdir/usr/bin/$pkgname"
	ln -s $pkgname-automatic-3 "$pkgdir/usr/bin/$pkgname-automatic"

	rm "$pkgdir/etc/$pkgname/$pkgname-strict.conf"

	install -Dp -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
