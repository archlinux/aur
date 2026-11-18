# Maintainer: Avenge Media <avengemediallc at gmail dot com>

pkgname=dux-edit-git
_pkgname=dux-edit
_binname=dux-edit
_alias=dedit
_appid=dev.duxlabs.edit
pkgver=0.1.0.r0.g67ad782
pkgrel=1
pkgdesc='Text and document editor for Wayland from Dux Labs (git)'
arch=('x86_64' 'aarch64')
url="https://github.com/duxlabs-dev/$_pkgname"
license=('MIT')
depends=('libdux-qt-base.so' 'qt6-declarative')
optdepends=('hunspell: spellcheck'
            'hunspell-en_us: English spellcheck dictionary'
            'polkit: save root-owned files')
makedepends=('git' 'go>=2:1.27')
provides=("$_pkgname=$pkgver" "$_alias")
conflicts=("$_pkgname" "$_alias" 'dux-edit-bin')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule sync
	# dux-qt-base comes from the libdux-qt-base.so package; only the QML common lib is needed
	git submodule update --init --recursive dux-qml-common
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
	export GOTOOLCHAIN=local

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
	export CGO_ENABLED=0 GOMODCACHE="$srcdir/gomodcache" GOTOOLCHAIN=local
	go test ./... || true
}

package() {
	cd "$srcdir/$pkgname"

	install -Dm755 "core/bin/$_binname" "$pkgdir/usr/bin/$_binname"
	ln -s "$_binname" "$pkgdir/usr/bin/$_alias"

	install -Dm644 "core/bin/completions/$_binname"      "$pkgdir/usr/share/bash-completion/completions/$_binname"
	install -Dm644 "core/bin/completions/_$_binname"     "$pkgdir/usr/share/zsh/site-functions/_$_binname"
	install -Dm644 "core/bin/completions/$_binname.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_binname.fish"

	install -Dm644 "assets/$_appid.svg"          "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_appid.svg"
	install -Dm644 "assets/$_appid.desktop"      "$pkgdir/usr/share/applications/$_appid.desktop"
	install -Dm644 "assets/$_appid.metainfo.xml" "$pkgdir/usr/share/metainfo/$_appid.metainfo.xml"
	install -Dm644 "assets/$_appid.policy"       "$pkgdir/usr/share/polkit-1/actions/$_appid.policy"

	install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
