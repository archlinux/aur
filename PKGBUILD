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
depends=('zlib' 'hicolor-icon-theme' 'fuse' 'electron33')
options=(!strip !debug)
source=("obsidian.sh"
	"portable-config"
        "obsidian.desktop"
        "https://github.com/obsidianmd/obsidian-releases/releases/download/v${pkgver}/obsidian-${pkgver}.tar.gz"
)
sha256sums=('46a1f82357a9d2d629c1d27b471569646c3865d5dd68d99687d07730a2c8a328'
            'ca2820fd5247a31238f1f2a8e314534fc0a864b7178c66a6f56ffd8be2f432fd'
            '461dc7510d3ee6617f3ac65fece8b8cc1120c499621af40a6bf8c9238c2b0738'
            'e881ea06f671db2c5002f0038b73a4e4b7b78a9dbf73aa9a7d0dc54a93d3d29a')

package() {
    cd "$srcdir"
    install -Dm755 portable-config "$pkgdir"/usr/lib/portable/info/md.obsidian.app/config

    # Install executable file
    install -Dm755 obsidian.sh "$pkgdir"/usr/bin/obsidian

    # Install desktop file
    install -Dm644 obsidian.desktop -t "$pkgdir"/usr/share/applications/obsidian.desktop

    # Most of the release package is electron, but we use system's default one
    # So strip away asar packages and put them to /usr/lib/
    cd "obsidian-${pkgver}"/resources/
    install -dm0755 "$pkgdir"/usr/lib/obsidian
    # install icon
    install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/obsidian.png
    find . -type d -exec install -d {,"$pkgdir"/usr/lib/obsidian/}{} \;
    find . -type f -exec install -D {,"$pkgdir"/usr/lib/obsidian/}{} \;
}
