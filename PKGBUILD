#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.77.0_beta.10779.9622aff8f
_upver=${pkgver//_/-}
# The version string ends in the commit it was built from; the beta zips
# carry no licence file, so it comes from that exact commit.
_commit=${pkgver##*.}
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
source=("rclone-${pkgver}-COPYING::https://raw.githubusercontent.com/rclone/rclone/${_commit}/COPYING")
source_i686=("rclone-v${_upver}-linux-386.zip::https://beta.rclone.org/v${_upver}/rclone-v${_upver}-linux-386.zip")
source_x86_64=("rclone-v${_upver}-linux-amd64.zip::https://beta.rclone.org/v${_upver}/rclone-v${_upver}-linux-amd64.zip")
source_armv6h=("rclone-v${_upver}-linux-arm.zip::https://beta.rclone.org/v${_upver}/rclone-v${_upver}-linux-arm.zip")
source_armv7h=("rclone-v${_upver}-linux-arm-v7.zip::https://beta.rclone.org/v${_upver}/rclone-v${_upver}-linux-arm-v7.zip")
source_aarch64=("rclone-v${_upver}-linux-arm64.zip::https://beta.rclone.org/v${_upver}/rclone-v${_upver}-linux-arm64.zip")

b2sums=('aa3374959b1ee491c635f4b2414b4848405d8ad931be6344c3effeba9c1557db0a7fe09f00c9a1c51281249994e0712f811e1c98dc9d13c45a541be9bcac804c')
b2sums_i686=('8ad2c966be9abf466b0bfde825ccba44a91087f1424df81efa0192b6d4467569e8afaf2a7b9c118db108316c7542a66095a7e14a0f8b076afe8e0d2416401b86')
b2sums_x86_64=('85d8d1bdb80795bb6581683a26554cc035c425f0700d65b68c98e2b12ea3cb1fa0a9cca1ff827ee04d9338ceecd9d60f69e512d310c9e50e66a30ee7072d0155')
b2sums_armv6h=('1dda3072f864a244f1b4d0cc5b1d8390a63fc8571fb1bb9861c16d46325a211e5fcf75bd2958e6d419c9f7dd8baf501d148422b24bdd9ab07f362ef9e83a9971')
b2sums_armv7h=('67940c71cd37e66ce8b5b68861c0a554a29ed44a23ec124e669903360180178b7e50ad66caed70f6b204bfc6dbdc3f8dafd60090140876b4c49eba614dc71828')
b2sums_aarch64=('93152f6684e8feebf56789615e3e7663cbad198cca214486f65d76d007a96a58fe070f66e2b7622f6217c5eb707810ddca382c9f4b05c2108800511ca9c67cb7')

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

    install -Dm644 "${srcdir}/rclone-${pkgver}-COPYING" \
        "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 rclone.1 "$pkgdir/usr/share/man/man1/rclone.1"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -t "$pkgdir/usr/share/doc/$pkgname" -m644 README.html README.txt
}
