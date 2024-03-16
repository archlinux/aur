# Maintainer: leo <douglarek at gmail dot com>
_name=dae
pkgname=$_name-git
pkgver=0.5.1.r9.gd31d880
pkgrel=2
pkgdesc="A Linux lightweight and high-performance transparent proxy solution based on eBPF."
arch=('x86_64' 'aarch64')
url="https://github.com/daeuniverse/dae"
license=('AGPL')
provides=("$_name")
conflicts=("$_name")
depends=('glibc')
makedepends=('clang' 'go' 'git')
backup=("etc/dae/config.dae")
source=(
	"git+https://github.com/daeuniverse/dae.git"
	"geoip.dat::https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geoip.dat"
	"geosite.dat::https://cdn.jsdelivr.net/gh/Loyalsoldier/v2ray-rules-dat@release/geosite.dat"
)
sha256sums=(
	'SKIP'
	'SKIP'
	'SKIP'
)

pkgver() {
    cd "$_name"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-\([^-]*\)-\([^-]*\)$/.\1.\2/;s/-//'
}

prepare() {
	cd "$srcdir/$_name"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$_name"
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
	export CFLAGS="-fno-stack-protector"
	make VERSION="${pkgver}"
}

package() {
	cd "$srcdir/$_name"
	install -Dm755 "dae" -t "${pkgdir}/usr/bin/"
	install -Dm644 "install/dae.service" -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm640 "install/empty.dae" "${pkgdir}/etc/dae/config.dae"
	install -Dm644 "example.dae" "${pkgdir}/etc/dae/config.dae.example"

	mkdir -p "${pkgdir}/usr/share/dae/"
	cp ../geoip.dat "${pkgdir}/usr/share/dae/geoip.dat"
	cp ../geosite.dat "${pkgdir}/usr/share/dae/geosite.dat"
}
