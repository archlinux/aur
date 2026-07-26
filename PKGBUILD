# Maintainer: blazebsc <blakeisfruity@proton.me>
pkgname=froststrap-bin
_tag='v2.0.0-beta.10'
pkgver=${_tag#v}
pkgver=${pkgver//-/.}
pkgrel=2
pkgdesc="A fork of Fishstrap/Bloxstrap, focused on performance and customization"
arch=('x86_64')
url="https://github.com/Froststrap/Froststrap"
license=('AGPL-3.0-or-later' 'MIT')
options=('!strip')
depends=('fontconfig' 'hicolor-icon-theme' 'gcc-libs')
source=("https://github.com/Froststrap/Froststrap/releases/download/${_tag}/Froststrap-linux-x64.deb"
    "LICENSE::https://raw.githubusercontent.com/Froststrap/Froststrap/refs/heads/main/LICENSE"
    "LICENSE-MIT::https://raw.githubusercontent.com/Froststrap/Froststrap/refs/heads/main/LICENSE-MIT")
sha256sums=('a0994e74475cda7bf81e229de09dfde7d89464332a6dadba8b071bfb1804f8f4'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef'
            '34559d013a5a46dcce5bcb5efb3b9489dcf5e77381da540b6baf0cde78583db2')

package() {
    # Extract .deb contents
    tar -xf data.tar.zst -C "$pkgdir"

    # Remove AppDir metadata
    rm -f "$pkgdir/.DirIcon"

    # Rename binary to lowercase
    mv "$pkgdir/usr/bin/Froststrap" "$pkgdir/usr/bin/froststrap"

    # Fix desktop entry to use lowercase command and install to proper location
    mkdir -p "$pkgdir/usr/share/applications"
    sed -i 's/Exec=Froststrap/Exec=froststrap/g' "$pkgdir/Froststrap.desktop"
    mv "$pkgdir/Froststrap.desktop" "$pkgdir/usr/share/applications/froststrap.desktop"

    # Install licenses
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/AGPL-3.0"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/MIT"
}
