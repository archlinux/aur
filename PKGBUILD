# Maintainer: Fredy García <frealgagu at gmail dot com>
# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Wieland Hoffmann <the_mineo@web.de>
# Contributor: Birger Moellering <bmoellering@googlemail.com>
# 2018/01/03: <dropped from community; upstream dead, unneeded>
# 2012/06/05: <added into community as supercollider dependency>
# 2012/03/21: <dropped from community; broken + see bug #28344>

pkgname=cwiid
pkgver=svn_history
pkgrel=1
pkgdesc="Linux Nintendo Wiimote interface"
arch=('x86_64')
url="http://abstrakraft.org/${pkgname}"
depends=('bluez-libs' 'gtk2' 'python2')
license=('GPL')
install="${pkgname}.install"
source=("https://github.com/abstrakraft/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('25c105c37ae0778b6e47c4a02bfc74380f3b3dcc4cb71a3968a243a7de33c55d8b6d7860d826d1d5a6a197223fdb6022effd27d40394ca7007d997694438739b')

#cwiid-0.6.00 trunk@201 svn_history

prepare() {
  cd "${pkgname}-${pkgver}"
  # fixing ldconfig use in configure
  sed -i '/ldconfig/s/WITH/ENABLE/' configure.ac
  autoreconf -fi
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-python=python2 \
    --enable-ldconfig=no

  LDFLAGS+=" -pthread -lpthread -lbluetooth" make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # wminput README
  install -Dm644 wminput/README "${pkgdir}/usr/share/doc/${pkgname}/wminput/README"
}

# vim:set ts=2 sw=2 et:
