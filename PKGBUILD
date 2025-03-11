# Contributor: Sam Day <me@samcday.com>

pkgname=dnf5
pkgver=5.2.11.0
pkgrel=1
pkgdesc="Next-generation RPM package management system"
arch=('x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
conflicts=('dnf')
depends=('appstream>=0.16' 'curl>=7.62.0' 'fmt' 'glib2>=2.46.0' 'json-c'
         'libmodulemd>=2.11.2' 'librepo>=1.18.0' 'libsolv>=0.7.30' 'libxml2'
         'rpm-tools>=4.17.0' 'sdbus-cpp>=0.9.0' 'sqlite>=3.35.0' 'systemd-libs'
         'util-linux-libs' 'zlib')
makedepends=('bash-completion' 'cmake>=3.21' 'doxygen' 'gettext' 'perl'
             'python' 'python-breathe' 'python-sphinx' 'python-sphinx_rtd_theme'
             'toml11' 'swig' 'systemd')
checkdepends=('cppunit' 'createrepo_c' 'perl-test-exception')
optdepends=('gnupg: for libdnf5-expired-pgp-keys plugin'
            'perl: for perl bindings'
            'polkit: for dnf5daemon-server'
            'python: for python bindings')
backup=('etc/dnf/dnf.conf'
        'etc/dnf/libdnf5-plugins/actions.conf'
        'etc/dnf/libdnf5-plugins/appstream.conf'
        'etc/dnf/libdnf5-plugins/expired-pgp-keys.conf')
options=('!emptydirs')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1519df6aadcc3d91e85067cf9bb1efaed3e66b3d4189776768db394f0232625e')

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
