# Maintainer: Daniel Wilhelm <shieldwed [at] outlook [dot] com>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=bittwist
pkgver=r5.06f5334
pkgrel=4
pkgdesc='Libpcap-based Ethernet packet generator'
url='http://bittwist.sourceforge.net'
license=('GPL-2.0-or-later')
arch=($CARCH)
depends=(
  'glibc'
  'libpcap>=1.2.1')
makedepends=(
  git
  pkgconf)
# Downloading tar.gz fails, use git instead, then tar.gz when it stabilizes.
# source=("https://sourceforge.net/projects/${pkgname}/files/Linux/Bit-Twist%20${pkgver}/${pkgname}-linux-${pkgver}.tar.gz")
source=("${pkgname}::git+https://git.code.sf.net/p/bittwist/git")
# https://prdownloads.sourceforge.net/bittwist/bittwist-linux-4.7.tar.gz

sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
  cd "${srcdir}/${pkgname}"
  sed -i -e 's|/usr/local/|/usr/|g' \
    -e 's|-Wl,-Bstatic -lpcap -Wl,-Bdynamic|-lpcap|g' Makefile
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make prefix="${pkgdir}/usr" install
}
# vim:set ts=2 sw=2 et:
