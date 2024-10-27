# Maintainer: Nicholas Wang <me@nicho1as.wang>
# Credit: mickybart <mickybart@pygoscelis.org>

pkgname='qt6-wasm'

_qtver=6.8.0
_emsdkver=3.1.56
_emsdk=3.1.70

_qt="qt-everywhere-src-${_qtver}"

#_modules="qtbase qtdeclarative qtquickcontrols2 qtwebsockets qtsvg"
#_modules="qtbase,qtdeclarative,qtquickcontrols2,qtwebsockets,qtsvg"
#_modules="qt3d qt5compat qtactiveqt qtbase qtcharts qtcoap qtconnectivity qtdatavis3d qtdeclarative qtdoc qtgraphs qtgrpc qthttpserver qtimageformats qtlanguageserver qtlocation qtlottie qtmqtt qtmultimedia qtnetworkauth qtopcua qtpositioning qtquick3d qtquick3dphysics qtquickeffectmaker qtquicktimeline qtremoteobjects qtscxml qtsensors qtserialbus qtserialport qtshadertools qtspeech qtsvg qttools qttranslations qtvirtualkeyboard qtwayland qtwebchannel qtwebengine qtwebsockets qtwebview"

pkgver=${_qtver/-/}
pkgrel=2
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
        'qtwasm_env.sh'
        '0001-cmake-QtBuildInternalsExtra.cmake.in-Patch-out-embed.patch')

# patch from https://groups.google.com/g/linux.debian.bugs.dist/c/2_3NYGo4faE?pli=1
# https://17797152399858172281.googlegroups.com/attach/12036d62e8f2a/0001-cmake-QtBuildInternalsExtra.cmake.in-Patch-out-embed.patch?part=0.0.1&view=1&view=1&vt=ANaJVrE9sl_mZ0X1hLMbYFWN-vllz3OwGD8lcLaPm6Du2jY-KE_-YabjHUIqtXqMhx7Lk1j0x_sYmC5j4kJNK1BH32jMeEEpR3jXxh10v5-kl7hFkK22Hy0


sha256sums=('70f1a87c6ecc6c108dec6e9389e564f8798bd48bec4c596f28d0564c1dbbc2c6'
            '7203278cf1aad49b6ecdeb43f7f95dfd470906cfd0d285c1d91387ffb465e697'
            '9dba88f1628175272c2509a7d823155ae35021a45532240c19941fa681ebb865'
            '8617181969f97d1a245295ad62537c64267f0a4646ff832cd55b37282f4f4ad9')

options=('!strip' 'staticlibs' '!buildflags' '!makeflags')

_opt=/opt/qt6-wasm

prepare () {
  echo "${srcdir}/emsdk"
  cd ${srcdir}/${_qt}

  # apply patches; further descriptions can be found in patch files itself
  for patch in "$srcdir/"*.patch; do
    msg2 "Applying patch $patch"
    patch -p1 -i "$patch"
  done
}



build() {
  # emsdk
  cd ${srcdir}/emsdk
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
    -xplatform wasm-emscripten \
    -feature-thread \
    -feature-wasm-exceptions \
    -prefix "${_opt}"

  cd ${srcdir}/${_qt}/build-wasm
  cmake --build ${srcdir}/${_qt}/build-wasm
}

package() {
  ## qt
  cd ${srcdir}/${_qt}/build-wasm
  cmake --install ${srcdir}/${_qt}/build-wasm --prefix=${pkgdir}${_opt}

  install -Dm644 ${srcdir}/${_qt}/LICENSES/* -t ${pkgdir}/usr/share/licenses/$pkgname

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "${pkgdir}/${_opt}/" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  find ${pkgdir}/${_opt} -type f -name 'lib*.so' -exec emstrip --strip-debug --strip-unneeded {} \;
  find ${pkgdir}/${_opt} -type f -name 'lib*.a' -exec emstrip --strip-debug {} \;
  find ${pkgdir}/${_opt} -type f -name '*.prl' -exec sed -i "s|${srcdir}/${_qt}/build-wasm/qtbase|${_opt}|g" {} \;
  find ${pkgdir}/${_opt} -type f -name '*.pri' -exec sed -i "s|${srcdir}/${_qt}/build-wasm/qtbase|${_opt}|g" {} \;
  find ${pkgdir}/${_opt} -type f -name '*.pri' -exec sed -i "s|${srcdir}/${_qt}/build-wasm||g" {} \;
  find ${pkgdir}/${_opt} -type f -name '*.cmake' -exec sed -i -e "s|${srcdir}/${_qt}/build-wasm||g" {} \;
  find ${pkgdir}/${_opt} -type f -name '*.cmake' -exec sed -i "s|${srcdir}/emsdk|${_opt}/emsdk|g" {} \;

  ## emsdk
  cp -a ${srcdir}/emsdk ${pkgdir}${_opt}/
  cd ${pkgdir}${_opt}/emsdk
  rm -rf .git .circleci .gitignore
  sed -i "s|${srcdir}|${_opt}|" upstream/emscripten/cache/sanity.txt
#  sed -i "s|${srcdir}|${_opt}|" upstream/emscripten/cache/is_vanilla.txt
  sed -i "s|qt6emsdk|${pkgname}-emsdk|" emsdk.py
  find . -type d -name "__pycache__" -prune -exec rm -rf {} \;
  find . -type d -exec chmod 755 {} \;
  find . -type f -executable -exec chmod 755 {} \;
  find . -type f -not -executable -exec chmod 644 {} \;

  ## env
  cp ${srcdir}/qtwasm_env.sh ${pkgdir}${_opt}/
  sed -i "s/EMSDKVER/$_emsdkver/" ${pkgdir}${_opt}/qtwasm_env.sh
}
