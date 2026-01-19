# Maintainer: Lionel Fernandes <lsfe87 at gmail dot com>
# Contributor: Wagner Skellington <kelson dot glint at gmail dot com>
# Contributor: Seth Murphy <seth.murphy18@gmail.com>

pkgname='expandrive-bin'
pkgver='2025.11.21.808'
pkgrel='1'
pkgdesc='A utility for managing multiple cloud storage services'
arch=('x86_64')
url='https://www.expandrive.com/'
license=('custom:proprietary')
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
    "https://corp.hosted-by-files.com/builds/ExpanDrive/${pkgver}/linux/ExpanDrive_${pkgver%.*}_amd64.deb")
sha256sums=('0d764524f7d542d267cc68a7fdfa07ebd3146e784aa89fc157fceb800001d823'
    'b558f56dfcd9c7486d2498695847e06edf16960e7a1056f67345dce48d73036a')

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
}

post_install() {
    # Link the ExpanDrive binary to /usr/local/bin
    ln -sf '/opt/ExpanDrive/expandrive' '/usr/local/bin/expandrive'
}

pre_remove() {
    # Remove ExpanDrive from /usr/local/bin
    rm -f '/usr/local/bin/expandrive'
}
