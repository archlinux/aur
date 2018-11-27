# Maintainer: Ben Alex <ben.alex@acegi.com.au>

pkgname=envoy-exporter-git
_pkgbase=envoy-exporter
pkgver=r4.67d6f33
pkgrel=1
pkgdesc="Prometheus exporter for Enphase Envoy Gateway"
arch=('x86_64')
url="https://github.com/benalexau/envoy-exporter"
license=('MIT')
groups=()
makedepends=('cargo')
replaces=()
backup=('etc/envoy-exporter.toml')
options=()
install=envoy-exporter.install
source=('git+https://github.com/benalexau/envoy-exporter.git'
	"${_pkgbase}.install"
	"${_pkgbase}.service")
noextract=()
sha512sums=('SKIP'
            'f0c8812f8304bf507a231e6911a2af97e17abb97d9d0c99e87c5b6b5d8ecdf0f153b67792fa16f559968ece6a0744ab9cb6ae82c54fe01a83deeec68ca3b843a'
            '1f433b995a72db7d45ff050cf9448d8c24329c19e183a999394157246edd31969802f8a803e2e0a12bd513cbb51cbcb855bc9e3a4f50a7b94811855578cf3817')

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
	install -D -m 0644 "$srcdir/envoy-exporter.service" "$pkgdir/usr/lib/systemd/system/envoy-exporter.service"
	install -D -m 0644 "$srcdir/$_pkgbase/etc/config.toml" "$pkgdir/etc/envoy-exporter.toml"
	install -D -m 0755 "$srcdir/$_pkgbase/target/release/envoy-exporter" "$pkgdir/usr/bin/envoy-exporter"
}
