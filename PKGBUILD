# Maintainer: thelooter <evekolb2204@gmail.com>

pkgname=gcx
pkgver=0.6.0
pkgrel=1
pkgdesc='A CLI for managing Grafana Cloud resources, optimized for agentic usage'
arch=('x86_64' 'aarch64')
url='https://github.com/grafana/gcx'
license=('Apache-2.0')
makedepends=('go>=1.26.2')
options=('!debug')  # The Go toolchain ships statically-linked binaries without DWARF in a separate package.
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52e4b90a3f02cb524cdfa042b000a5c5e3b28c9caa7b6e196d365c435aea3f1a')

prepare() {
	cd "$pkgname-$pkgver"

	# Pre-fetch modules so build() can run offline with a read-only source tree.
	export GOPATH="$srcdir/gopath"
	export GOFLAGS='-modcacherw'
	go mod download -x
}

build() {
	cd "$pkgname-$pkgver"

	export GOPATH="$srcdir/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

	# Reproducible build metadata. The upstream goreleaser/Makefile inject these
	# via -ldflags; there is no VCS checkout in the release tarball, so we feed
	# the packaged version and a SOURCE_DATE_EPOCH-derived timestamp instead.
	local _date
	_date="$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%dT%H:%M:%SZ)"

	local _ldflags=(
		"-X main.version=v$pkgver"
		"-X main.commit=archlinux"
		"-X main.date=$_date"
	)

	go build -o build/gcx -ldflags="${_ldflags[*]}" ./cmd/gcx

	# Generate shell completions straight from the freshly built binary so they
	# always track the exact command set of this version. gcx is Cobra-based and
	# ships the standard `completion` subcommand for bash, zsh and fish.
	for _shell in bash zsh fish; do
		./build/gcx completion "$_shell" > "build/gcx.$_shell"
	done
}

check() {
	cd "$pkgname-$pkgver"

	# Smoke-test the binary: it must run and report the version we injected.
	./build/gcx version | grep -q "v$pkgver"
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 build/gcx "$pkgdir/usr/bin/gcx"

	# Shell completions, installed to the standard vendor locations so they are
	# picked up automatically with no user action required.
	install -Dm644 build/gcx.bash "$pkgdir/usr/share/bash-completion/completions/gcx"
	install -Dm644 build/gcx.zsh  "$pkgdir/usr/share/zsh/site-functions/_gcx"
	install -Dm644 build/gcx.fish "$pkgdir/usr/share/fish/vendor_completions.d/gcx.fish"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
