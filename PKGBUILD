# Maintainer: Kimiblock Moe
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=obsidian-bwrap
pkgver=1.8.9
pkgrel=2
pkgdesc="A powerful knowledge base that works on top of a local folder of plain text Markdown files. Sandboxed by portable for privacy."
arch=('x86_64')
url="https://obsidian.md"
license=('custom:Commercial')
depends=('zlib' 'hicolor-icon-theme' 'fuse' 'electron35' 'portable')
options=(!strip !debug)
source=("obsidian.sh"
	"portable-config"
        "obsidian.desktop"
        "https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/obsidian-${pkgver}.tar.gz"
)
sha256sums=('999ffd4fbe2ac37301b71477548e8754053e7577e3aff79663df205fa44a7e8e'
            'c6d142c645153c961b9e438b0e355b216c58968730859f1d26bc6135723b975c'
            '88504345238b1142b43880d93cf8546993e18bdf1597074b4d4360d0ce22ca41'
            '5d5ab49d08b24f61ef290a73248be1821b06820e327bbbaa65cc80d671f83bfa')

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
