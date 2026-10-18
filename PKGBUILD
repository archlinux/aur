#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.76.0_beta.10592.35a03a47e
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

b2sums_i686=('9bd5feb8776cff3f96910931c5dae2daa0f08d961e3249430d3b0f42235c03887e299487de920bc1851fb878525f6a029a898beda6a8c79b402edb4de4fd40a4')
b2sums_x86_64=('fc1a6caa37939171b8c18255f7b0faf14e210041fb527b69bbb6ec43558d5a852606fa786a87a26302d213a1c2e79c65f38d9aecec5f73c7c1a520c6b0677a63')
b2sums_armv6h=('9a145014382ddc505bb686576609eded9e77017f528ad3c27da1c1d2372f461bf9cab35a892001ce5cb4460f16413a7f64a6119d56af1082f70302137f0de7bc')
b2sums_armv7h=('809b82c1302cb118dde5079418afb516cf377f74d9ec48fb58ce1236468c0579edeed454e21f76e8e4042948562054c2fa872d5676a3843cdf07a823ff085b45')
b2sums_aarch64=('4e972b170f6bc42bd1aa69f78e3a51057efbb318aac5ff72cbda2c5266db2ea24fdcadb57a7116c42c31753037fec18b2cb368422d3bcd9d3d2b161b1a77c906')

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
