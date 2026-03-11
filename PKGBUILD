#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.74.0_beta.9540.c7b8654b1
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

b2sums_i686=('697f707645d81347620666cdbd42b0630675ea16a0a885b696f2c460308096e18f28114c484936558e2918bdf9029ecc34c69fad6ecc2f430485828b5b5802a6')
b2sums_x86_64=('809df618df12812fb9b77a7318d7a588bd7c4439bd2082c5d2000a70782d4244a7d4ee2addd1b66962df21def2a98b22ac434ed25fdd7c53378b04ffc4e645d9')
b2sums_armv6h=('e972804aa2fadf14d04db78baadd188998c6688495886d53f66180b386df8e0b0487aabdf44ac57912b5605cfbac0375c22f3555776ea871c81bc86a1f92e113')
b2sums_armv7h=('f4f56f74bbaf3ec6b5361fc50db415d7a3ca17a30d3975cf092d11dec9b9b261e8965fa356f1a676bbfedd016456fee0ab22aa091aea965a43958b2d78346061')
b2sums_aarch64=('148ebc7e3e4a85989eed7d83b533cee501a7b3e1fa43fc0be467d73c2eb7213ae1ee33c6c8210cadfd086a0a688f91ec5739b9dc4ee20d81576d262c0e20232b')

latestver() {
    local ver listing

    ver=$(curl -fsSL 'https://beta.rclone.org/' |
        sed -nE 's#.*href="\./v([0-9]+\.[0-9]+\.[0-9]+-beta\.[0-9]+\.[0-9a-f]+)/".*#\1#p' |
        sort -V | tail -1) || return 1
    [[ -n ${ver} ]] || return 1

    listing=$(curl -fsSL "https://beta.rclone.org/v${ver}/") || return 1
    grep -q "rclone-v${ver}-linux-amd64.zip" <<<"${listing}" || return 1
    grep -q "rclone-v${ver}-linux-arm64.zip" <<<"${listing}" || return 1

    printf '%s\n' "${ver}" | tr '-' '_'
}


package() {
    cd "$srcdir/${_srcname}-v${_upver}-${_arch}" || exit

    install -Dm755 rclone "$pkgdir/usr/bin/rclone"

    # install -Dm644 $srcdir/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 rclone.1 "$pkgdir/usr/share/man/man1/rclone.1"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -t "$pkgdir/usr/share/doc/$pkgname" -m644 README.html README.txt
}
