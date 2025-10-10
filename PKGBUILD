# Maintainer: Nicholas Wang <me@nicho1as.wang>
# Credit: mickybart <mickybart@pygoscelis.org>

# Maintainer: LeoDreamer <leodreamer2004@gmail.com>
# Contributor: crl <crl18039102576@126.com>

pkgname='qt6-wasm'

_qtver=6.10.0
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
        '0001-cmake-QtBuildInternalsExtra.cmake.in-Patch-out-embed.patch'
)

# patch from https://groups.google.com/g/linux.debian.bugs.dist/c/2_3NYGo4faE?pli=1
# https://17797152399858172281.googlegroups.com/attach/12036d62e8f2a/0001-cmake-QtBuildInternalsExtra.cmake.in-Patch-out-embed.patch?part=0.0.1&view=1&view=1&vt=ANaJVrE9sl_mZ0X1hLMbYFWN-vllz3OwGD8lcLaPm6Du2jY-KE_-YabjHUIqtXqMhx7Lk1j0x_sYmC5j4kJNK1BH32jMeEEpR3jXxh10v5-kl7hFkK22Hy0


sha256sums=('81895fb038a9c3d6c6f698d7611339a189eb45c3d91746c7789b0b77a5981aa3'
            'b7262c64f4b5f0692f3bab063cafb09682495f98355677a3f1373d0520457bad'
            '9dba88f1628175272c2509a7d823155ae35021a45532240c19941fa681ebb865'
            '8617181969f97d1a245295ad62537c64267f0a4646ff832cd55b37282f4f4ad9'
)

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
