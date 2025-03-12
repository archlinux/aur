pkgname=dnf-plugins-core
pkgver=4.10.1
pkgrel=1
pkgdesc="Core DNF Plugins"
arch=('any')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL-2.0-or-later')
depends=('dnf>=4.19.0' 'python')
makedepends=('cmake>=3.13' 'python-sphinx')
checkdepends=('python-dbus' 'python-systemd')
optdepends=('createrepo_c: for local plugin'
            'python-dateutil: for changelog plugin'
            'python-dbus: for needs-restarting plugin'
            'python-distro: for copr plugin'
            'python-systemd: for system-upgrade plugin')
conflicts=('dnf-plugins-extras<4.1.0')
backup=('etc/dnf/plugins/copr.conf'
        'etc/dnf/plugins/debuginfo-install.conf'
        'etc/dnf/plugins/expired-pgp-keys.conf'
        'etc/dnf/plugins/local.conf'
        'etc/dnf/plugins/pre-transaction-actions.conf'
        'etc/dnf/plugins/post-transaction-actions.conf'
        'etc/dnf/plugins/versionlock.conf'
        'etc/dnf/plugins/versionlock.list')
options=('!emptydirs')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0f6966a6cb62912cd3520ef2a09ddfcdb48aa3091009f9834526b04f6de9a70a')

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

	cmake --build build
	cmake --build build --target doc-man
}

check() {
	cd "$pkgname-$pkgver"

	# Tests fail with non-english locales
	LC_ALL=C.UTF-8 ctest --test-dir build --output-on-failure
}

package() {
	cd "$pkgname-$pkgver"

	DESTDIR="$pkgdir" cmake --install build

	install -Dp -m644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"

	# Conflict with yum-utils
	rm "$pkgdir/usr/share/man/man1/debuginfo-install.1" \
	   "$pkgdir/usr/share/man/man1/needs-restarting.1" \
	   "$pkgdir/usr/share/man/man1/package-cleanup.1" \
	   "$pkgdir/usr/share/man/man1/repodiff.1" \
	   "$pkgdir/usr/share/man/man1/repo-graph.1" \
	   "$pkgdir/usr/share/man/man1/repoclosure.1" \
	   "$pkgdir/usr/share/man/man1/repomanage.1" \
	   "$pkgdir/usr/share/man/man1/reposync.1" \
	   "$pkgdir/usr/share/man/man1/yum-builddep.1" \
	   "$pkgdir/usr/share/man/man1/yum-changelog.1" \
	   "$pkgdir/usr/share/man/man1/yum-config-manager.1" \
	   "$pkgdir/usr/share/man/man1/yum-debug-dump.1" \
	   "$pkgdir/usr/share/man/man1/yum-debug-restore.1" \
	   "$pkgdir/usr/share/man/man1/yumdownloader.1" \
	   "$pkgdir/usr/share/man/man1/yum-groups-manager.1" \
	   "$pkgdir/usr/share/man/man1/yum-utils.1" \
	   "$pkgdir/usr/share/man/man5/yum-versionlock.conf.5" \
	   "$pkgdir/usr/share/man/man8/yum-copr.8" \
	   "$pkgdir/usr/share/man/man8/yum-versionlock.8"
}

# vim: set ft=sh ts=4 sw=4 noet:
