# Maintainer: mickybart <mickybart@pygoscelis.org>

pkgname='qt5-wasm'

_qtver=5.15.2
_emsdkver=1.39.8
_emsdk=2.0.29

_qt="qt-everywhere-src-${_qtver}"

_modules="qtbase qtdeclarative qtquickcontrols2 qtwebsockets qtsvg"

pkgver=${_qtver/-/}
pkgrel=2
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
        "git+https://github.com/emscripten-core/emsdk.git#tag=${_emsdk}"
        'qtwasm_env.sh'
        "qtbase-${_qtver}-gcc11.patch")
sha256sums=('3a530d1b243b5dec00bc54937455471aaa3e56849d2593edb8ded07228202240'
            'SKIP'
            'c124915abf2de106429de9a6bb8907961a662808331933b448b048e5cd215f32'
            'a8f2650fba0ba63b6ed7e37ca3ac857314808fa83fc035f343f2cc764c4a8567')
options=('!strip')

_opt=/opt/qt5-wasm

prepare() {
  # qt
  cd ${srcdir}/${_qt}/qtbase
  patch -p1 < ${srcdir}/qtbase-${_qtver}-gcc11.patch

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
  sed -i "s|qt5emsdk|${pkgname}-emsdk|" emsdk.py

  find . -type d -name "__pycache__" -prune -exec rm -rf {} \;
  find . -type d -exec chmod 755 {} \;
  find . -type f -executable -exec chmod 755 {} \;
  find . -type f -not -executable -exec chmod 644 {} \;

  ## env
  cp ${srcdir}/qtwasm_env.sh ${pkgdir}${_opt}/
  sed -i "s/EMSDKVER/$_emsdkver/" ${pkgdir}${_opt}/qtwasm_env.sh
}

