# Maintainer: uku <hi@uku.moe>
pkgname=tyrolienne
pkgver=1.2.5
pkgrel=1
pkgdesc="simple tool to convert, upload, and embed videos to zipline"
arch=("x86_64" "aarch64")
url="https://git.uku3lig.net/uku/tyrolienne"
license=("MPL-2.0")
depends=("libadwaita>=1.9.0" "ffmpeg")
makedepends=("cargo" "imagemagick")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://git.uku3lig.net/uku/tyrolienne/archive/${pkgver}.tar.gz"
  "net.uku3lig.tyrolienne.desktop"
)
sha256sums=(
  '9a0463b5660bc3be7cc31852ec2be465b281870b2f67b50afc93c233e48a80ca'
  'SKIP'
)
# fixes aws-lc-rs not linking
options=(!lto !debug)

build() {
        cd "$pkgname"
        cargo build -r
}

package() {
        cd "$pkgname"

        install -D target/release/tyrolienne "$pkgdir/usr/bin/tyrolienne"

        for size in 16 32 48 128 256; do
                dir="$pkgdir/usr/share/icons/hicolor/${size}x$size/apps"
                mkdir -p $dir
                magick data/icons/tyrolienne.png -resize ${size}x "$dir/net.uku3lig.tyrolienne.png"
        done

        install -Dm644 "$srcdir/net.uku3lig.tyrolienne.desktop" "$pkgdir/usr/share/applications/net.uku3lig.tyrolienne.desktop"
}
