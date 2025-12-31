# Maintainer: Kevin F. Cantero <kevin.cantero@vortex.ar>

pkgbase=bms-shell
_pkg1=BakraDEMaterialShell
pkgname=($pkgbase $pkgbase-hyprland $pkgbase-niri)
pkgver=1.0.3
pkgrel=1
pkgdesc='A Quickshell-based desktop shell with Material 3 design principles'
arch=(x86_64 aarch64)
url="https://github.com/Heroblaze2310/bms-shell"
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
source=("https://github.com/Heroblaze2310/bms-shell/raw/main/BakraDEMaterialShell-1.0.3.tar.gz")
sha256sums=('073132dadd4b7067193e6ad1c5791d0acb27307518df55a341cbb62da9a05918')

build() {
	cd "$_archive/core"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o bms ./cmd/bms
}

package_bms-shell() {
	cd "$_archive"
	depends+=(bms-shell-compositor)
	optdepneds+=('bms-shell-hyprland: Hyprland specific dependencies')
	optdepneds+=('bms-shell-niri: Niri specific dependencies')
	install -Dm0755 -t "$pkgdir/usr/bin/" core/bms
	install -dm0755 "$pkgdir/etc/xdg/quickshell/bms"
	cp -r "quickshell/"* "$pkgdir/etc/xdg/quickshell/bms/"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	cp -r "docs/"* "$pkgdir/usr/share/doc/$pkgname/"
}

package_bms-shell-hyprland() {
	pkgdesc+=' (for Hyprland)'
	provides=(bms-shell-compositor)
	depends=(bms-shell
	         hyprland)
	optdepends=()
}

package_bms-shell-niri() {
	pkgdesc+=' (for Niri)'
	provides=(bms-shell-compositor)
	depends=(niri)
	depends=(bms-shell
	         niri)
	optdepends=()
}
