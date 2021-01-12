# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Franco Tortoriello <franco.tortoriello@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libtirpc-minimal-git
pkgver=1.3.1
pkgrel=1
pkgdesc='Transport Independent RPC library (SunRPC replacement)'
arch=(x86_64)
url=http://libtirpc.sourceforge.net/
license=(BSD)
depends=(
  lib32-krb5
  libtirpc
)
makedepends=(git)
provides=(lib32-libtirpc)
conflicts=(lib32-libtirpc)
source=(git://git.linux-nfs.org/projects/steved/libtirpc.git)
sha256sums=(SKIP)

_commit() {
  # Convert HEAD into a shortened commit id:
  git rev-parse --short HEAD
}

pkgver() {
  cd libtirpc

  # Suggestions for improvement welcome!
  printf '%s.r%s.%s'         \
  "$(_commit)"
}

build() {
  cd libtirpc

  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./bootstrap
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc \
    --disable-ipv6
  make
}

package() {
  cd libtirpc

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{include,share}}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libtirpc "${pkgdir}"/usr/share/licenses/lib32-libtirpc
}

# vim: ts=2 sw=2 et:
