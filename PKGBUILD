#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.74.0_beta.9544.639bd8895
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

b2sums_i686=('3f8a99f5bbd9ddb517ef15c9a649633d47e7339821c4180215216360255fdbbb2153db5954f1ef2a3bc878e92482df5d2b91c2d7f52b6b6adb6d1b42d36b9023')
b2sums_x86_64=('0993ef656a678618b6e4142264507f7db5f2039c337f3a661e322d93b66870530d9839d9b9bf56f4be54373e8b482d6c4eb47d4ddbeb5ab4b897a66a11d178b2')
b2sums_armv6h=('cd202313503f2f62b6263d19515f28c2e59e3eb6676cf755052e3b0791b28f5cec2cc3655b8fadcfc8faf6c0c03c0d1649f96b9d54efce9eea1816b3f1bebce4')
b2sums_armv7h=('5d5a7d062853b1e72ab1f4ab3b2cc9b2999e5a1b4ff41df4fe7eab824dd81ec89ec2deb7135ba6a19e16de21c1671ad3e01c089d5d071cc333976df87ef7f7a9')
b2sums_aarch64=('10570d174487411147377589902260486f73361b7a25b5f2dc695c225cdfe069e8bda31e76cbbb6acc2d6681b0ebb73329017250426924607fd73564fea6df62')

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
