#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.77.0_beta.10824.10fcd4e69
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
b2sums_i686=('76f975bdd861dbaba7e349af844451826268b4520272951192ff9b84567031c9d7fc15d0d37730d7126c3b0875c88c5ffe779caf1f38f3539bb4ab7e3c6bdf99')
b2sums_x86_64=('691b80c86bb7c313878249268453fb5b7bf9db9baa39a2efae96680abe904f2aa80adb6b97a1454745e3709875fe5f2e4ffe95c08a01ec8b64ebc57366b0a5b0')
b2sums_armv6h=('78faf66bbd2e7a08e41bdaeec2fc419553896dca5c16bf4c430c8751c5105c07bc85d09d7176d67f880e87f4ed26f8424cc262c2397e76cabc1bdb5524470574')
b2sums_armv7h=('20836a32325f11d452aae87de4b33e04ad6b32a92f3eb3bac0455b1bac6276b1f541341f823bfe4c08e4bba1365b4a74d7e02f8c4483b0753e1f40967b78e6ca')
b2sums_aarch64=('6c2bb5562ff643c7b07a5ecfd53a093baf0c423618bbcf9efc666c02c0d4aed78b8b7e81e3b0358c332912db28098314f6bf08d6f07cd602e905ccb6badce26e')

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
