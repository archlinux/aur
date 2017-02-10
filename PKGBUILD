pkgname=dnf-plugins-extras
pkgver=0.10.0
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
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('e8582383dd7fa7c7cfaa0703fd89000f')

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
