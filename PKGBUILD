# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgbase=dms-shell
_pkg1=DankMaterialShell
pkgname=($pkgbase $pkgbase-hyprland $pkgbase-niri)
pkgver=1.4.4
pkgrel=6
pkgdesc='A Quickshell-based desktop shell with Material 3 design principles'
arch=(x86_64 aarch64)
url="https://github.com/AvengeMedia/$_pkg1"
license=(MIT)
depends=(dgop
         accountsservice
         quickshell)
optdepends=('cava: Audio visualizer'
            'cups-pk-helper: Printer Management'
            'i2c-tools: External monitor brightness control'
            'iwd: Required for network managementa via iwd'
            'matugen: Dynamic wallpaper-based theming'
            'networkmanager: Required for network managementa via networkmanager'
            'power-profiles-daemon: Set power profile'
            'qt6-multimedia: Sound effect support'
            'qt6ct: Qt6 application theming'
            'systemd: Required for network managementa via systemd-networkd'
            'wtype: Paste from clipboard history and plugins')
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

_completion() {
	cd "$_archive"
	core/dms completion $1
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
	install -Dm0644 <(_completion bash) "$pkgdir/usr/share/bash-completion/completions/dms"
	install -Dm0644 <(_completion zsh) "$pkgdir/usr/share/zsh/site-functions/_dms"
	install -Dm0644 <(_completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/dms.fish"
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
