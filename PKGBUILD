#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.77.0_beta.10793.f62790251
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
b2sums_i686=('812fbd97278e3b935471fb9980ba31126fe784146795352d5ac3c89c9b51f43e050a20f00dba1e1227b89b7716b6c5e509325f592423e62acbe4e0c4efbe6839')
b2sums_x86_64=('e115972155436920f27b554c5b32afc28fd80ccba1485f310cc592a5e7bd43a07454aa5d882936be76604142cef3acb249198f36232daa0271f105ae590b21ad')
b2sums_armv6h=('d443e02a86efb0f4c5f11cb63387035ece8bd283d42dee106c33a9f5468999b66a77aee09c9ade2d88e4d81df8b6a9e06a5524c1ed8047704354a69d264f19c1')
b2sums_armv7h=('3cbb0d13bf83349141fc263a2b3f501f3d7c3786ab6e74a2cfa2a2cc0f4a3540424635c0c546edc9b635d3fb37e2114c3bcabac12cc41b5bb7f7cd55e9b77f3c')
b2sums_aarch64=('8ba9bd793a628896665263ab4135223a7fbfb481eb89c53d138a6a8a7f1a17ed16d3f95a8813a8e9c4329e1ba4ccf421889b795a347d1f5e6172fbe963b5f447')

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
