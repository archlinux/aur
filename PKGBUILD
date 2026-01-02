# Maintainer: meowkate <meowkatee@gmail.com>
# Contributor: leo <douglarek@gmail.com>

_name=dae
pkgname=$_name-next-git
pkgver=1.0.0.r885.g3942dff
pkgrel=1
pkgdesc="A Linux lightweight and high-performance transparent proxy solution based on eBPF."
arch=('x86_64' 'aarch64')
url="https://github.com/LostAttractor/dae"
license=('AGPL-3.0-or-later')
provides=("$_name-next")
conflicts=("$_name")
depends=(
	'glibc'
	'v2ray-geoip'
	'v2ray-domain-list-community'
)
makedepends=('clang' 'go' 'git' 'jq')
install="${_name}.install"
source=(
	"git+https://github.com/LostAttractor/dae.git"
	"git+https://github.com/LostAttractor/outbound.git#branch=next"
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
	cd "$srcdir/$_name"
	local version=$(jq -r .version package.json)
	printf "%s.r%s.g%s" "${version}" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$srcdir/$_name"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$_name"
	export CFLAGS="-fno-stack-protector"
	export CGO_ENABLED=1
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export BUILD_ARGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	make VERSION="${pkgver}"
}

package() {
	cd "$srcdir/$_name"
	install -Dm755 "dae" -t "${pkgdir}/usr/bin/"
	install -Dm644 "install/${_name}.service" -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 "example.dae" "${pkgdir}/etc/dae/config.dae.example"

	mkdir -p "${pkgdir}/usr/share/${_name}/"
	ln -vs /usr/share/v2ray/geoip.dat "${pkgdir}/usr/share/${_name}/geoip.dat"
	ln -vs /usr/share/v2ray/geosite.dat "${pkgdir}/usr/share/${_name}/geosite.dat"
}
