# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=dms-shell
_pkg1=DankMaterialShell
pkgname=($pkgbase $pkgbase-hyprland $pkgbase-niri)
pkgver=1.4.3
pkgrel=1
pkgdesc='A Quickshell-based desktop shell with Material 3 design principles'
arch=(x86_64 aarch64)
url="https://github.com/AvengeMedia/$_pkg1"
license=(GPL-3.0-only)
depends=(dgop
         inter-font
         quickshell
         ttf-fira-code
         ttf-material-symbols-variable)
optdepends=('brightnessctl: Laptop display brightness control'
            'cava: Audio visualizer'
            'cliphist: Clipboard history functionality'
            'matugen: Dynamic wallpaper-based theming'
            'networkmanager: Required for network management'
            'qt5ct: Qt5 application theming'
            'qt6ct: Qt6 application theming'
            'wl-clipboard: Copy functionality for PIDs and other elements')
makedepends=(go)
_archive="$_pkg1-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('2be47d1192fd0b6212ab224a5a1c2a83d08ec5374fbbf307721d6e455eb9895d')

build() {
	cd "$_archive/core"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o dms ./cmd/dms
}

package_dms-shell() {
	cd "$_archive"
	depends+=(dms-shell-compositor)
	optdepneds+=('dms-shell-hyprland: Hyprland specific dependencies')
	optdepneds+=('dms-shell-niri: Niri specific dependencies')
	install -Dm0755 -t "$pkgdir/usr/bin/" core/dms
	install -dm0755 "$pkgdir/etc/xdg/quickshell/dms"
	cp -r "quickshell/"* "$pkgdir/etc/xdg/quickshell/dms/"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	cp -r "docs/"* "$pkgdir/usr/share/doc/$pkgname/"
}

package_dms-shell-hyprland() {
	pkgdesc+=' (for Hyprland)'
	provides=(dms-shell-compositor)
	depends=(dms-shell
	         hyprland)
	optdepends=()
}

package_dms-shell-niri() {
	pkgdesc+=' (for Niri)'
	provides=(dms-shell-compositor)
	depends=(niri)
	depends=(dms-shell
	         niri)
	optdepends=()
}
