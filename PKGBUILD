# Maintainer: Villager <villager@disroot.org>

pkgname=snowflake
pkgbase=snowflake-pt
pkgver=2.9.0
pkgrel=1
pkgdesc='Pluggable Transport for Tor using WebRTC, inspired by Flashproxy'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='https://snowflake.torproject.org/'
license=('BSD')
depends=('glibc')
makedepends=('go')
options=('!lto')
provides=('snowflake')
source=("https://gitlab.torproject.org/tpo/anti-censorship/pluggable-transports/snowflake/-/archive/v${pkgver}/snowflake-v${pkgver}.tar.gz")
sha256sums=('7a58e8006e6716249741917e0d58a70d07e15a8b3d7f10737c8bb4a1134b5e8c')

build() {
	cd "${pkgname}-v${pkgver}"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	go build -o snowflake-broker ./broker
	go build -o snowflake-client ./client
	go build -o snowflake-proxy ./proxy
	go build -o snowflake-server ./server
}

package() {
	cd "${pkgname}-v${pkgver}"

	install -Dm755 snowflake-broker -t "${pkgdir}/usr/bin/"
	install -Dm755 snowflake-client -t "${pkgdir}/usr/bin/"
	install -Dm755 snowflake-proxy -t "${pkgdir}/usr/bin/"
	install -Dm755 snowflake-server -t "${pkgdir}/usr/bin/"

	install -Dm644 doc/*.1 -t "${pkgdir}/usr/share/man/man1/"
}
