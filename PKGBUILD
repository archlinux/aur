# Maintainer: QymIsTech <basson30@gmail.com>
#
# QymCAD packaged from the published AppImage: the file is unpacked and its contents are laid out the way
# Arch expects them, rather than the AppImage being installed as a lump.
#
# WHY UNPACK RATHER THAN INSTALL THE .AppImage ITSELF. An AppImage placed in /opt and symlinked needs FUSE
# to mount itself at every start - one more moving part between a person and the program, and one that
# breaks on machines where FUSE is not set up. Unpacked, it is ordinary files: the desktop entry and the
# icons are where the desktop environment looks for them, and the program starts with no mount at all.
pkgname=qymcad-bin
# THE VERSION IS WRITTEN TWICE ON PURPOSE. `pkgver` may not contain a hyphen (pacman reads a hyphen as the
# boundary before pkgrel), while the release is named with one. `_relver` is the name the file really has
# on the release page; a guard keeps the two from drifting.
pkgver=0.1.0.dev.20260910
_relver=0.1.0-dev.20260910
pkgrel=1
pkgdesc="Parametric associative B-rep CAD/CAM"
arch=('x86_64')
url="https://github.com/QymIs-Tech/QymCAD"
license=('AGPL-3.0-or-later')
# WHAT THE PACKAGE DOES NOT CARRY. The AppImage brings its own copies of the window libraries, but the
# driver's side of the graphics stack must come from the system: a copy built elsewhere would talk to a
# driver it was not built against.
depends=('libglvnd' 'fontconfig' 'hicolor-icon-theme')
optdepends=('vulkan-icd-loader: hardware acceleration through Vulkan')
provides=('qymcad')
conflicts=('qymcad')
options=('!strip' '!debug')
source=("qymcad-${_relver}-${CARCH}.AppImage::${url}/releases/download/v${_relver}/qymcad-${_relver}-${CARCH}.AppImage")
noextract=("qymcad-${_relver}-${CARCH}.AppImage")
sha256sums=('80c9f1e721f42dd87a7daea1ed88554da673e27c42b487bd35cb06221deb679e')

prepare() {
    cd "$srcdir"
    chmod +x "qymcad-${_relver}-${CARCH}.AppImage"
    ./"qymcad-${_relver}-${CARCH}.AppImage" --appimage-extract >/dev/null
}

package() {
    cd "$srcdir/squashfs-root"

    # The program and the libraries it carries, kept together under /opt so that nothing of ours lands
    # among the system's own libraries.
    install -d "$pkgdir/opt/qymcad"
    cp -a usr "$pkgdir/opt/qymcad/"

    # THE LINK GOES STRAIGHT TO THE BINARY. Measured on the built package: its RUNPATH is `$ORIGIN/../lib`,
    # so it finds its own libraries relative to where it really lies, whatever path was used to reach it.
    # The AppImage's `AppRun` is itself only a symlink to this same binary, so putting it in between would
    # be a second hop that does nothing.
    install -d "$pkgdir/usr/bin"
    ln -s /opt/qymcad/usr/bin/qymcad "$pkgdir/usr/bin/qymcad"

    # The desktop entry and the icons come OUT of the package rather than being written here again: a
    # second copy of them would drift from the one the AppImage carries.
    install -Dm644 qymcad.desktop "$pkgdir/usr/share/applications/qymcad.desktop"
    for icon in usr/share/icons/hicolor/*/apps/qymcad.png; do
        [ -e "$icon" ] || continue
        install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$(basename "$(dirname "$(dirname "$icon")")")/apps/qymcad.png"
    done

    # AGPL-3.0 asks for the licence text to accompany the program, and LGPL-2.1 (OCCT) for the notice.
    install -Dm644 usr/share/doc/qymcad/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 usr/share/doc/qymcad/THIRD-PARTY-NOTICES.md "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY-NOTICES.md"

    # The copies under /opt would be installed twice over: once as the program, once as documentation.
    rm -rf "$pkgdir/opt/qymcad/usr/share/doc"
}
