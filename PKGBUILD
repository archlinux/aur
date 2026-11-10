# Maintainer: Athulkrishna <athulkrishnasv2015@gmail.com>
pkgname=misterdownloadmanager-bin
_pkgname=misterdownloadmanager
_upstream_url=https://github.com/anefzaoui/misterdownloadmanager
_distname=MisterDownloadManager
pkgver=0.5.2
pkgrel=1
pkgdesc="The ultimate open-source download manager (prebuilt binary)"
arch=('x86_64')
url="https://github.com/anefzaoui/$_pkgname"
license=('GPL-3.0-only')
depends=('dbus' 'glibc' 'hicolor-icon-theme' 'libgcc' 'libglvnd'
         'libx11' 'libxcursor' 'libxi' 'libxkbcommon' 'libxkbcommon-x11'
         'libxrender' 'wayland')
optdepends=('flatpak: install browser extensions'
            'vulkan-icd-loader: GPU-accelerated rendering')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip')
source=("$_distname-$pkgver-linux-x86_64.tar.gz::$url/releases/download/v$pkgver/$_distname-$pkgver-linux-x86_64.tar.gz")
sha256sums=('3327ebd6b5565186c3e1286bbfdc85ffc95fa681cc2a57a51b0bc07ff42a009f')

package() {
	local _root="$srcdir/$_distname-$pkgver-linux-x86_64"
	install -Dm755 "$_root/misterdownloadmanager" "$pkgdir/usr/bin/misterdownloadmanager"
	install -Dm755 "$_root/misterdownloadmanager-cli" "$pkgdir/usr/bin/misterdownloadmanager-cli"
	install -Dm755 "$_root/misterdownloadmanager-mcp" "$pkgdir/usr/bin/misterdownloadmanager-mcp"
	install -Dm755 "$_root/misterdownloadmanager-nmhost" "$pkgdir/usr/bin/misterdownloadmanager-nmhost"
	# Upstream ships no .desktop entry; provide a minimal one so the app
	# shows up in application menus.
	install -d "$pkgdir/usr/share/applications"
	cat > "$pkgdir/usr/share/applications/misterdownloadmanager.desktop" <<'DESKTOP'
[Desktop Entry]
Type=Application
Name=Mister Download Manager
GenericName=Download Manager
Comment=Download and manage files
Exec=misterdownloadmanager %U
Terminal=false
Categories=Network;FileTransfer;
StartupNotify=true
StartupWMClass=misterdownloadmanager
DESKTOP
	install -d "$pkgdir/usr/share/misterdownloadmanager"
	install -Dm644 "$_root/ATTRIBUTION.md" "$pkgdir/usr/share/doc/$pkgname/ATTRIBUTION.md"
	install -Dm644 "$_root/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	# Browser extensions
	install -d "$pkgdir/usr/share/misterdownloadmanager/extension-chromium"
	cp -a "$_root/extension-chromium/." "$pkgdir/usr/share/misterdownloadmanager/extension-chromium/"
	install -Dm644 "$_root/mdm-firefox.xpi" "$pkgdir/usr/share/misterdownloadmanager/mdm-firefox.xpi"
}
