# Contributor: Sam Day <me@samcday.com>

pkgname=dnf5
pkgver=5.2.9.0
pkgrel=1
pkgdesc="Next-generation RPM package management system"
arch=('x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
conflicts=('dnf')
depends=('appstream>=0.16' 'curl>=7.62.0' 'fmt' 'glib2>=2.46.0' 'json-c'
         'libmodulemd>=2.11.2' 'librepo>=1.18.0' 'libsolv>=0.7.30' 'libxml2'
         'rpm-tools>=4.17.0' 'sqlite>=3.35.0' 'util-linux-libs')
makedepends=('bash-completion' 'cmake>=3.21' 'doxygen' 'gettext' 'perl'
             'python' 'python-breathe' 'python-sphinx' 'python-sphinx_rtd_theme'
             'toml11' 'swig')
checkdepends=('cppunit' 'createrepo_c' 'perl-test-exception')
optdepends=('perl: for perl bindings'
            'python: for python bindings')
backup=('etc/dnf/dnf.conf'
        'etc/dnf/libdnf5-plugins/actions.conf'
        'etc/dnf/libdnf5-plugins/appstream.conf')
options=('!emptydirs')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname-no-sdbus-cpp.patch")
sha256sums=('4f2e3250a4af60163729e16610f1e6e8a71ed122e2cc81f94bab79cbeac2b997'
            'db37d26afdd4bc00e6a9133bf17214e6c5ed48aa4380fd5e39c1f87d18744a02')

prepare() {
	cd "$pkgname-$pkgver"

	# https://github.com/rpm-software-management/dnf5/issues/1866
	patch -p1 -i "$srcdir/$pkgname-no-sdbus-cpp.patch"
}

build() {
	cd "$pkgname-$pkgver"

	cmake -B build \
	      -DCMAKE_INSTALL_PREFIX='/usr' \
	      -DCMAKE_INSTALL_SBINDIR='bin' \
	      -DWITH_RUBY='OFF'  # https://github.com/rpm-software-management/dnf5/issues/562

	cmake --build build
	cmake --build build --target doc-man
}

check() {
	cd "$pkgname-$pkgver"

	LC_ALL=C.UTF-8 ctest --test-dir build --output-on-failure
}

package() {
	cd "$pkgname-$pkgver"

	DESTDIR="$pkgdir" cmake --install build

	install -Dp -m644 COPYING.md "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim: set ft=sh ts=4 sw=4 noet:
