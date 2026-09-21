# Maintainer: Tomáš Karela Procházka <tomas.prochazka5d@gmail.com>

pkgname=orca-ide-appimage
_pkgname=orca-ide
pkgver=1.4.206
pkgrel=2
pkgdesc="Next-gen IDE for working with a fleet of parallel coding agents (AppImage)"
arch=('x86_64' 'aarch64')
url="https://github.com/stablyai/orca"
license=('MIT')
# fuse2: the bundled runtime is a type-2 AppImage (statically linked libfuse 2,
# looks for `fusermount` on $PATH) and self-mounts on every launch.
# The rest is what the bundled Electron dlopen()s from the host.
depends=('fuse2'
         'gtk3'
         'nss'
         'libnotify'
         'libsecret'
         'libxss'
         'libxtst'
         'hicolor-icon-theme')
optdepends=('at-spi2-core: UI automation for Design Mode/element picking'
            'python-gobject: UI automation for Design Mode/element picking'
            'xdotool: UI automation for Design Mode/element picking'
            'libappindicator-gtk3: system tray icon')
# orca-ide is upstream's own Linux name, also used by orca-ide-bin, onorca-bin
# and stably-orca; all three collide with this package file-for-file.
# stably-orca-bin shares no file with this package -- it renames everything to
# stably-orca -- but repackages the same upstream AppImage. Conflicting on it so
# pacman retires this package in the same transaction when migrating to it.
provides=("orca-ide=$pkgver")
conflicts=('orca-ide' 'stably-orca-bin')
# Prebuilt Electron payload inside a squashfs image: stripping corrupts it and
# there is nothing to put in a -debug package.
options=('!strip' '!debug')

# $CARCH-suffixed local names: both release assets would otherwise land on the
# same filename, and `updpkgsums` would reuse the cached x86_64 download as the
# aarch64 source and emit the same checksum for both arrays.
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/stablyai/orca/v$pkgver/LICENSE")
source_x86_64=("$_pkgname-$pkgver-x86_64.AppImage::$url/releases/download/v$pkgver/orca-linux.AppImage")
source_aarch64=("$_pkgname-$pkgver-aarch64.AppImage::$url/releases/download/v$pkgver/orca-linux-arm64.AppImage")
noextract=("$_pkgname-$pkgver-x86_64.AppImage"
           "$_pkgname-$pkgver-aarch64.AppImage")
sha256sums=('ff1b611f80580d49f4b97e93a97b24eb050b0671b26b8afe16341fab699112f3')
sha256sums_x86_64=('547c60825ce6c8cedd94a02b3c445fbf2d88173576164b1b66444113ff225550')
sha256sums_aarch64=('494dab899708b8d468186ef80b3b2d1f703f4ecf9fad1debb480135d6514a6ef')

prepare() {
    cd "$srcdir"

    # A leftover squashfs-root from a previous `makepkg -f` would merge with
    # this extraction instead of being replaced.
    rm -rf squashfs-root
    chmod +x "$_pkgname-$pkgver-$CARCH.AppImage"
    "./$_pkgname-$pkgver-$CARCH.AppImage" --appimage-extract >/dev/null

    # Upstream ships Exec=orca, which is extra/orca -- the GNOME screen reader,
    # an unrelated package that owns /usr/bin/orca. Point it at the binary this
    # package actually installs.
    sed -i "s|^Exec=.*|Exec=$_pkgname %U|" "squashfs-root/$_pkgname.desktop"
}

package() {
    cd "$srcdir"

    install -Dm755 "$_pkgname-$pkgver-$CARCH.AppImage" \
        "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$_pkgname.AppImage" "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "squashfs-root/$_pkgname.desktop" \
        "$pkgdir/usr/share/applications/$_pkgname.desktop"

    # The AppImage ships a full hicolor set; Icon=orca-ide in the .desktop only
    # resolves if it is installed under those names. Listed explicitly so an
    # upstream icon rename fails the build instead of shipping a blank launcher.
    local _size
    for _size in 16 24 32 48 64 128 256 512; do
        install -Dm644 "squashfs-root/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png" \
            "$pkgdir/usr/share/icons/hicolor/${_size}x${_size}/apps/$_pkgname.png"
    done

    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
