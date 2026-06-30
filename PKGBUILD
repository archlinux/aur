#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.75.0_beta.9846.b36b67920
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

b2sums_i686=('9e57ed3057a7d1dd5debf4edd931a47ee644a6c63fee1895a0de7cba848ea658b459865baa360e7ec9070b125a68f18742448236d88f1c707f252956a15e8990')
b2sums_x86_64=('6acf1d91cb07a537099b3a000fade834b4bda78407c0688f0d8d8c2dd955db1d2fcfbe3a8b86b049859e9a995443b49700287117fc0d0ba39e6ccbc35c381298')
b2sums_armv6h=('53245a26be2f9aa6b8ed5cfbaa2cf9077b8a7a9157d72c187a1a15b235fdc5e9ac25a96b459d9b863ec7874b418e12a207e86c4d43eff6fc4b6c4ac97c541864')
b2sums_armv7h=('f8582daed814069a84e695a1edf5a75cbf96f4b1bfe284d0f4a6cf65f365f94737c8e104d523b25a4f58a3e2e1d9e649d0c39574da2d57ba45660f0149733db4')
b2sums_aarch64=('1e1ab98c308816b379c83b61d6888e450ee3166514feae0a2d629f56896d3baa582ac983b5de0a1ac9ebd8a695d201dd8702f07e2b9499c45472573c8d8d9e00')

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
