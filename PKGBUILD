#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.75.0_beta.9759.04d1e2563
_upver=${pkgver//_/-}
pkgdesc="Sync files to and from Google Drive, S3, Swift, Cloudfiles, Dropbox and Google Cloud Storage. (Beta version)"
provides=('rclone')
conflicts=('rclone' 'rclone-git' 'rclone-bin')
url="https://beta.rclone.org/"
license=('MIT')
options=('!debug')
depends=('glibc')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
_arch='linux-386'
[ "$CARCH" = 'x86_64' ] && _arch='linux-amd64'
[ "$CARCH" = 'armv6h' ] && _arch='linux-arm'
[ "$CARCH" = 'armv7h' ] && _arch='linux-arm-v7'
[ "$CARCH" = 'aarch64' ] && _arch='linux-arm64'
source_i686=("rclone-v${_upver}-linux-386.zip::https://beta.rclone.org/v${_upver}/rclone-v${_upver}-linux-386.zip")
source_x86_64=("rclone-v${_upver}-linux-amd64.zip::https://beta.rclone.org/v${_upver}/rclone-v${_upver}-linux-amd64.zip")
source_armv6h=("rclone-v${_upver}-linux-arm.zip::https://beta.rclone.org/v${_upver}/rclone-v${_upver}-linux-arm.zip")
source_armv7h=("rclone-v${_upver}-linux-arm-v7.zip::https://beta.rclone.org/v${_upver}/rclone-v${_upver}-linux-arm-v7.zip")
source_aarch64=("rclone-v${_upver}-linux-arm64.zip::https://beta.rclone.org/v${_upver}/rclone-v${_upver}-linux-arm64.zip")

b2sums_i686=('632d0b5f5df3c3087f5820e0d5d59155cbf4dec887492b02a04fffa1e60cb68e50c3a2b7dc2810349db1c2bf4b3aaf58870b922ec9122c7a197c0470cc0f4291')
b2sums_x86_64=('1f954c9585cd17ac82ca72b78c7c5781bc82cbbcfc593b44743f09de96ea875176ddbffb1c2d53cef34707afc6771a083057694f69676657694ae4929ed57d01')
b2sums_armv6h=('19e76d43e9240bc638e09473a12403a3eeb61ba08372b16973f5c3da12569653ca871d5ebadc053d853826b9e33221f4c040685e56c401f372872ce97c651977')
b2sums_armv7h=('00de5a5a446d1af61eb55b3b1ee9e36dd29c59d7156677d0660eb4b9dc689a0bde47f4dcc3af27013baa422106b34a0d08943540f8e03b7c48f2b47e08e3fa09')
b2sums_aarch64=('8724785c6cedce47acbee92c337634ac5e5fef107b3fd3a0a0e79b98a7a415410cceddf28cf24c2efbb8ea78b083bdef3d7a9013d63aaeff066096b3d7ceafdc')

latestver() {
    local size ver
    size=$(curl -fsSI --http1.1 "https://beta.rclone.org/rclone-beta-latest-linux-amd64.zip" |
           sed -nE 's/^content-length: *([0-9]+).*/\1/Ip') || return 1
    [[ -n $size ]] || return 1
    ver=$(curl -fsS --http1.1 -r "$((size - 4096))-$((size - 1))" \
          "https://beta.rclone.org/rclone-beta-latest-linux-amd64.zip" |
          strings | grep -oP 'rclone-v\K[0-9]+\.[0-9]+\.[0-9]+-beta\.[0-9]+\.[0-9a-f]+' |
          head -1) || return 1
    [[ -n $ver ]] || return 1
    printf '%s\n' "$ver" | tr '-' '_'
}


package() {
    cd "$srcdir/${_srcname}-v${_upver}-${_arch}" || exit

    install -Dm755 rclone "$pkgdir/usr/bin/rclone"

    # install -Dm644 $srcdir/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 rclone.1 "$pkgdir/usr/share/man/man1/rclone.1"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -t "$pkgdir/usr/share/doc/$pkgname" -m644 README.html README.txt
}
