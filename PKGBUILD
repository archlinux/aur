# Maintainer: Nicholas Wang <me@nicho1as.wang>
# Credit: mickybart <mickybart@pygoscelis.org>

pkgname='qt6-wasm'

_qtver=6.8.0
_emsdkver=3.1.56
_emsdk=3.1.70

_qt="qt-everywhere-src-${_qtver}"

#_modules="qtbase qtdeclarative qtquickcontrols2 qtwebsockets qtsvg"
#_modules="qtbase,qtdeclarative,qtquickcontrols2,qtwebsockets,qtsvg"

_modules="qt3d qt5compat qtactiveqt qtbase qtcharts qtcoap qtconnectivity qtdatavis3d qtdeclarative qtdoc qtgraphs qtgrpc qthttpserver qtimageformats qtlanguageserver qtlocation qtlottie qtmqtt qtmultimedia qtnetworkauth qtopcua qtpositioning qtquick3d qtquick3dphysics qtquickeffectmaker qtquicktimeline qtremoteobjects qtscxml qtsensors qtserialbus qtserialport qtshadertools qtspeech qtsvg qttools qttranslations qtvirtualkeyboard qtwayland qtwebchannel qtwebengine qtwebsockets qtwebview"

pkgver=${_qtver/-/}
pkgrel=0
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework for WebAssembly'
depends=( "python" )
makedepends=(git cmake ninja
             qt6-base=${_qtver}
             qt6-shadertools=${_qtver}
             qt6-declarative=${_qtver}
             qt6-quick3d=${_qtver}
             qt6-tools=${_qtver}
             qt6-remoteobjects=${_qtver}
             qt6-scxml=${_qtver}
)
conflicts=()
groups=('qt-wasm' 'qt6-wasm')
install=$pkgname.install
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/single/${_qt}.tar.xz"
        "git+https://github.com/emscripten-core/emsdk.git#tag=${_emsdk}"
        'qtwasm_env.sh')
sha256sums=('70f1a87c6ecc6c108dec6e9389e564f8798bd48bec4c596f28d0564c1dbbc2c6'
            '7203278cf1aad49b6ecdeb43f7f95dfd470906cfd0d285c1d91387ffb465e697'
            '9dba88f1628175272c2509a7d823155ae35021a45532240c19941fa681ebb865')

options=('strip' 'staticlibs' '!buildflags' '!makeflags')

_opt=/opt/qt6-wasm

build() {
  # emsdk
  cd ${srcdir}/emsdk
  #touch .emscripten # embedded for the build only
  ./emsdk install $_emsdkver
  ./emsdk activate $_emsdkver
  source ${srcdir}/emsdk/emsdk_env.sh
  mkdir -p ${srcdir}/${_qt}/build-wasm
  cd ${srcdir}/${_qt}/build-wasm

#  emcmake cmake -G Ninja -S "${srcdir}/${_qt}" -B "${srcdir}/build" \
#  -DQT_HOST_PATH=/usr \
#  -DWARNINGS_ARE_ERRORS=OFF \
#  -DCMAKE_INSTALL_PREFIX=$_opt \
#  -DQT_QMAKE_TARGET_MKSPEC=wasm-emscripten \
#  -DQT_BUILD_TESTS=FALSE \
#  -DQT_BUILD_EXAMPLES=FALSE

  ${srcdir}/${_qt}/configure  -confirm-license -opensource \
    -nomake tests -nomake examples \
    -no-warnings-are-errors \
    -qt-host-path /usr \
    -platform wasm-emscripten \
    -feature-thread \
    -feature-wasm-exceptions \
    -prefix "${_opt}"
#    -skip qtwayland \
#    -skip qtwebengine \
#    -skip qtwebview \
#    -skip qtwebchannel \
#    -skip qtactiveqt

  cd ${srcdir}/${_qt}/build-wasm
  cmake --build ${srcdir}/${_qt}/build-wasm
}

package() {
  ## qt
  cd ${srcdir}/${_qt}/build-wasm
  cmake --install ${srcdir}/${_qt}/build-wasm --prefix=${pkgdir}

#  for module in $_modules; do
#    cd $module
#    cd ..
#  done
  install -Dm644 ${srcdir}/${_qt}/LICENSES/* -t ${pkgdir}/usr/share/licenses/$pkgname

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}${_opt}/" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  ## emsdk
#  cp -a ${srcdir}/emsdk ${pkgdir}${_opt}/
#  cd ${pkgdir}${_opt}/emsdk
#  rm -rf .git .circleci .gitignore
#  sed -i "s|${srcdir}|${_opt}|" .emscripten_sanity_wasm
#  sed -i "s|${srcdir}|${_opt}|" upstream/emscripten/cache/is_vanilla.txt
#  sed -i "s|qt6emsdk|${pkgname}-emsdk|" emsdk.py
#  find . -type d -name "__pycache__" -prune -exec rm -rf {} \;
#  find . -type d -exec chmod 755 {} \;
#  find . -type f -executable -exec chmod 755 {} \;
#  find . -type f -not -executable -exec chmod 644 {} \;

  ## env
#  cp ${srcdir}/qtwasm_env.sh ${pkgdir}${_opt}/
#  sed -i "s/EMSDKVER/$_emsdkver/" ${pkgdir}${_opt}/qtwasm_env.sh
}
