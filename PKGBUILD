pkgname=dnf-plugins-core
_pkgver=2.1.2
_rpmrel=1
_pkgtag=$pkgname-$_pkgver-$_rpmrel
pkgver=$_pkgver.$_rpmrel
pkgrel=1
pkgdesc="Core DNF Plugins"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('dnf>=2.4.0' 'python')
makedepends=('cmake' 'python-sphinx')
checkdepends=('python-nose')
optdepends=('createrepo_c: for local plugin')
backup=('etc/dnf/plugins/debuginfo-install.conf'
        'etc/dnf/plugins/local.conf'
        'etc/dnf/plugins/versionlock.conf'
        'etc/dnf/plugins/versionlock.list')
options=(!emptydirs)
source=("$url/archive/$_pkgtag.tar.gz")
md5sums=('0ed39b15a99647e721f81a31f99b2fd4')

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

check() {
	cd "$pkgname-$pkgver"
	PYTHONPATH=./plugins nosetests -s tests
}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install

	install -D -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
