# Maintainer: thelooter <evekolb2204@gmail.com>

pkgname=gcx-git
pkgver=0.4.0.r6.gf28846f
pkgrel=1
pkgdesc='A CLI for managing Grafana Cloud resources, optimized for agentic usage (VCS, builds the main branch)'
arch=('x86_64' 'aarch64')
url='https://github.com/grafana/gcx'
license=('Apache-2.0')
makedepends=('go>=1.26.2' 'git')
provides=('gcx')
conflicts=('gcx')
options=('!debug')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	# Produces e.g. 0.4.0.r37.gabcdef0 — last tag, commits since, short hash.
	git describe --long --tags --abbrev=7 2>/dev/null |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$pkgname"

	# Pre-fetch modules so build() runs against a read-only tree.
	export GOPATH="$srcdir/gopath"
	export GOFLAGS='-modcacherw'
	go mod download -x
}

build() {
	cd "$pkgname"

	export GOPATH="$srcdir/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw'

	# Inject real build metadata using the actual checkout (unlike the release
	# tarball, the git source has VCS info available).
	local _date _commit _ver
	_date="$(date -u -d "@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%dT%H:%M:%SZ)"
	_commit="$(git rev-parse HEAD)"
	_ver="$(git describe --tags --abbrev=7 2>/dev/null | sed 's/^v//' || echo SNAPSHOT)"

	local _ldflags=(
		"-X main.version=$_ver"
		"-X main.commit=$_commit"
		"-X main.date=$_date"
	)

	go build -o build/gcx -ldflags="${_ldflags[*]}" ./cmd/gcx

	# Completions generated from the freshly built binary so they always match
	# this exact revision's command tree (gcx is Cobra-based).
	for _shell in bash zsh fish; do
		./build/gcx completion "$_shell" > "build/gcx.$_shell"
	done
}

check() {
	cd "$pkgname"
	./build/gcx version >/dev/null
}

package() {
	cd "$pkgname"

	install -Dm755 build/gcx "$pkgdir/usr/bin/gcx"

	install -Dm644 build/gcx.bash "$pkgdir/usr/share/bash-completion/completions/gcx"
	install -Dm644 build/gcx.zsh  "$pkgdir/usr/share/zsh/site-functions/_gcx"
	install -Dm644 build/gcx.fish "$pkgdir/usr/share/fish/vendor_completions.d/gcx.fish"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
