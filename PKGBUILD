# Maintainer: robertfoster
# Maintainer: Toni Uhlig <matzeton@googlemail.com>

pkgname=ndpi-git
pkgver=r5934.de3915b9f
pkgrel=1
pkgdesc="Open and Extensible Deep Packet Inspection Library (git version)"
arch=('x86_64' 'aarch64')
url="https://www.ntop.org/products/deep-packet-inspection/ndpi/"
license=('LGPL-3.0-or-later')
provides=("${pkgname%-git}" 'libndpi.so')
conflicts=("${pkgname%-git}" 'ndpi-svn')
depends=('glibc' 'libmaxminddb' 'libpcap' 'pcre2')
makedepends=('git')
source=("${pkgname%-git}::git+https://github.com/ntop/nDPI.git#branch=dev")

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  ./autogen.sh
}

build() {
  cd "${pkgname%-git}"
  ./configure \
    --prefix=/usr \
    --with-pcre2 \
    --with-maxminddb
  make
}

package() {
  cd "${pkgname%-git}"
  make DESTDIR="${pkgdir}" install
  ln -sf /usr/include/ndpi \
    "${pkgdir}/usr/include/libndpi"
}

sha256sums=('SKIP')
