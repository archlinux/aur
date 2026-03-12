#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.74.0_beta.9542.69ccbacf3
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

b2sums_i686=('d5ff42d9d25741617709c32298ea8cf16ad1e398bfce257679fabe57e2ce5863a7df760e70b32337fec0ad1647b3f74b7b4f25a37f69c778a7bf4b4da9584de1')
b2sums_x86_64=('4eef0c7dc9ae39cf1b218134ca3f2ff97ea02b8aade1770b82332ad6a1b35b41923436a3733f25994a76781ca0874a01c7790ab67fcbb071e44d0ad0ca788c4b')
b2sums_armv6h=('7ffdc31655f648dc5640530a9927fd6d823d8ebc6635a127415f2ee60afb714a28f4c8863ef541c49b7217f3891e6be6660eac7b2f703e584cec88b94ed5c4a4')
b2sums_armv7h=('f6b78c62b4b90355b3d263b0a2615e4d1ef10cacba8d35141beee982f19ee4f08ae8531ffb6070663ce2ddd61b638c5074d094a82092355d5755ab77312ad09d')
b2sums_aarch64=('1ccdb7201be76c02382b5c903ac3e87013e38fcb940793afbddb23e483e32ce2cab9a70bd0b82dbc2634f29f69e7966e58a7b1b2782d0f13ecbef6f624363332')

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
