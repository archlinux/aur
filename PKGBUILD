pkgname=dnf-plugins-extras
_pkgver=0.10.0-rc1
pkgver=0.10.0.rc1
pkgrel=1
pkgdesc="Extras DNF Plugins"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('dnf>=2.0.0' 'python')
makedepends=('cmake' 'python-sphinx')
checkdepends=('python-nose')
optdepends=('createrepo_c: for local plugin'
            'snapper: for snapper plugin'
            'tracer:  for tracer plugin')
backup=('etc/dnf/plugins/local.conf'
        'etc/dnf/plugins/rpmconf.conf'
        'etc/dnf/plugins/torproxy.conf'
        'etc/dnf/plugins/versionlock.conf'
        'etc/dnf/plugins/versionlock.list')
options=(!emptydirs)
source=("$url/archive/$_pkgver/$pkgname-$_pkgver.tar.gz")
md5sums=('3eab757ba60b7fcf6ad4ecc42fc38fcc')

prepare() {
	mv "$pkgname-$_pkgver" "$pkgname-$pkgver"

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

# Tests seem to need a minimal RPM database on the system
#check() {
#	cd "$pkgname-$pkgver"
#	PYTHONPATH=./plugins nosetests -s tests
#}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install

	install -D -m644 ../README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}

# vim: set ft=sh ts=4 sw=4 noet:
