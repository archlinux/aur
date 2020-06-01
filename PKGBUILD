# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.in contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

_qt_module=qttranslations
pkgname=mingw-w64-qt5-translations
pkgver=5.15.0
pkgrel=1
arch=('any')
pkgdesc="A cross-platform application and UI framework (translations, mingw-w64)"
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'mingw-w64-qt5-tools')
license=('GPL3' 'LGPL3' 'FDL' 'custom')
options=('!strip' '!buildflags' 'staticlibs')
groups=('mingw-w64-qt5')
url='https://www.qt.io/'
_pkgfqn="${_qt_module}-everywhere-src-${pkgver}"
source=("https://download.qt.io/official_releases/qt/${pkgver%.*}/${pkgver}/submodules/${_pkgfqn}.tar.xz")
sha256sums=('45c43268d9df50784d4d8ca345fce9288a1055fd074ac0ef508097f7aeba22fe')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

[[ $NO_SHARED_LIBS ]] || \
  _configurations+=('CONFIG+=actually_a_shared_build CONFIG+=shared')

build() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      msg2 "Building ${_config##*=} version for ${_arch}"
      mkdir -p build-${_arch}-${_config##*=} && pushd build-${_arch}-${_config##*=}
      ${_arch}-qmake-qt5 ../${_qt_module}.pro ${_config} ${_additional_qmake_args}
      make
      popd
    done
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      pushd build-${_arch}-${_config##*=}

      make INSTALL_ROOT="$pkgdir" install
      popd
    done
  done
}
