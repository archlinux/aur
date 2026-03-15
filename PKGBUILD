#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=rclone-beta-bin
_srcname=rclone
pkgrel=1
pkgver=1.74.0_beta.9545.e987d4f35
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

b2sums_i686=('bb547bbc42202051ecc946aa4eb188acedc6ed04606a8655b11b2d128316529cec4ea6f2fdbbf5cba2b5bb8b2821d934b4711f645df1460fda1d1427ae29a5b0')
b2sums_x86_64=('6fe721e870a872e5e1d24082ad7c66469624cc5b3e6b6371a1044cb296eb423674078981264ec562dba4e730a12203dd048a997bf0107e52ba57610c8994df8b')
b2sums_armv6h=('00559b9d387759f5ec6d3f9ac4c9a2738dbfd99dd8b6534e33904a1ac14dee75c4bea396ce97e5a42bb47548c6ac85ac41c1f48ff45858c70cce1fabccf89c06')
b2sums_armv7h=('2b9e008a1faceaab039ba0a858dc8eddd1e9a1ae41a21701d62f1904c5f2163efff375e1f618c54af1f4ed368195121239a5c9a418f4cd22f7b239427e699f1a')
b2sums_aarch64=('ec6552f08f9add34a40642e86cbd42ce7f620d78fee3c04c43adbeec6d1c09c52df8b141e1cc3f0cd996e11ac1e49fc46b60a65f2bd7ac2b80f6774a9b65dfad')

latestver() {
    local candidates ver listing

    mapfile -t candidates < <(curl -fsSL 'https://beta.rclone.org/' |
        sed -nE 's#.*href="\./v([0-9]+\.[0-9]+\.[0-9]+-beta\.[0-9]+\.[0-9a-f]+)/".*#\1#p' |
        sort -rV | head -5)
    [[ ${#candidates[@]} -gt 0 ]] || return 1

    for ver in "${candidates[@]}"; do
        listing=$(curl -fsSL "https://beta.rclone.org/v${ver}/" 2>/dev/null) || continue
        grep -q "rclone-v${ver}-linux-amd64.zip" <<<"${listing}" || continue
        grep -q "rclone-v${ver}-linux-arm64.zip" <<<"${listing}" || continue
        printf '%s\n' "${ver}" | tr '-' '_'
        return 0
    done
    return 1
}


package() {
    cd "$srcdir/${_srcname}-v${_upver}-${_arch}" || exit

    install -Dm755 rclone "$pkgdir/usr/bin/rclone"

    # install -Dm644 $srcdir/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
    install -Dm644 rclone.1 "$pkgdir/usr/share/man/man1/rclone.1"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -t "$pkgdir/usr/share/doc/$pkgname" -m644 README.html README.txt
}
