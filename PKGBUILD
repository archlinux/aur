pkgname=greetd-dms-greeter-git
_binname=dms-greeter
epoch=1
pkgver=0.0.0.r28.ge957e43
pkgrel=1
pkgdesc='Greetd login screen with the Dank Material aesthetic (git)'
arch=('x86_64' 'aarch64')
url='https://github.com/AvengeMedia/dank-greeter'
license=('MIT')
depends=(
    'greetd'
    'quickshell'
    'qt6-declarative'
)
optdepends=(
    'niri: Niri compositor support'
    'hyprland: Hyprland compositor support'
    'sway: Sway compositor support'
)
makedepends=('git' 'go')
provides=("greetd-dms-greeter" "$_binname=$pkgver")
conflicts=('greetd-dms-greeter' 'greetd-dms-greeter-bin' 'dms-greeter')
install=greetd-dms-greeter.install
source=('dank-greeter::git+https://github.com/AvengeMedia/dank-greeter.git')
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/dank-greeter"
	git submodule sync
	git submodule update --init --recursive
}

pkgver() {
	cd "$srcdir/dank-greeter"
	if git describe --tags --long >/dev/null 2>&1; then
		git describe --tags --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
	else
		printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

build() {
	cd "$srcdir/dank-greeter/core"

	local VERSION BUILD_TIME COMMIT
	VERSION="$(git describe --tags --always 2>/dev/null | sed 's/^v//' || echo dev)"
	BUILD_TIME="$(date -u '+%Y-%m-%d_%H:%M:%S')"
	COMMIT="$(git rev-parse --short=8 HEAD 2>/dev/null || echo unknown)"

	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	export GOMODCACHE="$srcdir/gomodcache"

	# Bake the quickshell UI into the binary (populates internal/shellembed/dist)
	make sync-shell

	go build -tags withshell \
		-ldflags "-s -w -X main.Version=${VERSION} -X main.BuildTime=${BUILD_TIME} -X main.Commit=${COMMIT}" \
		-o bin/$_binname ./cmd/$_binname

	mkdir -p bin/completions
	bin/$_binname completion bash > "bin/completions/$_binname"
	bin/$_binname completion zsh  > "bin/completions/_$_binname"
	bin/$_binname completion fish > "bin/completions/$_binname.fish"
}

check() {
	cd "$srcdir/dank-greeter/core"
	export CGO_ENABLED=0 GOMODCACHE="$srcdir/gomodcache"
	go test ./... || true
}

package() {
	cd "$srcdir/dank-greeter"

	install -Dm755 "core/bin/$_binname" "$pkgdir/usr/bin/$_binname"

	install -Dm644 "core/bin/completions/$_binname"      "$pkgdir/usr/share/bash-completion/completions/$_binname"
	install -Dm644 "core/bin/completions/_$_binname"     "$pkgdir/usr/share/zsh/site-functions/_$_binname"
	install -Dm644 "core/bin/completions/$_binname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_binname.fish"

	install -Dm644 assets/systemd/tmpfiles-dms-greeter.conf "$pkgdir/usr/lib/tmpfiles.d/dms-greeter.conf"

	install -dm755 "$pkgdir/usr/share/doc/$pkgname/examples"
	install -m644 assets/examples/* "$pkgdir/usr/share/doc/$pkgname/examples/"

	install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
