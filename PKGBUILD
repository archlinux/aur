#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.75.0_beta.9741.f7d371fc3
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

b2sums_i686=('c31129a3cc378ce6920f6caa48b68c3c34207746831dc7e1dfc898543b261e8d1d8a5acd97722249f3b1ce39922ad583aab47ba1258c3c56d26f9740eb36087f')
b2sums_x86_64=('743289db05db6f92cf0b7e24b9948ef5f484f30471417597db18e95fce506a7b063b4ba0820205ed1898805df36a08439ac8508b0e5936af50e921daf986a105')
b2sums_armv6h=('e768a1a003c41d775da8faf7fb3c6893015ca9a0e28e74c65a7a7b7031348a5be1a9a2202c2f1d6d58dd25115a5e3f89f3599042227c9de7c1ddeff11e82114d')
b2sums_armv7h=('a4bd0603219166e80f93bc85deb8b239bf93b7f8ef5b300f28d2b9fe93d8d3c39437bff83f2c5107928b6ee0fbc1194bded572fb75cdd3b6a5c9ae4fdd213d73')
b2sums_aarch64=('102ffe804613092b74e55f4a6429b754463a3c210ca8c8e553bea1bf29511964022ca6168bf8b7cebd8d4008033ea41075eaa6f3930da2bd077eff93c6231b47')

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
