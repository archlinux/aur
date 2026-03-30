# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=dms-shell
_pkg1=DankMaterialShell
pkgname=($pkgbase $pkgbase-hyprland $pkgbase-niri)
pkgver=1.4.4
pkgrel=3
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
            'i2c-tools: External monitor brightness control'
            'matugen: Dynamic wallpaper-based theming'
            'networkmanager: Required for network management'
            'power-profiles-daemon: Set power profile'
            'qt6-multimedia: Sound effect support'
            'qt6ct: Qt6 application theming'
            'wtype: Paste from clipboard history and plugins'
            'wl-clipboard: Copy functionality for PIDs and other elements'
            'cups-pk-helper: Printer Management')
makedepends=(go)
_archive="$_pkg1-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('9a23a717eef088da3d25b355d4f13feff7499bbafe5e93c9fa379ee15e962709')

build() {
	cd "$_archive/core"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	go build -v \
		-tags distro_binary \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags="-s -w -linkmode=external -extldflags \"${LDFLAGS}\" -X main.Version=v$pkgver" \
		-o dms ./cmd/dms
}

package_dms-shell() {
	cd "$_archive"
	depends+=(dms-shell-compositor)
	optdepneds+=('dms-shell-hyprland: Hyprland specific dependencies')
	optdepneds+=('dms-shell-niri: Niri specific dependencies')
	install -Dm0755 -t "$pkgdir/usr/bin/" core/dms
	install -dm0755 "$pkgdir/usr/share/quickshell/dms"
	cp -r "quickshell/"* "$pkgdir/usr/share/quickshell/dms/"
	install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	cp -r "docs/"* "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm0644 -t "$pkgdir/usr/lib/systemd/user/" assets/systemd/dms.service
	install -Dm0644 -t "$pkgdir/usr/share/applications/" assets/dms-open.desktop
	install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" assets/danklogo.svg
	# install -Dm0644 completions.bash "$pkgdir/usr/share/bash-completion/completions/dms"
	# install -Dm0644 completions.zsh "$pkgdir/usr/share/zsh/site-functions/_dms"
	# install -Dm0644 completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/dms.fish"
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
