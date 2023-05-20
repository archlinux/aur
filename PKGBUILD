# Maintainer: bud

pkgname=dmenu-bud
pkgver=5.2
pkgrel=1
pkgdesc='Generic menu for X. Patched to fit i3menu'
url='https://github.com/budRich/dmenu'
arch=('x86_64')
license=('MIT')
depends=('sh' 'glibc' 'coreutils' 'libx11' 'libxinerama' 'libxft' 'freetype2' 'fontconfig' 'libfontconfig.so')
provides=(dmenu)
conflicts=(dmenu)
source=(https://dl.suckless.org/tools/dmenu-${pkgver}.tar.gz patchfile)
sha512sums=('7be9bb76b11225ec86a30e643e9b884f6d13af581526085212cb7401383d448a72fe4dffc3ce84ffb8319dbf36ca8384597a89070cd27d39d5618f239a2da6e3'
            '07438ece4124a81b568445fc6f747e5bc924c05ee2a99c3eecb45aee824f65dc0f1b61ce79502fb02a72272ac42c15760aabb2b330a0a1bb2717051b384d48d9')
b2sums=('f827f0d0d935f9da8103dbb73ed8b67818f1213d2f8e5a406de5e8c9496ea0479b4ccb50d3a29004abc1e4e679cac177163c02458ed144d323bb50fc120f936d'
        '412593f2724e4f426883e5964abf10b4d763b42289ce351e4d924353e6ad3dbc659269331653d0377f76de0ff6f49e642e2bac177e23c9fcdfec7287d8c59fa8')

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
