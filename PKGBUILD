# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
# Contributor: Mohammadreza Abdollahzadeh <morealaz@gmail.com>
# Contributor: navigaid <navigaid@gmail.com>
pkgname=openbsd-manpages
pkgver=6.7
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
sha256sums=('4003f007498a8a285e6ba44889821489f4f009de08120746010eba25ed275484'
            'da1243b8aa479e9a0d11ecb648b3cc520132f064e6d2df7f845ecfd499c8ece9'
            'SKIP'
            'SKIP'
            'SKIP'
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
