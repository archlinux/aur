# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# This file is created from PKGBUILD.sh.ep contained by the mentioned repository.
# Do not edit it manually! See README.md in the repository's root directory
# for more information.

_qt_module=qttranslations
pkgname=mingw-w64-qt5-translations
pkgver=5.15.13
pkgrel=1
arch=('any')
pkgdesc="A cross-platform application and UI framework (translations, mingw-w64)"
depends=('mingw-w64-qt5-base')
makedepends=('mingw-w64-gcc' 'mingw-w64-pkg-config' 'mingw-w64-qt5-tools')
license=('GPL3' 'LGPL3' 'FDL' 'custom')
_commit=40aabebd04a30ccef374bf20a7bfaa1d8d665b7f
_basever=${pkgver%%+*}
makedepends+=('git')
options=('!strip' '!buildflags' 'staticlibs')
groups=('mingw-w64-qt5')
url='https://www.qt.io/'
_pkgfqn=${_qt_module}
source=(git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit)
sha256sums=('a57dc54f83106ce0c9f4cb3a6101b55dfae107c1aff6589872738fd0b65bd56a')

_architectures='i686-w64-mingw32 x86_64-w64-mingw32'

_configurations+=('CONFIG+=actually_a_shared_build CONFIG+=shared')

pkgver() {
  cd $_pkgfqn
  echo "$_basever+kde+r"`git rev-list --count v$_basever-lts-lgpl..$_commit`
}

prepare() {
  cd "${srcdir}/${_pkgfqn}"
}

build() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      msg2 "Building ${_config##*=} version for ${_arch}"
      mkdir -p build-${_arch}-${_config##*=} && pushd build-${_arch}-${_config##*=}
      ${_arch}-qmake-qt5 ../${_qt_module}.pro ${_config} ${_additional_qmake_args}
      make -j$(nproc)
      popd
    done
  done
}

package() {
  cd "${srcdir}/${_pkgfqn}"

  for _arch in ${_architectures}; do
    for _config in "${_configurations[@]}"; do
      pushd build-${_arch}-${_config##*=}

      make -j$(nproc) INSTALL_ROOT="$pkgdir" install
      popd
    done
  done
}
