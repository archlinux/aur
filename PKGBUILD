# Maintainer: bud

pkgname=dmenu-bud
pkgver=5.2
pkgrel=2
pkgdesc='Generic menu for X. Patched to fit i3menu'
url='https://github.com/budRich/dmenu'
arch=('x86_64')
license=('MIT')
depends=('sh' 'glibc' 'coreutils' 'libx11' 'libxinerama' 'libxft' 'freetype2' 'fontconfig' 'libfontconfig.so')
provides=(dmenu)
conflicts=(dmenu)
source=(https://dl.suckless.org/tools/dmenu-${pkgver}.tar.gz patchfile)
sha512sums=('7be9bb76b11225ec86a30e643e9b884f6d13af581526085212cb7401383d448a72fe4dffc3ce84ffb8319dbf36ca8384597a89070cd27d39d5618f239a2da6e3'
            'd9ca2a491804144fa80bbd46d80f11883be8bb84395e748129b1062193243b6b604d2cb065c32c90a8e49073eda406ef88652a254654250cc2fff4d7933048dc')
b2sums=('f827f0d0d935f9da8103dbb73ed8b67818f1213d2f8e5a406de5e8c9496ea0479b4ccb50d3a29004abc1e4e679cac177163c02458ed144d323bb50fc120f936d'
        'aff1060fe22d7169b27162d7ce4d65bdcc73f9cb6d2fa62a2d47de44939ae8d090debf9041b9556fb6d674f7adb4fe09217cfa1223c607f21e0bac539008472d')

prepare() {
  cd dmenu-${pkgver}
  patch -p1 -i ../patchfile
  echo "CPPFLAGS+=${CPPFLAGS}" >> config.mk
  echo "CFLAGS+=${CFLAGS}" >> config.mk
  echo "LDFLAGS+=${LDFLAGS}" >> config.mk
}

build() {
  cd dmenu-${pkgver}
  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11 \
    FREETYPEINC=/usr/include/freetype2
}

package() {
  cd dmenu-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
