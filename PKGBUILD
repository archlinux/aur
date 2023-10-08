# Maintainer: Adrià Cabello <adro.cc79 at protonmail dot com>
# Contributor: Fabio Loli <fabio.loli@disroot.org>

pkgname=materialx-git
pkgver=1.38.8.r12.gf583ea1
pkgrel=1
pkgdesc="Open standard for representing rich material and look-development content in computer graphics"
arch=('x86_64')
url="https://materialx.org/"
license=('Apache')
depends=(glibc gcc-libs libglvnd libx11 libxt python python-setuptools opencolorio zenity)
makedepends=(cmake chrpath git libxinerama libxcursor pybind11)
provides=('materialx')
conflicts=('materialx')
source=("git+https://github.com/AcademySoftwareFoundation/MaterialX.git#branch=main"
        "git+https://github.com/mitsuba-renderer/nanogui.git"
        "git+https://github.com/ocornut/imgui.git"
        "git+https://github.com/thedmd/imgui-node-editor.git"
        "git+https://github.com/wjakob/nanovg.git"
        "git+https://github.com/wjakob/nanovg_metal.git"
        "git+https://github.com/wjakob/glfw.git"
        "git+https://github.com/wjakob/nanobind.git"
        "materialx-grapheditor.desktop"
        "materialx-view.desktop"
        "materialx.xml")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'bd573797248a45bf015fd8406981c54cdcec57a7d5031fdfb4247563bf5c3a37'
            '8af0e2e0c8e8aef8d1ced829753dc74579970a434f8897da12ceae6a64bb47b3'
            'd9b9426fb94121da052b796542cc74a0c5d7cef06997be70611c25f345553861')

pkgver() {
  cd MaterialX
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
  cd MaterialX
  git submodule init
  git config submodule.source/MaterialXView/NanoGUI.url "${srcdir}/nanogui"
  git config submodule.source/MaterialXGraphEditor/External/ImGui.url "${srcdir}/imgui"
  git config submodule.source/MaterialXGraphEditor/External/ImGuiNodeEditor.url "${srcdir}/imgui-node-editor"
  git -c protocol.file.allow=always submodule update

  cd source/MaterialXView/NanoGUI
  git submodule init
  git config submodule.ext/nanovg.url "${srcdir}/nanovg"
  git config submodule.ext/nanovg_metal.url "${srcdir}/nanovg_metal"
  git config submodule.ext/glfw.url "${srcdir}/glfw"
  git config submodule.ext/nanobind.url "${srcdir}/nanobind"
  git -c protocol.file.allow=always submodule update
}

build() {
  mkdir -p build
  cd build

  cmake "$srcdir"/MaterialX \
  -Wno-dev\
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

  chrpath --delete "${pkgdir}"/opt/materialx/python/MaterialX/*.so
  chrpath --delete "${pkgdir}"/opt/materialx/bin/MaterialXView
}
