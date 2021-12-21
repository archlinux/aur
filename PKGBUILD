# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=obsidian
pkgver=0.13.14
pkgrel=1
pkgdesc="Obsidian is a powerful knowledge base that works on top of a local folder of plain text Markdown files"
arch=('x86_64')
url="https://obsidian.md/"
license=('custom:Commercial')
depends=('zlib' 'hicolor-icon-theme' 'fuse' 'electron13')
makedepends=('asar')
options=(!strip)
source=(
    "${pkgname}"
    "${pkgname}.desktop"
    "https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/obsidian-${pkgver}.tar.gz"
)
sha256sums=(
    '5f4699e03045f68932e976727a746342f971eddb77fe5a31d8d2c4084034ed5f'
    '1153b7f4ce342663f766efa38dc07677aec13f7f619afef1f9b8e2b1f1849fe6'
    'd982148aff17ff0ccce912aaf429affcb8e466cb8b166934f912fb41cca4a534'
)

prepare() {
    cd "$srcdir"
    asar ef "${pkgname}-${pkgver}"/resources/obsidian.asar icon.png
}

package() {
    # Go to source directory
    cd "$srcdir"

    # Create directories for installation
    install -dm0755 "$pkgdir"/usr/bin
    install -dm0755 "$pkgdir"/usr/lib/obsidian

    # Install executable file
    install -Dm755 "$pkgname" "$pkgdir"/usr/bin/
    # Install desktop file
    install -Dm644 "$pkgname".desktop -t "$pkgdir"/usr/share/applications/
    install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/obsidian.png
    # Most of the release package is electron, but we use system's default one
    # So strip away asar packages and put them to /usr/lib/
    cd "${pkgname}-${pkgver}"/resources/
    find . -type d -exec install -d {,"$pkgdir"/usr/lib/obsidian/}{} \;
    find . -type f -exec install -D {,"$pkgdir"/usr/lib/obsidian/}{} \;
}

