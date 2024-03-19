# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname='warp-plus-git'
pkgver=1.0.4.rc2.r34.efe8b5d
pkgrel=1
pkgdesc="An open-source implementation of Cloudflare's Warp, enhanced with Psiphon integration."
arch=('x86_64')
url="https://github.com/bepass-org/warp-plus"
license=('MIT')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git"
				"${pkgname%-git}.service")
sha256sums=('SKIP'
            'c6fff6a05911c091d77d38392b7d9a74b0885a843096d45654c37ff071d0664d')
pkgver() {
    cd "${pkgname%-git}"
    printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "${pkgname%-git}"
    go mod tidy
}

build() {
    cd "${pkgname%-git}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build .
}

package() {
    cd "${pkgname%-git}"
	  install -Dm755 warp-plus "${pkgdir}/usr/bin/${pkgname%-git}"
	  install -D -t "${pkgdir}/usr/lib/systemd/system/" -m 644 ../"${pkgname%-git}.service"
	  install -d "${pkgdir}/etc/${pkgname%-git}"
	  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
# vim:set ts=4 sw=4 et:
