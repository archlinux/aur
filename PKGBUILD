# Maintainer: Maki <maki@hotmilk.space>

pkgname=melonprimeds-bin
pkgver=1.2
pkgrel=1
pkgdesc="Modded version of melonDS emulator to play Metroid Hunters "
url="https://github.com/makidoll/melonPrimeDS"
arch=("x86_64")
license=("GPL-3.0-only")

# depends=("fuse2") # we're extracting so we don't need this
options=(!strip)

_filename="melonPrimeDS-$pkgver-x86_64.AppImage"

source=(
    "https://github.com/makidoll/melonPrimeDS/releases/download/mph-$pkgver/$_filename"
	"https://raw.githubusercontent.com/makidoll/melonPrimeDS/metroid-prime-hunters/LICENSE"
)

sha512sums=(
    "10b58497509fe256b4d79c5931ef0248481deccfe67178c8ff1ba815727c50305bac782529bff8016b0dcfa57bae489a73478622d6d3be7740c9c3fc458eefa6"
    "7633623b66b5e686bb94dd96a7cdb5a7e5ee00e87004fab416a5610d59c62badaf512a2e26e34e2455b7ed6b76690d2cd47464836d7d85d78b51d50f7e933d5c"
)

_install_bin_name="melonPrimeDS" # melonds-bin uses camel case too
_install_path="/opt/melonprimeds"

_identifier="io.makidoll.melonPrimeDS"

package() {
    # extract AppImage
    chmod +x "$_filename"
    ./$_filename --appimage-extract

    # copy files to pkgdir
    mkdir -p "$pkgdir$_install_path"
    cp -r squashfs-root/. "$pkgdir$_install_path"

    # update desktop file
    sed -i -E "s|Exec=melonPrimeDS|Exec=$_install_path/AppRun|" \
    "$pkgdir$_install_path/$_identifier.desktop"

    # move desktop file
    mkdir -p "$pkgdir/usr/share/applications"
    mv "$pkgdir$_install_path/$_identifier.desktop" \
    "$pkgdir/usr/share/applications/$_identifier.desktop"

    # fix AppRun this_dir variable
    sed -i -E 's|this_dir=.*$|this_dir="$(dirname "$(readlink -f "$0")")"|' \
    "$pkgdir$_install_path/AppRun"

    # create link to executable
    mkdir -p "$pkgdir/usr/bin"
    ln -s "$_install_path/AppRun" "$pkgdir/usr/bin/$_install_bin_name"

    # move icon
    mv "$pkgdir$_install_path/usr/share/icons" "$pkgdir/usr/share"
    rm -rf "$pkgdir$_install_path/usr/share" # nothing else in here

    # invalid symbolic links
    rm -f "$pkgdir$_install_path/.DirIcon"
    rm -f "$pkgdir$_install_path/$_identifier.png"

    # move license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
