# Maintainer: uku <hi@uku.moe>
pkgname=tyrolienne
pkgver=1.2.2
pkgrel=1
pkgdesc="simple tool to convert, upload, and embed videos to zipline"
arch=("x86_64" "aarch64")
url="https://git.uku3lig.net/uku/tyrolienne"
license=("MPL-2.0")
depends=("libadwaita>=1.7.0" "ffmpeg")
makedepends=("cargo" "imagemagick")
source=(
  "${pkgname}-${pkgver}.tar.gz::https://git.uku3lig.net/uku/tyrolienne/archive/${pkgver}.tar.gz"
  "net.uku3lig.tyrolienne.desktop"
)
sha256sums=(
  '12d4d2c76a5d5a6e76afb176d6218b68621ba02759206863efc56495459d4a7c'
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
