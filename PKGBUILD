# Maintainer: Avenge Media <avengemediallc at gmail dot com>

pkgbase=dms-shell-git
_pkgbase=${pkgbase%-git}
_pkgname=DankMaterialShell
pkgname=($_pkgbase-git)
pkgver=1.6.0.r118.g0784bdb
pkgrel=1
pkgdesc='Desktop shell for wayland compositors built with Quickshell & GO'
arch=(x86_64 aarch64)
url="https://github.com/AvengeMedia/$_pkgname"
license=(MIT)
depends=(dgop
         quickshell
         accountsservice)
optdepends=('cava: Audio visualizer'
            'i2c-tools: External monitor brightness control'
            'matugen: Dynamic wallpaper-based theming'
            'qt6-multimedia: Sound effect support'
            'power-profiles-daemon: Set power profile'
            'qt6ct: Qt6 application theming'
            'cups-pk-helper: Printer Management')
makedepends=(git
             go
             make)
provides=("$_pkgbase=$pkgver")
conflicts=("dms-shell")
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
	go build -tags 'distro_binary withshell' -ldflags "${LDFLAGS_GO}" ${GOFLAGS} -o dms ./cmd/dms
}

package_dms-shell-git() {
        optdepends+=('greetd-dms-greeter: DMS Greeter')
	install="$pkgname.install"
	cd "$_pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" core/dms
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm0644 assets/systemd/dms.service "$pkgdir/usr/lib/systemd/user/dms.service"
	install -Dm0644 assets/dms-open.desktop "$pkgdir/usr/share/applications/dms-open.desktop"
	install -Dm0644 assets/com.danklinux.dms.desktop "$pkgdir/usr/share/applications/com.danklinux.dms.desktop"
	install -Dm0644 assets/com.danklinux.dms.notepad.desktop "$pkgdir/usr/share/applications/com.danklinux.dms.notepad.desktop"
	install -Dm0644 assets/com.danklinux.dms.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.danklinux.dms.svg"

	install -d "$pkgdir/usr/share/bash-completion/completions" \
	           "$pkgdir/usr/share/zsh/site-functions" \
	           "$pkgdir/usr/share/fish/vendor_completions.d"
	core/dms completion bash > "$pkgdir/usr/share/bash-completion/completions/dms"
	core/dms completion zsh > "$pkgdir/usr/share/zsh/site-functions/_dms"
	core/dms completion fish > "$pkgdir/usr/share/fish/vendor_completions.d/dms.fish"
}
