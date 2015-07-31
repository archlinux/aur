pkgname=dnf
_pkgver=1.0.2
_rpmrel=3
pkgver=$_pkgver.$_rpmrel
pkgrel=1
pkgdesc="Package manager forked from Yum, using libsolv as a dependency resolver"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2' 'GPL')
depends=('hawkey' 'libcomps' 'librepo' 'rpm-org'
         'python' 'python-iniparse' 'python-pygpgme')
makedepends=('cmake' 'python-sphinx')
checkdepends=('python-nose')
backup=("etc/$pkgname/automatic.conf"
        "etc/$pkgname/$pkgname.conf")
source=("$url/archive/$pkgname-$_pkgver-$_rpmrel.tar.gz")
md5sums=('ba597d82f7edcb54ad65290b64ab5a94')

prepare() {
	cd "$pkgname-$pkgname-$_pkgver-$_rpmrel"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgname-$_pkgver-$_rpmrel"/build
	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3          \
	      ..
	make
	make doc-man
}

# Tests seem to need a non-empty RPM database installed on the system
#check() {
#	cd "$pkgname-$pkgname-$_pkgver-$_rpmrel"/build
#	make ARGS="-V" test
#}

package() {
	cd "$pkgname-$pkgname-$_pkgver-$_rpmrel"/build
	make DESTDIR="$pkgdir/" install

	rm "$pkgdir/"usr/bin/yum "$pkgdir/usr/share/man/man8/yum.8"
	ln -s $pkgname-3 "$pkgdir/usr/bin/$pkgname"
	ln -s $pkgname-automatic-3 "$pkgdir/usr/bin/$pkgname-automatic"

	install -D -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
