# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=pig
appname=pig
pkgver=0.4.1
pkgrel=1
pkgdesc="Pi coding agent ported to Go"
arch=('x86_64' 'aarch64')
url="https://github.com/MichaelKinsy/PiG"
license=('MIT')
depends=('bash' 'ca-certificates' 'fd' 'glibc' 'ripgrep')
makedepends=('go>=1.27.1')
optdepends=(
	'git: Git package sources and repository status'
	'go: Go extensions and native Piglet builds'
	'nodejs>=22.13.0: JavaScript and TypeScript extensions'
	'npm: npm package sources'
	'python: Python extensions'
	'rust: Rust extensions'
	'wl-clipboard: clipboard support on Wayland'
	'xclip: clipboard support on X11'
	'xdg-utils: open browser links'
)
source=("${appname}-${pkgver}-source.tar.gz::${url}/releases/download/v${pkgver}/${appname}-${pkgver}-source.tar.gz")
sha256sums=('d2c7bcc58baa50faf2579fcf0d04b6679eece55385c0fc7618cd2ad841aaa733')
options=('!strip' '!emptydirs')

prepare() {
	cd "$srcdir/$appname-$pkgver"
	GOWORK=off go mod download
}

build() {
	cd "$srcdir/$appname-$pkgver"
	export GOWORK=off
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -buildvcs=false -ldflags="-linkmode=external -X main.Build=v${pkgver}" -o bin/pig ./cmd/pig
}

check() {
	cd "$srcdir/$appname-$pkgver"
	# The full upstream suite requires its pinned Pi comparator and SDK toolchains.
	[[ "$(bin/pig --version)" == "$pkgver+"* ]]
	bin/pig --help > /dev/null
}

package() {
	cd "$srcdir/$appname-$pkgver"
	install -Dm755 bin/pig "$pkgdir/usr/bin/pig"
	install -Dm644 LICENSE NOTICE THIRD_PARTY_NOTICES.md -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/LICENSES"
}
