# Maintainer: Kimiblock Moe
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=obsidian-bwrap
pkgver=1.8.4
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
sha256sums=('369188cbb9d9d2826757d48e013f711d8c9a243245bbd11cb1ef75c95572690d'
            'fa50e46d377a53a8815898ddc8bdfcfe5118f01101c6bd686a6c9a61956bc027'
            '88504345238b1142b43880d93cf8546993e18bdf1597074b4d4360d0ce22ca41'
            '6ef9afcd5c87ae3875623dc9c447ebcb9db508c5f71361843665dd74478bc221')

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
