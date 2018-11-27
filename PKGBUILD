# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=sonnen-exporter-git
_pkgbase=sonnen-exporter
pkgver=r6.1c2dca1
pkgrel=1
pkgdesc="Prometheus exporter for Sonnen battery systems"
arch=('x86_64')
url="https://github.com/benalexau/sonnen-exporter"
license=('MIT')
groups=()
makedepends=('cargo')
replaces=()
backup=('etc/sonnen-exporter.toml')
options=()
install=sonnen-exporter.install
source=('git+https://github.com/benalexau/sonnen-exporter.git'
	"${_pkgbase}.install"
	"${_pkgbase}.service")
noextract=()
sha512sums=('SKIP'
            '18573308c195020a8e10451e12dc972a77ba546dfad9dabdd5e4cf04d36c34aea021dadbca66fcc7f8cc1e33760ce8ff8e22c8fb04c271cd4a168469b570cb36'
            '1fa76df3c744db87f0b704bc24d1d3e3712cf9ae6c6df710cbf1bc6285cf91fd8084358cecd55d10eecb0ca86e55729928f29574b24957749509170aeb6dd701')

pkgver() {
	cd "$srcdir/$_pkgbase"
	( set -o pipefail
	    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$srcdir/$_pkgbase"
	cargo build --release
}

package() {
	install -D -m 0644 "$srcdir/sonnen-exporter.service" "$pkgdir/usr/lib/systemd/system/sonnen-exporter.service"
	install -D -m 0644 "$srcdir/$_pkgbase/etc/config.toml" "$pkgdir/etc/sonnen-exporter.toml"
	install -D -m 0755 "$srcdir/$_pkgbase/target/release/sonnen-exporter" "$pkgdir/usr/bin/sonnen-exporter"
}
