# Maintainer: Kimiblock Moe
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=obsidian-bwrap
pkgver=1.7.7
pkgrel=1
pkgdesc="A powerful knowledge base that works on top of a local folder of plain text Markdown files. Sandboxed by portable for privacy."
arch=('x86_64')
url="https://obsidian.md"
license=('custom:Commercial')
depends=('zlib' 'hicolor-icon-theme' 'fuse' 'electron34' 'portable')
options=(!strip !debug)
source=("obsidian.sh"
	"portable-config"
        "obsidian.desktop"
        "https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/obsidian-${pkgver}.tar.gz"
)
sha256sums=('ea46078cb9535767040979337957693512e97fcc8810cb6bd56a720bff3377ae'
            'f323046d9024b5bcba858cdddc481b3aac4d93ccf0da3ca11a53d7a18a40c256'
            '05882d42311d182d69e645caafbbdc0f09f103536390c9090c66f14b31f176cc'
            'e881ea06f671db2c5002f0038b73a4e4b7b78a9dbf73aa9a7d0dc54a93d3d29a')

package() {
    cd "$srcdir"
    install -Dm755 portable-config "$pkgdir"/usr/lib/portable/info/md.obsidian.app/config

    # Install executable file
    install -Dm755 obsidian.sh "$pkgdir"/usr/bin/obsidian

    # Install desktop file
    install -Dm644 obsidian.desktop "$pkgdir"/usr/share/applications/md.obsidian.Obsidian.desktop

    # Most of the release package is electron, but we use system's default one
    # So strip away asar packages and put them to /usr/lib/
    cd "obsidian-${pkgver}"/resources/
    install -dm0755 "$pkgdir"/usr/lib/obsidian
    # install icon
    install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/obsidian.png
    find . -type d -exec install -d {,"$pkgdir"/usr/lib/obsidian/}{} \;
    find . -type f -exec install -D {,"$pkgdir"/usr/lib/obsidian/}{} \;
}
