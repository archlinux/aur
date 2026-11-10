# Maintainer: Kenneth Shaw <kenshaw at gmail dot com>

pkgname=iv-cli-bin
pkgver=0.19.5
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

sha256sums=('444a65579807a70dc3b1a0337c92213f37e953ab783852dace212d152b04587f')
sha256sums_x86_64=('5e56e1852fef39fd14f524c59b6934f472e9f9a6036f50900f31289166fe35ec')
sha256sums_aarch64=('4fdf474f5bed0d0525a005fea566f354faaccce4956b147999a2cb50e2c0b6bd')

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
