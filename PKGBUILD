# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=libx11-firefox-fix
_pkgname=libx11
pkgver=1.8.2
pkgrel=1
pkgdesc="X11 client-side library (with Firefox freeze fix)"
arch=(x86_64)
url="https://xorg.freedesktop.org/"
# keep xorgproto runtime dependency
# https://lists.archlinux.org/pipermail/arch-dev-public/2019-December/029767.html
depends=('libxcb' 'xorgproto')
makedepends=('xorg-util-macros' 'xtrans')
license=('custom')
options=('debug')
conflicts=('libx11')
provides=("libx11=${pkgver}")
source=(patch.diff ${url}/releases/individual/lib/libX11-${pkgver}.tar.xz{,.sig})
sha512sums=('4871a9f39d8988d38d4b0d4ea49fcc30019024dfe12e999c903b932f4c11f17c1e63852ffb2ec5585430086bf02b1ffc0668c02ef86a6899a3b687ab1e6e11c4'
            '662ee8043d9ba27df82f647515b701d6f302a52715f21afdaba391f3b70691753e3649e7ff8322e07858be4297df9cbb19227958d676ed6dea198cce64330d1d'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alanc@freedesktop.org>
#validpgpkeys=('C41C985FDCF1E5364576638B687393EE37D128F8') # Matthieu Herrb <matthieu.herrb@laas.fr>
#validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>
#validpgpkeys=('995ED5C8A6138EB0961F18474C09DD83CAAA50B2') # Adam Jackson <ajax@nwnk.net>
#validpgpkeys=('C383B778255613DFDB409D91DB221A6900000011') # "Keith Packard <keithp@keithp.com>"

prepare() {
  # Revert commit that causes Firefox to freeze
  # See https://gitlab.freedesktop.org/xorg/lib/libx11/-/issues/168
  cd "${srcdir}/libX11-${pkgver}"
  patch -R  -p1 < "${srcdir}/patch.diff"
}

build() {
  cd libX11-${pkgver}
  ./configure --prefix=/usr \
    --disable-static \
    --disable-xf86bigfont
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd libX11-${pkgver}
  make check
}

package() {
  cd "${srcdir}/libX11-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
