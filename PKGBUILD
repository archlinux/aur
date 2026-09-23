# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: noturbob <142563527+noturbob@users.noreply.github.com>

_gitauthor=noturbob
_gitname=slat
_appname=${_gitname}
pkgname=${_appname}
pkgdesc="Terminal multiplexer with tiling panes, tabs and workspaces that keep running after you close the window"

pkgver=0.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")

makedepends=('go')
depends=('glibc')

options=('!strip' '!lto')

source=("${pkgname}-${pkgver}.tgz::${_ghurl}/archive/${_gitversion}.tar.gz")
sha256sums=('1072f4087382e815431dff0d3af612dce134f19dd68b53fcdb79c873569524d3')


build() {
	cd "${pkgname}-${pkgver}"

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

	go build -ldflags "-linkmode=external -X github.com/noturbob/slat/internal/app.Version=${_gitversion}" -o slat ./cmd/slat
}

check() {
	cd "${pkgname}-${pkgver}"

	# The end-to-end tests need a PTY and a shell, which clean chroots may lack.
	go test ./internal/vt/ ./internal/layout/ ./internal/config/ ./cmd/slat/
}

package() {
	cd "${pkgname}-${pkgver}"

	install -Dm755 "${_appname}" -t "${pkgdir}/usr/bin/"

	install -Dm644 "${_appname}.1" -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 "config.example.toml" -t "${pkgdir}/usr/share/doc/${pkgname}/config/"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
