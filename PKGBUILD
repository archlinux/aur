# Maintainer: BryanLiang <liangrui.ch at gmail dot com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

_pkgname=libx11
pkgname="${_pkgname}-mr293"
pkgver=1.8.12
pkgrel=1
pkgdesc="X11 client-side library (with patch from merge request 293)"
arch=(x86_64)
url="https://gitlab.freedesktop.org/xorg/lib/libx11"
# keep xorgproto runtime dependency
# https://lists.archlinux.org/pipermail/arch-dev-public/2019-December/029767.html
depends=('libxcb' 'glibc' 'xorgproto')
makedepends=('xorg-util-macros' 'xtrans')
license=('MIT AND X11')
provides=('libx11')
conflicts=('libx11')
source=(https://xorg.freedesktop.org//releases/individual/lib/libX11-${pkgver}.tar.xz{,.sig}
        'mr293.patch::https://gitlab.freedesktop.org/xorg/lib/libx11/-/merge_requests/293.diff')
sha512sums=('cb7a284d9081a8b67f7d8568d56dc403a4b787e46ac497b07768d236084c01f80f4ea2ebd814f950ac9738adc3baea3912932fc333858195c4f8217744b6f730'
            'SKIP'
            'db4487a29b8031121eeaa1b2a32e9104914db2ec16fb7f8b294fe59463f0b82a9fa0fded3a064d5e37f3565693255f97aadcaf40c252afe3924ca29d4dd702ec')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # Alan Coopersmith <alanc@freedesktop.org>
#validpgpkeys=('C41C985FDCF1E5364576638B687393EE37D128F8') # Matthieu Herrb <matthieu.herrb@laas.fr>
#validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>
#validpgpkeys=('995ED5C8A6138EB0961F18474C09DD83CAAA50B2') # Adam Jackson <ajax@nwnk.net>
#validpgpkeys=('C383B778255613DFDB409D91DB221A6900000011') # "Keith Packard <keithp@keithp.com>"

build() {
  cd libX11-${pkgver}

  patch -Np1 < "${srcdir}/mr293.patch"

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
  cd "libX11-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d -m755 "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
