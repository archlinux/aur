pkgname=dnf
pkgver=4.0.10
pkgrel=1
pkgdesc="Package manager forked from Yum, using libsolv as a dependency resolver"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2' 'GPL')
depends=('libdnf>=0.24.1' 'libcomps>=0.1.8' 'libmodulemd>=1.4.0'
         'python' 'python-gpgme' 'python-iniparse'
         'rpm-org')
makedepends=('bash-completion' 'cmake' 'python-sphinx')
checkdepends=('python-nose')
backup=("etc/$pkgname/automatic.conf"
        "etc/$pkgname/$pkgname.conf"
        "etc/$pkgname/protected.d/$pkgname.conf"
        "etc/logrotate.d/$pkgname")
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('9a13f1b52d0de425278681b9357998e7')

prepare() {
	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build
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

	install -Dp -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
