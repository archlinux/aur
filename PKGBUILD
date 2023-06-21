# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
pkgname=materialx
_pkgver_major=1.38
_pkgver_minor=7
pkgver=${_pkgver_major}.${_pkgver_minor}
pkgrel=2
pkgdesc="Open standard for representing rich material and look-development content in computer graphics"
arch=('x86_64')
url="https://materialx.org/"
license=('Apache')
depends+=(libx{inerama,cursor} 'python' 'pybind11' 'openshadinglanguage' 'openimageio' 'pugixml' 'glfw' 'libxt')
makedepends=('cmake')
provides=('materialx')
source=(git+"https://github.com/AcademySoftwareFoundation/MaterialX.git#tag=v${pkgver}"
        "materialx-grapheditor.desktop"
        "materialx-view.desktop"
        "materialx.xml")
md5sums=('SKIP'
         'b6a9f9582782cc6db2aed64d97b4013f'
         '9ba6a5cdaff0f6a983753e47454df175'
         'b0b94494e3a59b21b8ba725a75a21123')

prepare () {
  cd MaterialX

  git submodule update --init --recursive
}

build() {
  mkdir -p build
  cd build

  cmake "$srcdir"/MaterialX \
  -DMATERIALX_BUILD_PYTHON=ON\
  -DMATERIALX_BUILD_VIEWER=ON\
  -DMATERIALX_BUILD_GRAPH_EDITOR=ON

  cmake --build . --target install -- -j
}

package() {
  mkdir -p "${pkgdir}"/{usr/bin,usr/share/applications,usr/share/licenses/materialx,opt}

  cp -r "$srcdir"/build/installed ${pkgdir}/opt/materialx

  install -Dm755 "$srcdir"/MaterialX/documents/Images/MaterialXLogo_200x155.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/materialx.png
  cp "$srcdir"/{materialx-grapheditor.desktop,materialx-view.desktop} "${pkgdir}"/usr/share/applications
  install -Dm644 "$srcdir"/materialx.xml "${pkgdir}"/usr/share/mime/model/materialx.xml

  mv "${pkgdir}"/opt/materialx/{LICENSE,THIRD-PARTY.md} "${pkgdir}"/usr/share/licenses/materialx/

  ln -s /opt/materialx/bin/MaterialXView "${pkgdir}"/usr/bin/mtlxview
  ln -s /opt/materialx/bin/MaterialXGraphEditor "${pkgdir}"/usr/bin/mtlxGraphEditor
}
