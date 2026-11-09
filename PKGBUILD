# Maintainer: Nathan Chere <aur@nathanchere.com.au>
pkgname=pig
appname=pig
pkgver=0.7.0
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
sha256sums=('0e39058a861dd0d76f7961fd5bbc4cacef6b9f0ab5ece0990b9969d6a7c950b8')
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
