# Maintainer: Christopher Price <pricechrispy at gmail dot com>

_pkgname=foomuuri
pkgname=foomuuri-git
pkgver=r413.ee8fca6
pkgrel=1
pkgdesc="Multizone bidirectional nftables firewall"
arch=('x86_64')
url="https://github.com/FoobarOy/foomuuri"
license=('GPL-2.0-or-later')
depends=('python' 'python-requests' 'nftables')
optdepends=('dbus-python: D-Bus interface for dynamic zone/interface changes'
            'python-systemd: systemd journal logging'
            'python-gobject: D-Bus mainloop'
            'python-lxml: HTML/XML parsing in iplist filters'
            'python-prometheus_client: foomuuri_exporter for Prometheus metrics')
makedepends=('make' 'flake8' 'git')
conflicts=('foomuuri')
provides=('foomuuri')
source=("git+https://github.com/FoobarOy/foomuuri.git")
sha256sums=('SKIP')

options=()

pkgver() {
    cd "$srcdir/$_pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	sed -i 's|/usr/sbin|/usr/bin|' Makefile
	# Skip pylint in all Makefiles due to false positives with optional dbus imports in v0.30+
	find . -name Makefile -exec sed -i '/^\tpylint /d' {} \;
	make
}

package() {
	cd "$srcdir/$_pkgname"
        make install DESTDIR="${pkgdir}"
        install -m 644 -Dt "$pkgdir/usr/share/licenses/$_pkgname" "$srcdir/$_pkgname/COPYING"
}
