# Maintainer: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=obsidian-insider
_pkgname=obsidian
# Insider release (lacks app.asar)
pkgver=0.12.15
# Full public release
_pkgver=0.12.15
pkgrel=1
pkgdesc="Obsidian is a powerful knowledge base that works on top of a local folder of plain text Markdown files"
provides=("${_pkgname}")
conflicts=("${_pkgname}")
arch=('x86_64')
url="https://obsidian.md/"
license=('custom:Commercial')
depends=('zlib' 'hicolor-icon-theme' 'fuse' 'electron13')
makedepends=('asar')
options=(!strip)
source=(
    "${pkgname}"
    "${pkgname}.desktop"
    "https://github.com/obsidianmd/obsidian-releases/releases/download/v${_pkgver}/obsidian-${_pkgver}.tar.gz"
    "https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/obsidian-${pkgver}.asar.gz"
)
sha256sums=(
    '5f4699e03045f68932e976727a746342f971eddb77fe5a31d8d2c4084034ed5f'
    'dcb50a58c1afdfce8f06407b758814d663c3bf05abada607ab801bc0d035ef9b'
    'd290304e4c7cf41e92d063deb365d749135d07221cf83c222391d7a14aacfd01'
    '59ad00676ec5b0e0987dcb4fd9f9746214311f938a9082a2c39559d11124b59e'
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

