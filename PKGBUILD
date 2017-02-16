pkgname=dnf
_pkgver=2.1.0
_rpmrel=1
_pkgtag=$pkgname-$_pkgver-$_rpmrel
pkgver=$_pkgver.$_rpmrel
pkgrel=1
pkgdesc="Package manager forked from Yum, using libsolv as a dependency resolver"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2' 'GPL')
depends=('libdnf>=0.7.1' 'libcomps' 'librepo' 'rpm-org'
         'python' 'python-iniparse' 'python-pygpgme')
makedepends=('bash-completion' 'cmake' 'python-sphinx')
checkdepends=('python-nose')
backup=("etc/$pkgname/automatic.conf"
        "etc/$pkgname/$pkgname.conf")
source=("$url/archive/$_pkgtag.tar.gz")
md5sums=('a4ce39cba372c59ee807bffea91a72f7')

prepare() {
	mv "$pkgname-$_pkgtag" "$pkgname-$pkgver"

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

	rm "$pkgdir/"usr/bin/yum "$pkgdir/usr/share/man/man8/yum.8"
	ln -s $pkgname-3 "$pkgdir/usr/bin/$pkgname"
	ln -s $pkgname-automatic-3 "$pkgdir/usr/bin/$pkgname-automatic"

	install -D -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
