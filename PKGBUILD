# Maintainer: Antidote1911 <antidote1911@gmail.com>
#
# Hydra64 from the AppImage of its GitHub release, unpacked into /opt/hydra64: nothing is built,
# and FUSE is not needed to run it. The AppImage carries its own Qt; what it takes from the system
# is in depends=().
#
# New version: change pkgver, then  updpkgsums && makepkg --printsrcinfo > .SRCINFO
# (the checksum is also in the SHA256SUMS file of the release).

pkgname=hydra64-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Chess databases, engine analysis, play against an engine and engine tournaments"
arch=('x86_64')
url="https://antidote1911.github.io/Hydra64/"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'zlib' 'gmp' 'fontconfig' 'freetype2' 'libglvnd' 'libx11' 'libxcb'
         'wayland' 'libgpg-error' 'e2fsprogs' 'hicolor-icon-theme')
optdepends=('fuse3: endgame tablebases read from ISO disc images')
provides=("hydra64=$pkgver")
conflicts=('hydra64')
options=('!strip' '!debug')
_appimage="Hydra64-v$pkgver-linux-x86_64.AppImage"
source=("$_appimage::https://github.com/Antidote1911/Hydra64/releases/download/v$pkgver/$_appimage")
sha256sums=('9e0199e37817764679dfa416d4ad33e60b86df55accc07d94113d00b6c7748b6')

prepare() {
    chmod +x "$_appimage"
    rm -rf squashfs-root
    "./$_appimage" --appimage-extract >/dev/null
}

package() {
    cd squashfs-root

    install -d "$pkgdir/opt/hydra64"
    cp -a . "$pkgdir/opt/hydra64/"
    chmod -R u=rwX,go=rX "$pkgdir/opt/hydra64"

    # The two commands. AppRun sets what the bundled Qt needs; hydra64-convert has no window.
    install -d "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec /opt/hydra64/AppRun "$@"\n' > "$pkgdir/usr/bin/hydra64"
    printf '#!/bin/sh\nexec /opt/hydra64/usr/bin/hydra64-convert "$@"\n' > "$pkgdir/usr/bin/hydra64-convert"
    chmod 755 "$pkgdir/usr/bin/hydra64" "$pkgdir/usr/bin/hydra64-convert"

    install -Dm644 hydra64.desktop "$pkgdir/usr/share/applications/hydra64.desktop"
    install -Dm644 usr/share/icons/hicolor/scalable/apps/hydra64.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 usr/share/metainfo/io.github.antidote1911.hydra64.metainfo.xml -t "$pkgdir/usr/share/metainfo"
    install -Dm644 usr/share/licenses/hydra64/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
