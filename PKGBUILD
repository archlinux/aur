# Maintainer: Lionel Fernandes <lsfe87 at gmail dot com>
# Contributor: Wagner Skellington <kelson dot glint at gmail dot com>
# Contributor: Seth Murphy <seth.murphy18@gmail.com>

pkgname='expandrive-bin'
pkgver='2026.11.06.916'
pkgrel='1'
pkgdesc='A utility for managing multiple cloud storage services'
arch=('x86_64')
url='https://www.expandrive.com/'
license=('LicenseRef-proprietary')
options=('!strip' '!debug')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'fuse2'
    'gtk3'
    'libnotify'
    'libsecret'
    'libxss'
    'libxtst'
    'nss'
    'xdg-utils'
)

source=('LICENSE'
    'expandrive.sh'
    "ExpanDrive_${pkgver}_amd64.deb::https://www.expandrive.com/api/download/expandrive?platform=linux&ext=deb")
sha256sums=('0d764524f7d542d267cc68a7fdfa07ebd3146e784aa89fc157fceb800001d823'
    '1bf5eeb30ec66a2256417bc56a45ebd3ad10b5338792da9d667b744dc50ee870'
    '493aa2d100efbb707f379dbc3e0f208df8fe63312a2344bf095371fcd28d5e85')

prepare() {
    # Create the package directory, if it doesn't already exist
    if [ ! -d "$srcdir/data" ]; then
        mkdir "$srcdir/data"
    else
        # If the directory exists, wipe its contents
        rm -rf "$srcdir/data"
        mkdir "$srcdir/data"
    fi

    tar -xf "$srcdir/data.tar.xz" -C "$srcdir/data"

    # Remove unnecessary files from the package
    rm -rf "$srcdir/data/opt/ExpanDrive/resources/app.asar.unpacked"
}

package() {
    # Copy the source files to the package directory
    cp -R "$srcdir/data/opt/" "$pkgdir/opt/"
    cp -R "$srcdir/data/usr/" "$pkgdir/usr/"

    # Install the LICENSE file in the correct place
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Launcher wrapper (native Wayland when available) and desktop entry pointing to it
    install -Dm755 expandrive.sh "$pkgdir/usr/bin/expandrive"
    sed -i 's|^Exec=/opt/ExpanDrive/expandrive|Exec=/usr/bin/expandrive|' \
        "$pkgdir/usr/share/applications/expandrive.desktop"
}
