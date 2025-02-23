# Maintainer: almezali <mzmcsmzm@gmail.com>

pkgname=mtsp-music-player-v
pkgver=1.0.13
pkgrel=1
pkgdesc="MTSP - Multimedia Terminal Soundtrack Player"
arch=('x86_64')
url="https://gitlab.com/mtsp/mtsp-music-player"
license=('GPL')

source=("https://gitlab.com/mtsp/mtsp-music-player/-/raw/347e196fe4504d95241fa1f0b8d341780f0277c0/mtsp-music-player.tar.gz")
sha256sums=('SKIP')

prepare() {
    # The tarball is already extracted by makepkg, so no need to run tar manually
    # Check for an internal PKGBUILD and copy it
    if [[ -f "$srcdir/PKGBUILD" ]]; then
        cp "$srcdir/PKGBUILD" "$srcdir/PKGBUILD.internal"
        echo "Found PKGBUILD inside the archive!"
    else
        echo "No PKGBUILD found inside the archive!"
        exit 1
    fi
}

build() {
    # Call the build() function from the internal PKGBUILD if it exists
    if grep -q "^build()" "$srcdir/PKGBUILD.internal"; then
        source "$srcdir/PKGBUILD.internal"
        build
    else
        echo "No build() function found in the internal PKGBUILD, skipping."
    fi
}

package() {
    # Call the package() function from the internal PKGBUILD if it exists
    if grep -q "^package()" "$srcdir/PKGBUILD.internal"; then
        source "$srcdir/PKGBUILD.internal"
        package
    else
        # Fallback logic if no package() function is found in the internal PKGBUILD
        install -Dm755 "$srcdir/mtsp-music-player" "$pkgdir/usr/bin/mtsp-music-player"
        install -Dm644 "$srcdir/mtsp-music-player.desktop" "$pkgdir/usr/share/applications/mtsp-music-player.desktop"
        install -Dm644 "$srcdir/mtsp_icon.png" "$pkgdir/usr/share/pixmaps/mtsp_icon.png"
    fi
}
