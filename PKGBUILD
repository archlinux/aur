# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=iv-cli-bin
pkgver=0.24.0
pkgrel=1
pkgdesc='A command-line image viewer using terminal graphics (Sixel, iTerm, Kitty)'
arch=('x86_64' 'aarch64')
url="https://github.com/kenshaw/iv"
license=(MIT)
depends=('ffmpeg' 'fontconfig' 'gcc-libs' 'glib2' 'glibc' 'imagemagick' 'libheif' 'libjxl' 'libvips' 'poppler-glib')
optdepends=('libreoffice-fresh: preview office documents'
            'openslide: whole-slide image support')
provides=(iv-cli)
conflicts=(iv-cli)

source=("$pkgname-$pkgver-README.md::https://raw.githubusercontent.com/kenshaw/iv/refs/tags/v$pkgver/README.md")
source_x86_64=("$url/releases/download/v$pkgver/iv-$pkgver-linux-amd64.tar.bz2")
source_aarch64=("$url/releases/download/v$pkgver/iv-$pkgver-linux-arm64.tar.bz2")

sha256sums=('23043e9ee2bed2b6cf26516ee92b55d8824f6a04df57cdaf71496f280f2139f6')
sha256sums_x86_64=('b20975fd79419ab81126360e2c3313fa0632eecf64a977524e49380a86b5a3b3')
sha256sums_aarch64=('bc9bc2d69ac56d7c00b88d526738af43140cf904e58100336f08eb79b3bbe541')

check() {
    ./iv --version
}

package() {
    install -Dm755 iv -t "$pkgdir/usr/bin"
    install -Dm644 "$pkgname-$pkgver-README.md" -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"

    # Generate and install shell completions
    install -dm755 "${pkgdir}/usr/share/bash-completion/completions"
    install -dm755 "${pkgdir}/usr/share/zsh/site-functions"
    install -dm755 "${pkgdir}/usr/share/fish/vendor_completions.d"

    "${pkgdir}/usr/bin/iv" --completion-script-bash > "${pkgdir}/usr/share/bash-completion/completions/iv"
    "${pkgdir}/usr/bin/iv" --completion-script-zsh > "${pkgdir}/usr/share/zsh/site-functions/_iv"
    "${pkgdir}/usr/bin/iv" --completion-script-fish > "${pkgdir}/usr/share/fish/vendor_completions.d/iv.fish"
}
