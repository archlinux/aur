pkgbase=qtcreator-patches
pkgname=(qtcreator-patches qtcreator-devel-patches)
pkgver=18.0.1
_commit=18.0
pkgrel=1
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=(x86_64)
url='https://www.qt.io'
license=("Apache-2.0")
depends=(qt6-tools qt6-svg qt6-quick3d qt6-webengine qt6-serialport qt6-shadertools qt6-5compat
         clang clazy yaml-cpp litehtml) # syntax-highlighting
makedepends=(cmake llvm python clang go)
options=(docs)
optdepends=('qt6-doc: integrated Qt documentation'
            'qt6-examples: welcome page examples'
            'qt6-translations: for other languages'
            'gdb: debugger'
            'cmake: cmake project support'
            'x11-ssh-askpass: ssh support'
            'git: git support'
            'mercurial: mercurial support'
            'bzr: bazaar support'
            'valgrind: analyze support'
            'perf: performer analyzer'
            'mlocate: locator filter')
        
source=("fancymainwindow.patch"
        "projectmodels.patch"
        "navigationwidget.patch"
        "breakpoint.patch"
        "attach.patch"
        "perf.patch"
        "doxygen.patch"
        "pythonproject.patch"
        "appstackedpane.patch"
        "pylsp.patch"
        "pyindent.patch"
        "multitextcursor.patch")
sha256sums=('22f9559555524f7b40d9910627d63307ff48486b48312efa5325762fbc04d3a1'
            '5f13820fd849ae6baf7ebb2b61bd8be2a18b605326fce3d84755f1ee6998d47e'
            '8ef74fcac471d668875bf1ae645cbc991d5916441386576f63ff9f29770b77d3'
            'bae874c52203cc82aead56ca98a1bcee81f663f847c977ddf85039f41db1ecf8'
            'a58fdf8d5e13ba82cbc67133ddf961fd6012e9d6a9359b4ec49985cb3f650f73'
            '1c84f6c65c7c2b5c31299800a9bc9bb0ef4462871e0d599755284b3d3f88132e'
            'd2f1fcfc0dcc301ca65c141478957c938074b95ab063f682786226f576c8f9a8'
            '5c12a2a62b59f5c3d74eaf6e75a8a0b947e45f59cc410dfbe8774fda3f2e2913'
            '507dc7a5219da83ac7ef1bc07d9576ac703f7c7f6b8d766c6c43d0b9421f69ca'
            '8741091cf3b0ac606df2d581f82394964d78bc0a6d0b14f2ec0a71066ab0c3d8'
            'f94a87f46282b93679d7c3b26e060c7f88c7f64c692292efba2ee27e329692ac'
            '6546401d89e6b4991e5051b138a92e4222923283183ec2d9b347752113b6dbe1')

prepare() {
  cd $srcdir

  git clone --branch ${_commit} --depth 1 --recurse-submodules=no --shallow-submodules  git@github.com:qt-creator/qt-creator.git
  cd qt-creator
  git submodule update --init --depth 1 --recursive src/libs/3rdparty/googletest
  git submodule update --init --depth 1 --recursive src/shared/qbs
  git submodule update --init --depth 1 --recursive src/tools/perfparser
  cd ..

  patch -d qt-creator -p1 < projectmodels.patch
  patch -d qt-creator -p1 < navigationwidget.patch
  patch -d qt-creator -p1 < breakpoint.patch
  patch -d qt-creator -p1 < attach.patch  
  patch -d qt-creator -p1 < perf.patch  
  patch -d qt-creator -p1 < doxygen.patch
  patch -d qt-creator -p1 < pythonproject.patch
  patch -d qt-creator -p1 < appstackedpane.patch
  patch -d qt-creator -p1 < fancymainwindow.patch
  patch -d qt-creator -p1 < pylsp.patch
  patch -d qt-creator -p1 < pyindent.patch        # Fix rename symbol under cursor
  patch -d qt-creator -p1 < multitextcursor.patch # Fix delete and move cursor to left
}

build() {
  cmake -B build -S qt-creator \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DWITH_DOCS=ON \
    -DBUILD_DEVELOPER_DOCS=ON \
    -DBUILD_QBS=OFF \
    -DQTC_CLANG_BUILDMODE_MATCH=ON \
    -DCLANGTOOLING_LINK_CLANG_DYLIB=ON
  cmake --build build
  export QT_QPA_PLATFORMTHEME=""; cmake --build build --target docs
}

package_qtcreator-patches() {
  provides=('qtcreator')
  conflicts=('qtcreator')
    
  DESTDIR="$pkgdir" cmake --install build
  # Install docs
  cp -r build/share/doc "$pkgdir"/usr/share
}

package_qtcreator-devel-patches() {
  provides=('qtcreator-devel')
  conflicts=('qtcreator-devel')
  pkgdesc+=' (development files)'
  depends=(qtcreator-patches)
  optdepends=()

  DESTDIR="$pkgdir" cmake --install build --component Devel
}