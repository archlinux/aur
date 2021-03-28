# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=obsidian-insider
_pkgname=obsidian
# Insider release (lacks app.asar)
pkgver=0.11.10
# Full public release
_pkgver=0.11.9
pkgrel=4
pkgdesc="Obsidian is a powerful knowledge base that works on top of a local folder of plain text Markdown files"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=('x86_64')
url="https://obsidian.md/"
license=('custom:Commercial')
depends=('zlib' 'hicolor-icon-theme' 'fuse' 'electron')
makedepends=('asar')
options=(!strip)
source=(
    "${pkgname}"
    "${pkgname}.desktop"
    "https://github.com/obsidianmd/obsidian-releases/releases/download/v${_pkgver}/obsidian-${_pkgver}.tar.gz"
    "https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/obsidian-${pkgver}.asar.gz"
)
sha256sums=(
    'd6b6ea6749b343787a2ab8379f0396c3ea48796717773ad5447afecc10e042e7'
    'b58f58a58278dc5eaddd0e935d973b69eb671d971db678c077892c7369a0f6e4'
    '5f298cdea99af07d9d9b6b6af1983ea0ac4ecdbe3c6b3aa5aa7ef4d6937981d2'
    'afbc43520c04ab0e92efe7a77d349e05731c1ce0c1090571ad317f24fa48f715'
)

prepare() {
    cd "$srcdir"
    asar ef "${_pkgname}-${_pkgver}"/resources/obsidian.asar icon.png
}

package() {
    # Go to source directory
    cd "$srcdir"

    # Create directories for installation
    install -dm0755 "${pkgdir}/usr/bin"
    install -dm0755 "${pkgdir}/usr/lib/obsidian"

    # Install executable file
    install -Dm755 "$pkgname" "$pkgdir"/usr/bin/
    # Install desktop file
    install -Dm644 "$pkgname".desktop -t "$pkgdir"/usr/share/applications/
    install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/obsidian.png
    # Most of the release package is electron, but we use system's default one
    # So strip away asar packages and put them to /usr/lib/
    cd "${_pkgname}-${_pkgver}"/resources/
    find . -type d -exec install -d {,"$pkgdir"/usr/lib/obsidian/}{} \;
    find . -type f -exec install -D -m 644 {,"$pkgdir"/usr/lib/obsidian/}{} \;
    # Insider release provides only obsidian.asar, but is usually more recent
    cd "$srcdir"
    install -D -m 644 "${_pkgname}-${pkgver}.asar" "$pkgdir"/usr/lib/obsidian/obsidian.asar
}

