# Maintainer: Avenge Media <avengemediallc at gmail dot com>

pkgbase=dms-shell-git
_pkgbase=${pkgbase%-git}
_pkgname=DankMaterialShell
pkgname=($_pkgbase-git $_pkgbase-hyprland-git $_pkgbase-niri-git)
pkgver=0.5.0.r10.gdb584b7
pkgrel=2
pkgdesc='Desktop shell for wayland compositors built with Quickshell & GO'
arch=(x86_64 aarch64)
url="https://github.com/AvengeMedia/$_pkgname"
license=(MIT)
depends=(dgop
         quickshell
         accountsservice)
optdepends=('cava: Audio visualizer'
            'cliphist: Clipboard history functionality'
            'i2c-tools: External monitor brightness control'
            'matugen: Dynamic wallpaper-based theming'
            'qt6-multimedia: Sound effect support'
            'power-profiles-daemon: Set power profile'
            'qt6ct: Qt6 application theming'
            'wl-clipboard: Copy functionality for PIDs and other elements')
makedepends=(git
             go)
provides=("$_pkgbase=$pkgver")
conflicts=("dms-shell")
source=(
        "git+$url.git"
        "dms.service"
        "completions.bash"
        "completions.fish"
        "completions.zsh")
sha256sums=('SKIP'
            '513be09c9a4f56fe1274b6bc823d2eafaa3f3da9892bd668767844b83c94011a'
            '61e116dd2fe4cd87ab203f6a3d193404dd5f3c0c0f6dc262439a64411bcb30c4'
            '8d5de8fb070817daa9104f92ca0104cfc54ac549068d575a0ced41c4e9c42667'
            '41fa22da4d8d442583d1914315d82bad47e1e013a81f653d501fbbc4aa16eb2d')
pkgver() {
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 --match="v*" HEAD 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "0.0.0.r0.$(git rev-parse --short=7 HEAD)"
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

	GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -tags distro_binary -ldflags "${LDFLAGS_GO}" ${GOFLAGS} -o dms ./cmd/dms
}

package_dms-shell-git() {
	optdepends+=('dms-shell-hyprland: Hyprland specific dependencies')
	optdepends+=('dms-shell-niri: Niri specific dependencies')
        optdepends+=('greetd-dms-greeter: DMS Greeter')
	install="$pkgname.install"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname/core/dms"
	install -dm0755 "$pkgdir/usr/share/quickshell/dms"
	cp -r "$_pkgname/quickshell"/* "$pkgdir/usr/share/quickshell/dms/"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "$_pkgname/README.md"
	cp -r "$_pkgname/docs/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -rf "$pkgdir/usr/share/quickshell/dms/.git"*
	install -Dm0644 "dms.service" "$pkgdir/usr/lib/systemd/user/dms.service"
	install -Dm0644 "completions.bash" "$pkgdir/usr/share/bash-completion/completions/dms"
	install -Dm0644 "completions.zsh" "$pkgdir/usr/share/zsh/site-functions/_dms"
	install -Dm0644 "completions.fish" "$pkgdir/usr/share/fish/vendor_completions.d/dms.fish"
}

package_dms-shell-hyprland-git() {
	pkgdesc+=" (for Hyprland)"
	conflicts=("${pkgname%-git}")
	depends=(dms-shell-git
	         hyprland)
	optdepends=()
}

package_dms-shell-niri-git() {
	pkgdesc+=" (for Niri)"
	conflicts=("${pkgname%-git}")
	depends=(niri)
	depends=(dms-shell-git
	         niri)
	optdepends=()
}
