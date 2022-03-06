# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Franco Tortoriello <franco.tortoriello@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libtirpc
pkgver=1.3.2
pkgrel=2
pkgdesc='Transport Independent RPC library (SunRPC replacement)'
arch=(x86_64)
url=http://libtirpc.sourceforge.net/
license=(BSD)
depends=(
  lib32-krb5
  libtirpc
)
makedepends=(git)
_tag=7089bb02714e23b9c737c22d64f1ee3b256e45f4
source=(git://git.linux-nfs.org/projects/steved/libtirpc.git#tag=${_tag})
sha256sums=(SKIP)

pkgver() {
  cd libtirpc

  git describe --tags | sed 's/^libtirpc-//; s/-/./g'
}

prepare() {
  cd libtirpc

  chmod +x autogen.sh
  ./autogen.sh
}

build() {
  cd libtirpc

  export CC='gcc -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc
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
