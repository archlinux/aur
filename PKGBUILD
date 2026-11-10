# Maintainer: Necromortis <necromortis(a)protonmail.com>
pkgname=vultisig
pkgver=1.0.80
pkgrel=1
pkgdesc="Seedless multi-chain crypto wallet based on threshold signatures (MPC/TSS)"
arch=('x86_64')
url="https://github.com/vultisig/vultisig-windows"
license=('Apache-2.0')
# Direct ELF dependencies of the bundled binary (nothing is shipped inside the AppImage)
depends=('webkit2gtk' 'gtk3' 'gdk-pixbuf2' 'glib2' 'hicolor-icon-theme')
_appimage="$pkgname-v$pkgver.AppImage"
source=("$_appimage::$url/releases/download/v$pkgver/$_appimage")
noextract=("$_appimage")
sha256sums=('4890b39223352cdbe361c6313aa9e9f8ba0ef2eca811444500aa2dc0c1dc92cf')

prepare() {
    chmod +x "$_appimage"
    # --appimage-extract works without FUSE
    "./$_appimage" --appimage-extract >/dev/null
}

package() {
    cd squashfs-root

    # The AppImage bundles no libraries, only a single Wails binary linked
    # against system webkit2gtk-4.0/gtk3. Install that binary directly and
    # skip the AppImage runtime (no FUSE dependency, no unpacking on launch).
    install -Dm755 usr/bin/vultisig "$pkgdir/usr/lib/$pkgname/vultisig"

    # Launcher: replicate what AppRun does (vault DB location), then exec
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<'EOF'
#!/bin/sh
mkdir -p "$HOME/.vultisig"
export VULTISIG_DB_PATH="$HOME/.vultisig/"
exec /usr/lib/vultisig/vultisig "$@"
EOF

    # Desktop entry (the one shipped inside points Exec at AppRun)
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Vultisig
Comment=$pkgdesc
Exec=$pkgname
Icon=$pkgname
Terminal=false
Categories=Office;Finance;
StartupWMClass=$pkgname
EOF

    # Icon: the AppImage misplaces the SVG under 256x256/ with 700 dirs;
    # install -D creates the hicolor tree with proper 755 permissions.
    install -Dm644 vultisig.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
