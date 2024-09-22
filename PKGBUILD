# Contributor: Sam Day <me@samcday.com>

pkgname=dnf5
pkgver=5.2.6.2
pkgrel=1
pkgdesc="Next-generation RPM package management system"
arch=('x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
conflicts=('dnf')
depends=('curl>=7.62.0' 'fmt' 'glib2>=2.46.0' 'json-c' 'libmodulemd>=2.11.2'
         'librepo>=1.18.0' 'libsolv>=0.7.30' 'libxml2' 'rpm-tools>=4.17.0'
         'sdbus-cpp>=0.9.0' 'sqlite>=3.35.0' 'systemd-libs' 'util-linux-libs')
makedepends=('bash-completion' 'cmake>=3.13' 'doxygen' 'gettext' 'perl'
             'python' 'python-breathe' 'python-sphinx' 'python-sphinx_rtd_theme'
             'toml11' 'swig' 'systemd')
checkdepends=('cppunit' 'createrepo_c' 'perl-test-exception')
optdepends=('perl: for perl bindings'
            'polkit: for dnf5daemon-server'
            'python: for python bindings')
backup=('etc/dnf/dnf.conf'
        'etc/dnf/libdnf5-plugins/actions.conf')
options=('!emptydirs')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('3e23f517852fba7c3bdebc9c90f34d34a3b1e901a2e74af0d666159d80613605')

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
