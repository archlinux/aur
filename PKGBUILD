#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.77.0_beta.10751.d459c3f99
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
b2sums_i686=('ed8f331c852573a3feaa95e062933bfd7a16b1801fed742f5b98616eaf944af3784ff24f56465f32d2bd7850112bccbb5fcc5c872759465455265be4692d334d')
b2sums_x86_64=('93451e862b86ae97fce48ce79212a9913d9f9098beb7c4a417c25c8aa234b0df21d71d21cc2cf178e4baca9f881b9be3a44f6ae436368bb4e8d3d9d3831720eb')
b2sums_armv6h=('b2a65960bcc258c9742f88fb6c5f2691647c74df9855f2592bbf8ef8e569a2910a45c3031fcded5aad44fe3f7423eb69f41aead47bf27ea181ef1b27b471f00c')
b2sums_armv7h=('d4d68f11136fa5d976f18a270f632cf7b5f7d4058dcb35239328197cb063325a2a1e3d3fe961ae926c028da5b9b384bc828e7f8796e659241de3fa2f95feebfe')
b2sums_aarch64=('1ba7ea1edb079d6472e007ec0639efc2ec9beb6c2d9a12f583fa3e196acb80d0d3839e024161a867c8a38fcf2f44d851ab09205dd5546749f6ec1f52433aa156')

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
