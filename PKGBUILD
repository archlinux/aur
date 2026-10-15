# Maintainer: Fabian Schmieder <fabian@schmieder.eu>
pkgname=morphos-cross-bin
pkgver=20260529
pkgrel=3
pkgdesc="GCC 15 cross-compiler toolchain for MorphOS (PowerPC), with the MorphOS SDK"
arch=('x86_64' 'aarch64')
url="https://github.com/metaneutrons/morphos-cross"
license=('GPL-3.0-or-later' 'LicenseRef-MorphOS-SDK')
depends=('glibc')
makedepends=('libarchive')
provides=('morphos-cross')
conflicts=('morphos-cross')
# The toolchain is a tree that must stay as built, and its target files are PowerPC code: makepkg would
# run the host's strip over them.
options=('!strip' '!debug' '!lto' 'staticlibs')
source=("sdk-20260529.lha::https://morphos-team.net/files/sdk-20260529.lha")
source_x86_64=("morphos-cross-20260529-r3-linux-x86_64.tar.xz::https://github.com/metaneutrons/morphos-cross/releases/download/v20260529-r3/morphos-cross-20260529-r3-linux-x86_64.tar.xz")
source_aarch64=("morphos-cross-20260529-r3-linux-arm64.tar.xz::https://github.com/metaneutrons/morphos-cross/releases/download/v20260529-r3/morphos-cross-20260529-r3-linux-arm64.tar.xz")
noextract=("sdk-20260529.lha")
sha256sums=('310dfb888b995e32206c5c3aba409847334a5fee049d13aad27b4af0d518ec77')
sha256sums_x86_64=('bfcd7145d1f7cd7b8aee8e1a14bc0cc33dec8d84a06f2294480b9c71d4912998')
sha256sums_aarch64=('1a5c5d0038cfe96da62a62728867b1e38aa0b7a830dc0c64141989600768d10e')

# The MorphOS SDK belongs to the MorphOS Team. makepkg downloads it from their site for the user, so that
# this recipe never distributes it, and the toolchain's own helper installs it into the package.
package() {
    local tree="$pkgdir/opt/morphos-cross" tool
    install -d "$pkgdir/opt" "$pkgdir/usr/bin"
    cp -a "$srcdir/morphos-cross" "$tree"
    "$tree/bin/morphos-cross-sdk" install "$srcdir/sdk-20260529.lha"
    for tool in "$tree/bin/"*; do
        ln -s "/opt/morphos-cross/bin/${tool##*/}" "$pkgdir/usr/bin/${tool##*/}"
    done
    install -Dm644 "$tree/share/doc/morphos-cross/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$tree/share/doc/morphos-cross/THIRD-PARTY.md" "$pkgdir/usr/share/licenses/$pkgname/THIRD-PARTY.md"
    bsdtar -xOf "$srcdir/sdk-20260529.lha" morphossdk/Readme.txt > "$pkgdir/usr/share/licenses/$pkgname/MorphOS-SDK-Readme.txt"
}
