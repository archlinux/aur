# Maintainer: bud

pkgname=dmenu-bud
pkgver=5.2.1
_upstream_ver=5.2
pkgrel=1
pkgdesc='Generic menu for X. Patched to fit i3menu'
url='https://github.com/budRich/dmenu'
arch=('x86_64')
license=('MIT')
depends=('sh' 'glibc' 'coreutils' 'libx11' 'libxinerama' 'libxft' 'freetype2' 'fontconfig' 'libfontconfig.so')
provides=(dmenu)
conflicts=(dmenu)
source=(https://dl.suckless.org/tools/dmenu-${_upstream_ver}.tar.gz patchfile)
sha512sums=('7be9bb76b11225ec86a30e643e9b884f6d13af581526085212cb7401383d448a72fe4dffc3ce84ffb8319dbf36ca8384597a89070cd27d39d5618f239a2da6e3'
            '4d8a8b3f4c5785d45a6f8a2f5fcaf24126d3a46fe678c4702dc63b930d6375e30526f84184ae70005ea4404300af07e62690aa8cb3d183366c2942ce197e498e')
b2sums=('f827f0d0d935f9da8103dbb73ed8b67818f1213d2f8e5a406de5e8c9496ea0479b4ccb50d3a29004abc1e4e679cac177163c02458ed144d323bb50fc120f936d'
        '2d267a10bb0fe1c515fbc3ae3239f5413861be5c4fdc81ef4acfcfc4b6fcf2ebf4f6d50b2d7b1a009ef925f68a0db58e03cb5fb5b685539a186a476abd2a4019')

prepare() {
  cd dmenu-${_upstream_ver}
  patch -p1 -i ../patchfile
  echo "CPPFLAGS+=${CPPFLAGS}" >> config.mk
  echo "CFLAGS+=${CFLAGS}" >> config.mk
  echo "LDFLAGS+=${LDFLAGS}" >> config.mk
}

build() {
  cd dmenu-${_upstream_ver}
  make \
    X11INC=/usr/include/X11 \
    X11LIB=/usr/lib/X11 \
    FREETYPEINC=/usr/include/freetype2
}

package() {
  cd dmenu-${_upstream_ver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
