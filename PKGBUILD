#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.74.0_beta.9538.e233f8b0a
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

b2sums_i686=('4751df08cf86e827e23ed3bd085e7ec22be7ccfa24118beab7dae1bbe0ad02de4d779d367d43bef4d362e19ca067317c9747addcb81367ef7a437bd904969304')
b2sums_x86_64=('017ebb111fe1a3ed37d60866b8fe085e77f1090c7ceff6b7b9807a9de11ada8571104a65ff8f2e107ad2ce131c27b42aeee417944313e597086f9a2ab99dd223')
b2sums_armv6h=('cf27f7252299264038a8043d03ce20ccc848414377b926ff4b20e66e60b8517c2756869203e61466def0a1dbe45c72fa4df83c29e71231def06dc5f5d4614c4f')
b2sums_armv7h=('0cdd81d0a7ce05d4e2ebe17d6bfc2a586e3c1c725dafbeb1f0db8c4c36d00cce95e98f77bfce08c9e4123f49492525243f09a86b025c995b11f5cdf00b8de53a')
b2sums_aarch64=('c5b54e98c59391295cd57883d6d99f060ac1f3930e3011687a91fbce2a613eea9f2b2663cea1d462beefc01691b5d16694802769a85c983ab1fe1559a38e56f7')

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
