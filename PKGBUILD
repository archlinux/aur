# Maintainer: Avenge Media <avengemediallc at gmail dot com>

pkgname=dux-shell-git
_pkgname=dux-shell
_binname=dms
pkgver=2.0.0.r181.g387750b
pkgrel=1
pkgdesc='Desktop shell for wayland compositors built with Quickshell & GO (git)'
arch=(x86_64 aarch64)
url="https://github.com/duxlabs-dev/$_pkgname"
license=(MIT)
depends=(quickshell
         accountsservice)
optdepends=('dux-gop: System monitoring backend for the process list and resource widgets'
            'cava: Audio visualizer'
            'i2c-tools: External monitor brightness control'
            'matugen: Dynamic wallpaper-based theming'
            'qt6-multimedia: Sound effect support'
            'power-profiles-daemon: Set power profile'
            'qt6ct: Qt6 application theming'
            'cups-pk-helper: Printer Management'
            'dux-greeter: Dux Shell login screen for greetd')
makedepends=(git
             go
             make)
provides=("dms-shell=$pkgver" "$_pkgname=$pkgver")
conflicts=(dms-shell "$_pkgname" dms-shell-git)
replaces=(dms-shell-git)
install="$pkgname.install"
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 --match="v*" HEAD 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "0.0.0.r0.$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$_pkgname"
	[ -f .gitmodules ] || return 0
	git submodule sync
	git submodule update --init --recursive
}

build() {
	cd "$_pkgname/core"

	local VERSION BUILD_TIME COMMIT LDFLAGS_GO
	VERSION="$(git describe --tags --always 2>/dev/null || echo dev)"
	BUILD_TIME="$(date -u '+%Y-%m-%d_%H:%M:%S')"
	COMMIT="$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"

	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"

	LDFLAGS_GO="-s -w -X main.Version=${VERSION} -X main.buildTime=${BUILD_TIME} -X main.commit=${COMMIT} -linkmode=external"

	make sync-shell

	GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -tags 'distro_binary withshell' -ldflags "${LDFLAGS_GO}" ${GOFLAGS} -o "$_binname" "./cmd/$_binname"
}

package() {
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "core/$_binname"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 "assets/systemd/$_binname.service" "$pkgdir/usr/lib/systemd/user/$_binname.service"
	install -Dm0644 assets/dms-open.desktop "$pkgdir/usr/share/applications/dms-open.desktop"
	install -Dm0644 assets/dev.duxlabs.shell.desktop "$pkgdir/usr/share/applications/dev.duxlabs.shell.desktop"
	install -Dm0644 assets/dev.duxlabs.shell.notepad.desktop "$pkgdir/usr/share/applications/dev.duxlabs.shell.notepad.desktop"
	install -Dm0644 assets/dev.duxlabs.shell.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/dev.duxlabs.shell.svg"

	install -d "$pkgdir/usr/share/bash-completion/completions" \
	           "$pkgdir/usr/share/zsh/site-functions" \
	           "$pkgdir/usr/share/fish/vendor_completions.d"
	"core/$_binname" completion bash > "$pkgdir/usr/share/bash-completion/completions/$_binname"
	"core/$_binname" completion zsh  > "$pkgdir/usr/share/zsh/site-functions/_$_binname"
	"core/$_binname" completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/$_binname.fish"
}
