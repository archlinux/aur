# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname='warp-plus-git'
pkgver=1.2.5.r0.a49dbf1
pkgrel=2
pkgdesc="An open-source implementation of Cloudflare's Warp, enhanced with Psiphon integration (GitHub Version)."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/bepass-org/warp-plus"
license=('MIT')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/warp-plus/config.json')
install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${url}.git"
		"${pkgname%-git}.service")

sha256sums=('SKIP'
            '5ada20e3b2871c0921dfe36d721914fa02fe2f4892919160daa71992e91be49b')
pkgver() {
    cd "${pkgname%-git}"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "${pkgname%-git}"
    sed -i 's|"gool".*|"gool": true,|' example_config.json
    sed -i 's|"cache-dir".*|"cache-dir": "/etc/warp-plus",|' example_config.json
    sed -i 's|"test-url".*|"test-url": "http://connectivity.cloudflareclient.com/cdn-cgi/trace",|' example_config.json
    sed -i 's|"4".*|"4": false,|' example_config.json
    sed -i 's|"6".*|"6": false,|' example_config.json
    go mod tidy
}

build() {
    cd "${pkgname%-git}/cmd/warp-plus/"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build .
}

package() {
    cd "${pkgname%-git}"
	install -Dm 755 ./cmd/warp-plus/warp-plus "${pkgdir}/usr/bin/${pkgname%-git}"
	install -D -t "${pkgdir}/usr/lib/systemd/system/" -m 644 ../"${pkgname%-git}.service"
	install -Dm 644 example_config.json "${pkgdir}/etc/${pkgname%-git}/config.json"
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
# vim:set ts=4 sw=4 et:
