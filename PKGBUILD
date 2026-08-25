# Maintainer: Your Name <you@example.com>

pkgname=dankcalendar-git
_pkgname=dankcalendar
_binname=dcal
_iconname=com.danklinux.dankcalendar
_desktopid=com.danklinux.dankcalendar
pkgver=0.3.1.r29.g29bf555
pkgrel=1
pkgdesc='Local, Google, Microsoft, and CalDAV calendars for the dank desktop (git)'
arch=('x86_64' 'aarch64')
url="https://github.com/AvengeMedia/$_pkgname"
license=('MIT')
depends=('quickshell' 'qt6-declarative')
optdepends=('dms-shell: dynamic theming via DankMaterialShell colors')
makedepends=('git' 'go')
provides=("$_binname=$pkgver" "$_pkgname=$pkgver")
conflicts=("$_binname" "$_pkgname" 'dankcalendar-bin')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule sync
	git submodule update --init --recursive
}

pkgver() {
	cd "$srcdir/$pkgname"
	if git describe --tags --long >/dev/null 2>&1; then
		git describe --tags --long | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
	else
		printf "0.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	fi
}

build() {
	cd "$srcdir/$pkgname/core"

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
	cd "$srcdir/$pkgname/core"
	export CGO_ENABLED=0 GOMODCACHE="$srcdir/gomodcache"
	go test ./... || true
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 "core/bin/$_binname" "$pkgdir/usr/bin/$_binname"

	install -Dm644 "core/bin/completions/$_binname"      "$pkgdir/usr/share/bash-completion/completions/$_binname"
	install -Dm644 "core/bin/completions/_$_binname"     "$pkgdir/usr/share/zsh/site-functions/_$_binname"
	install -Dm644 "core/bin/completions/$_binname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_binname.fish"

	install -Dm644 "assets/$_iconname.svg" \
		"$pkgdir/usr/share/icons/hicolor/scalable/apps/$_iconname.svg"

	install -Dm644 "assets/$_desktopid.desktop" \
		"$pkgdir/usr/share/applications/$_desktopid.desktop"

	install -Dm644 "assets/systemd/$_binname.service" \
		"$pkgdir/usr/lib/systemd/user/$_binname.service"

	install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
