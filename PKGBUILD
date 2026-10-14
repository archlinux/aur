# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=iv-cli-bin
pkgver=0.18.1
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

sha256sums=('72e17b4e943d8710b7b35d1be42ad2fd605f03c7046731e55c2b88693e9069d0')
sha256sums_x86_64=('fbe47533c53dd261d3a3d15570b9ae1dbbd4c65a289f97bbc0bb827601822467')
sha256sums_aarch64=('47b342a12cfe15d146d8b3f0597923604e34ca30e9b009bfe2f8adb45c85c930')

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
