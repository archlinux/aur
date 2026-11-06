#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.77.0_beta.10750.82cb84b20
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
b2sums_i686=('d9283194e82c5a1dca9b3542b4d833ad49e46d2da48070617245d41c2abefe27caf9a28a11443bcbda6c82982edc107f9e494029d792871041d2d417ee011b86')
b2sums_x86_64=('b47a7bc92790c10cc3c5506bcda01b0887ee33c04ddc313ddf337da86e04f1914589f69e4f7f9c4df2794486d5f54bd903e1060bdc077359fb8eb609d40c24f0')
b2sums_armv6h=('a3ea7b30f0dcef4606ac38055eae36dd4a1651ae5b7f46ca214321f889340a91d1af4e485ba8136028d2325c1fabcb1c408570d391da4d6a17d1dbf8ddc8622d')
b2sums_armv7h=('070fa1e4084b8c6caa6a52a1e43f752174cd2ebec60577f428e7ca882bc962efdb0d2a5351162f2e6bff5c2a4c6da470789017fc6d1bcac37fd2b64442c1b6da')
b2sums_aarch64=('0eeffd224ebdcb4b1cd44bff3d34da47b4d66cb226b189de0bc75a390fae7f26ab2fb6d41a511c181299884bed8e1c6aa0d68dd2f48b9eaea6c8e02ba3eb99d5')

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
