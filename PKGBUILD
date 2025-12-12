# Maintainer: Nicholas Wang <me@nicho1as.wang>
# Credit: mickybart <mickybart@pygoscelis.org>

# Maintainer: LeoDreamer <leodreamer2004@gmail.com>
# Contributor: crl <crl18039102576@126.com>

pkgname='qt6-wasm'

_qtver=6.10.1
_emsdkver=4.0.7
_emsdk=4.0.7

_qt="qt-everywhere-src-${_qtver}"

pkgver=${_qtver/-/}
pkgrel=1
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='A cross-platform application and UI framework for WebAssembly'
depends=( "python" )
makedepends=(cmake ninja
             qt6-base=${_qtver}
             qt6-shadertools=${_qtver}
             qt6-declarative=${_qtver}
             qt6-quick3d=${_qtver}
             qt6-tools=${_qtver}
             qt6-remoteobjects=${_qtver}
             qt6-scxml=${_qtver}
)
groups=('qt-wasm' 'qt6-wasm')
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${_qtver}/single/${_qt}.tar.xz"
        "https://github.com/emscripten-core/emsdk/archive/refs/tags/${_emsdk}.tar.gz"
        'qtwasm_env.sh'
        'fix-compile.patch'
)

sha256sums=('0ed08b079719394303cd2054b66b2dc0c5895ceeb88fb6131c18991c980bf00f'
            'b7262c64f4b5f0692f3bab063cafb09682495f98355677a3f1373d0520457bad'
            '9dba88f1628175272c2509a7d823155ae35021a45532240c19941fa681ebb865'
            '67a13924a7662897702857300c0ceee957770cdb0276980b2268fdb166f740e2'
)

options=('!strip' 'staticlibs' '!buildflags' '!makeflags')

_opt=/opt/qt6-wasm

prepare () {
  echo "${srcdir}/emsdk"
  cd ${srcdir}/${_qt}

  patch -p1 "qtbase/src/corelib/global/qcompilerdetection.h" < ${srcdir}/fix-compile.patch
}

build() {
  # emsdk
  cd ${srcdir}/emsdk-${_emsdk}
  ./emsdk install $_emsdkver
  ./emsdk activate $_emsdkver
  source ${srcdir}/emsdk-${_emsdk}/emsdk_env.sh
  mkdir -p ${srcdir}/${_qt}/build-wasm
  cd ${srcdir}/${_qt}/build-wasm

  ${srcdir}/${_qt}/configure  -confirm-license -opensource \
    -nomake tests -nomake examples \
    -qt-host-path /usr \
    -platform wasm-emscripten \
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
  cp -a ${srcdir}/emsdk-${_emsdk} ${pkgdir}${_opt}/
  mv ${pkgdir}${_opt}/emsdk-${_emsdk} ${pkgdir}${_opt}/emsdk
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
  rm "${pkgdir}/${_opt}/emsdk/upstream/emscripten/cache/" -rf
}
