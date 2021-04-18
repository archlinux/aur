pkgname=dnf
pkgver=4.7.0
pkgrel=1
pkgdesc="Package manager forked from Yum, using libsolv as a dependency resolver"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('libdnf>=0.61.1' 'libcomps>=0.1.8'
         'python' 'python-gpgme' 'rpm-tools>=4.14.0')
makedepends=('bash-completion' 'cmake>=3.13' 'python-sphinx')
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
md5sums=('ae860b226c03774a174ed0bf8646d062')

prepare() {
	cd "$pkgname-$pkgver"

	# sphinx-build-3 does not exist on Arch Linux,
	# use sphinx-build instead
	sed -e 's/sphinx-build-3/sphinx-build/' \
	    -i doc/CMakeLists.txt
}

build() {
	cd "$pkgname-$pkgver"

	cmake -B build \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3

	make -C build
	make -C build doc-man
}

check() {
	cd "$pkgname-$pkgver"

	# Fails because Arch Linux does not support C.UTF-8 locale
	make -n -C build ARGS="--output-on-failure" test
}

package() {
	cd "$pkgname-$pkgver"

	make -C build DESTDIR="$pkgdir/" install

	install -Dp -m644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"

	rm "$pkgdir/usr/share/man/man8/yum.8" \
	   "$pkgdir/usr/share/man/man5/yum.conf.5" \
	   "$pkgdir/usr/share/man/man1/yum-aliases.1" \
	   "$pkgdir/usr/share/man/man8/yum-shell.8"
	ln -s $pkgname-3 "$pkgdir/usr/bin/$pkgname"
	ln -s $pkgname-automatic-3 "$pkgdir/usr/bin/$pkgname-automatic"

	rm "$pkgdir/etc/$pkgname/$pkgname-strict.conf"
}

# vim: set ft=sh ts=4 sw=4 noet:
