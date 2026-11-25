# Maintainer: Antidote1911 <antidote1911@users.noreply.github.com>
#
# Cryptyrust from the AppImage of its GitHub release: nothing is built, and FUSE is not needed.
# The AppImage only wraps the program (it bundles no library), so the program itself is installed
# in /usr/bin with its desktop entry and icon. What it loads from the system is in depends=().
#
# New version: ../publish.sh (pkgver, updpkgsums, makepkg --printsrcinfo > .SRCINFO, push to the AUR)

pkgname=cryptyrust-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="Post-quantum file encryption: drag-and-drop GUI and command line (X25519 + ML-KEM, Argon2id)"
arch=('x86_64')
url="https://github.com/Antidote1911/cryptyrust"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'libxkbcommon' 'libxkbcommon-x11' 'libx11' 'libxcb' 'libxcursor' 'libxi'
         'libglvnd' 'xdg-desktop-portal' 'hicolor-icon-theme')
optdepends=('wayland: run on Wayland when no X server is available')
provides=("cryptyrust=$pkgver")
conflicts=('cryptyrust')
options=('!strip' '!debug')
_appimage="cryptyrust-$pkgver-linux.AppImage"
source=("$_appimage::https://github.com/Antidote1911/cryptyrust/releases/download/v$pkgver/$_appimage")
sha256sums=('d88e6202115060f0ac6ed60c966f8cdc04e6a87b0159b0d35f38e0df88901d3f')

prepare() {
    chmod +x "$_appimage"
    rm -rf squashfs-root
    "./$_appimage" --appimage-extract >/dev/null
}

package() {
    cd squashfs-root
    install -Dm755 usr/bin/cryptyrust -t "$pkgdir/usr/bin"
    install -Dm644 usr/share/applications/cryptyrust.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 usr/share/icons/hicolor/512x512/apps/cryptyrust.png \
        -t "$pkgdir/usr/share/icons/hicolor/512x512/apps"
}
