# Maintainer: Kimiblock Moe
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: Gennadiy Mykhailiuta <gmykhailiuta@gmail.com>
# Contributor: Xuanwo <xuanwo@archlinuxcn.org>

pkgname=obsidian-bwrap
pkgver=1.8.10
pkgrel=2
pkgdesc="A powerful knowledge base that works on top of a local folder of plain text Markdown files. Sandboxed by portable for privacy."
arch=('x86_64')
url="https://obsidian.md"
license=('custom:Commercial')
depends=('zlib' 'hicolor-icon-theme' 'fuse' 'electron' 'portable')
options=(!strip !debug)
source=("obsidian.sh"
	"portable-config"
        "obsidian.desktop"
        "https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/obsidian-${pkgver}.tar.gz"
)
sha256sums=('2c43aa33e989f946c2af48b07c3e7f3683356f91fcefa6d2970ac2531ed197a1'
            'dc91534e3e9efcb17b3408b316627f7388c1f031dbc02a7447de765d72bdc54c'
            '88504345238b1142b43880d93cf8546993e18bdf1597074b4d4360d0ce22ca41'
            'c59a22e19f4930cfc510f7ef8c15c46a0de94ffb891fd76f169f2a1e74c534a1')

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
