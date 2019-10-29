# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
# Contributor: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributor: navigaid <navigaid@gmail.com>
pkgname=openbsd-manpages
pkgver=6.6
pkgrel=1
pkgdesc="The OpenBSD manuals"
arch=('any')
options=('!strip')
url="https://man.openbsd.org/"
# Change this to your local mirror for faster downloads
# See https://www.openbsd.org/ftp.html
_mirrorurl="https://ftp.openbsd.org/pub/OpenBSD"
license=('BSD')
makedepends=('signify')
source=("${_mirrorurl}/${pkgver}/openbsd-${pkgver//./}-base.pub"
        "SHA256::${_mirrorurl}/${pkgver}/amd64/SHA256.sig"
        "${_mirrorurl}/${pkgver}/amd64/man${pkgver//./}.tgz"
        "${_mirrorurl}/${pkgver}/amd64/comp${pkgver//./}.tgz"
        "${_mirrorurl}/${pkgver}/amd64/xshare${pkgver//./}.tgz"
        'manfmt')
sha256sums=('d2ec6cf5b8b71e733cf98810b64513f7b6e6ef6656cc14fc83bf99cc32461da1'
            '383899d10315a77df1ccdc97bf0fdc46f7437a6f6d1f3207ea7edf0f8b0f5590'
            'c2d87e8996eb5aaea712637a4c890cdd1d7d23c2b3e5d7f6e5650b8e9c4244ad'
            '2b7c563dac440560157eda4f9d9df0591ff6382e56065daff0ad085bf5d9d72a'
            '2b16be3c2fa6263c18edf9c606566d0ee0210b52f5716094e72feeca2a510d4a'
            '335fa03d90fa0829327b8ba861fd5fda18d8da83a3d3e04ff21fde27037b62bb')

prepare() {
  signify -Cp "openbsd-${pkgver//./}-base.pub" -x "SHA256" *.tgz
}

package() {
  mkdir -p ${pkgdir}/usr/share/man/man{1,2,3,3p,4,5,7,8,9}

  msg2 "Reformatting for consistency with the Linux manuals (this may take a while...)"
  export srcdir pkgdir pkgver
  find ${srcdir}/usr/{share,X11R6}/man/man*/* -maxdepth 0 -type f |
    xargs -P "$(nproc)" -n 1 "$srcdir/manfmt"
}
