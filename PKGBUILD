# Maintainer: Avenge Media <avengemediallc at gmail dot com>

pkgbase=dms-shell-git
_pkgbase=${pkgbase%-git}
_pkg1=DankMaterialShell
_pkg2=danklinux
pkgname=($_pkgbase-git $_pkgbase-hyprland-git $_pkgbase-niri-git)
pkgver=0.4.2.r3.g27da96b.3963c98
pkgrel=1
pkgdesc='Desktop shell for wayland compositors built with Quickshell & GO'
arch=(x86_64 aarch64)
url="https://github.com/AvengeMedia/$_pkg1"
license=(GPL-3.0-only)
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
        "git+${url/$_pkg1/$_pkg2}.git"
        "dms.service")
sha256sums=('SKIP'
            'SKIP'
            '3641600632e6db51481ec2f6de5bc2fafd6e97f3792dc25acfc7d3703ceca4ff')
pkgver() {
    cd "$_pkg2"
    local VERSION1
    VERSION1=$(git describe --long --tags --abbrev=7 --match="v*" HEAD 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || echo "0.0.0.r0.$(git rev-parse --short=7 HEAD)")
    
    cd "$srcdir/$_pkg1"
    local VERSION2
    VERSION2=$(git rev-parse --short=7 HEAD)
    
    echo "${VERSION1}.${VERSION2}"
}

build() {
	cd "$_pkg2"

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
	install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkg2/dms"
	install -dm0755 "$pkgdir/usr/share/quickshell/dms"
	cp -r "$_pkg1"/* "$pkgdir/usr/share/quickshell/dms/"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" "$_pkg1/README.md"
	cp -r "$_pkg1/docs/"* "$pkgdir/usr/share/doc/$pkgname/"
	rm -rf "$pkgdir/usr/share/quickshell/dms/.git"*
	install -Dm0644 "dms.service" "$pkgdir/usr/lib/systemd/user/dms.service"
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
