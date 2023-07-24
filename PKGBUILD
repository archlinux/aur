# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

pkgname=materialx
pkgver=1.38.7
pkgrel=4
pkgdesc="Open standard for representing rich material and look-development content in computer graphics"
arch=('x86_64')
url="https://materialx.org/"
license=('Apache')
depends=(glibc gcc-libs libglvnd libx11 libxt python python-setuptools opencolorio)
makedepends=(cmake chrpath libxinerama libxcursor pybind11)
source=("https://github.com/AcademySoftwareFoundation/MaterialX/releases/download/v${pkgver}/MaterialX-${pkgver}.tar.gz"
        "materialx-grapheditor.desktop"
        "materialx-view.desktop"
        "materialx.xml")
sha256sums=('626ad4e0cb77398d960b457e7625c96f9909845484ff29ba57f8b103ff9fecbd'
            'bd573797248a45bf015fd8406981c54cdcec57a7d5031fdfb4247563bf5c3a37'
            '8af0e2e0c8e8aef8d1ced829753dc74579970a434f8897da12ceae6a64bb47b3'
            'd9b9426fb94121da052b796542cc74a0c5d7cef06997be70611c25f345553861')

build() {
  mkdir -p build
  cd build

  cmake "$srcdir"/MaterialX-${pkgver} \
  -Wno-dev\
  -DMATERIALX_BUILD_PYTHON=ON\
  -DMATERIALX_BUILD_VIEWER=ON\
  -DMATERIALX_BUILD_GRAPH_EDITOR=ON

  cmake --build . --target install -- -j
}

package() {
  mkdir -p "${pkgdir}"/{usr/bin,usr/share/applications,usr/share/licenses/materialx,opt}

  cp -r "$srcdir"/build/installed ${pkgdir}/opt/materialx

  install -Dm755 "$srcdir"/MaterialX-${pkgver}/documents/Images/MaterialXLogo_200x155.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/materialx.png
  cp "$srcdir"/{materialx-grapheditor.desktop,materialx-view.desktop} "${pkgdir}"/usr/share/applications
  install -Dm644 "$srcdir"/materialx.xml "${pkgdir}"/usr/share/mime/model/materialx.xml

  mv "${pkgdir}"/opt/materialx/{LICENSE,THIRD-PARTY.md} "${pkgdir}"/usr/share/licenses/materialx/

  ln -s /opt/materialx/bin/MaterialXView "${pkgdir}"/usr/bin/mtlxview
  ln -s /opt/materialx/bin/MaterialXGraphEditor "${pkgdir}"/usr/bin/mtlxGraphEditor

  chrpath --delete "${pkgdir}"/opt/materialx/python/MaterialX/*.so
  chrpath --delete "${pkgdir}"/opt/materialx/bin/MaterialXView
}
