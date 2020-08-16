# Maintainer: mickybart <mickybart@pygoscelis.org>

pkgname='qt5-wasm'

_qtver=5.15.0
_emsdkver=1.39.8

_qt="qt-everywhere-src-${_qtver}"

_modules="qtbase qtdeclarative qtquickcontrols2 qtwebsockets qtsvg"

pkgver=${_qtver/-/}
pkgrel=4
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework for WebAssembly (No multithreading)'
depends=('python')
makedepends=()
conflicts=()
groups=('qt-wasm' 'qt5-wasm')
install=$pkgname.install
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/single/${_qt}.tar.xz"
        'git+https://github.com/emscripten-core/emsdk.git#tag=2.0.0'
	'emsdk.patch'
        'qtwasm_env.sh')
sha256sums=('22b63d7a7a45183865cc4141124f12b673e7a17b1fe2b91e433f6547c5d548c3'
            'SKIP'
            'd96327578ad9535cdd2d0b0277ac89a65e86ffbb426c818e3e00fd29ddbd932a'
            'd5e93f991453f1b9ff9ba6f053520ae0610f32d6f0fa0772f6587f10f3dfe023')
options=('!strip')

_opt=/opt/qt5-wasm

prepare() {
  # qt
  cd ${srcdir}/${_qt}

  # emsdk
  cd ${srcdir}/emsdk
  #touch .emscripten # embedded for the build only
  ./emsdk install $_emsdkver
  ./emsdk activate $_emsdkver
}

build() {

  # emsdk
  source ${srcdir}/emsdk/emsdk_env.sh

  cd ${srcdir}/${_qt}

  ./configure -confirm-license -opensource -v \
    -xplatform wasm-emscripten \
    -prefix $_opt \
    -nomake examples
    
  for module in $_modules; do
    make module-$module
  done
  
}

package() {
  ## qt

  cd ${srcdir}/${_qt}
  
  for module in $_modules; do
    cd $module
    make INSTALL_ROOT="${pkgdir}" install
    cd ..
  done

  install -Dm644 LICENSE* -t "${pkgdir}${_opt}"/share/licenses/$pkgname

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}${_opt}/" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  ## emsdk
  cp -a ${srcdir}/emsdk ${pkgdir}${_opt}/
  cd ${pkgdir}${_opt}/emsdk
  rm -rf .git .circleci .gitignore
  sed -i "s|${srcdir}|${_opt}|" .emscripten_sanity_wasm
  sed -i "s|${srcdir}|${_opt}|" upstream/emscripten/cache/is_vanilla.txt
  patch --forward --strip=1 --input="${srcdir}/emsdk.patch"
  sed -i "s|qt5emsdk|${pkgname}-emsdk|" emsdk.py

  find . -type d -name "__pycache__" -prune -exec rm -rf {} \;
  find . -type d -exec chmod 755 {} \;
  find . -type f -executable -exec chmod 755 {} \;
  find . -type f -not -executable -exec chmod 644 {} \;

  ## env
  cp ${srcdir}/qtwasm_env.sh ${pkgdir}${_opt}/
  sed -i "s/EMSDKVER/$_emsdkver/" ${pkgdir}${_opt}/qtwasm_env.sh
}

