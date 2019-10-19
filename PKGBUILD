# Maintainer: Donald Carr<sirspudd@gmail.com>

#set -o errexit
#set -o xtrace

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
_building=true
pkgname=qtcreator-prerelease
_pkgvermajmin=4.11
_pkgver=${_pkgvermajmin}.0
_verpostfix="beta1"
pkgver="${_pkgver}${_verpostfix}"
pkgrel=0
_urlbase="https://download.qt.io/official_releases"
if [[ -n $_verpostfix ]]; then
  _pkgver=${_pkgver}-${_verpostfix}
  _urlbase="https://download.qt.io/development_releases"
fi
_filename=qt-creator-opensource-src-${_pkgver}
pkgdesc='Qt Creator prerelease/latest'
arch=('x86_64')
url='http://qt.io/ide'
license=('GPL')
provides=('qtcreator' 'qbs')
conflicts=('qtcreator' 'qbs')
depends=('python2-beautifulsoup4' 'qt5-tools' 'qt5-declarative' 'qt5-script' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-webengine' 'clang' 'llvm')
install=qtcreator-prerelease.install
optdepends=('qbs'
            'qt5-doc: integrated Qt documentation'
            'qt5-examples: welcome page examples'
            'qt5-translations: for other languages'
            'gdb: debugger'
            'cmake: cmake project support'
            'openssh-askpass: ssh support'
            'git: git support'
            'mercurial: mercurial support'
            'bzr: bazaar support'
            'valgrind: analyze support')
makedepends=('qbs' 'clang' 'qt5-base')
source=("${_urlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_filename}.tar.xz")
sha256sums=('6a71bc11aeee5d1f09eff3699e3c2ecf66cab74b08683c84702e4450a4e0c8f4')

_qmake_cmd=qmake
_tmp_dir=$(mktemp -d)
_qbs_settings="--settings-dir ${_tmp_dir}"
_qbs_profile="sysqtprofile"
_qbs_args="profile:${_qbs_profile}"

if [[ -z ${startdir} ]]; then
  _building=false
fi

prepare() {
  cd ${srcdir}/${_filename}
  sed -i '/LLVM_INCLUDEPATH/d' src/tools/clangbackend/clangbackend.pro
}

build() {
  export PATH=${startdir}:$PATH
  set -o nounset
  local _src_dir=${srcdir}/${_filename}
  [[ -d build ]] && rm -r build

  cd ${_src_dir}
  qmake -spec linux-clang
  make

  #qbs ${_qbs_settings} -d build -f ${src_dir} --all-products project.withAutotests:false profile:${_qbs_profile} config:release
  set +o nounset
}

package() {
  set -o nounset
  local _src_dir=${srcdir}/${_filename}
  local _pkg_dir=${pkgdir}/usr/

  #qbs install ${_qbs_settings} -d build -f ${_src_dir} --install-root ${_pkg_dir} --all-products project.withAutotests:false profile:${_qbs_profile} config:release
  cd ${_src_dir}
  INSTALL_ROOT=${_pkg_dir} make install

  # Workaround for FS#40583
  mv "${pkgdir}"/usr/bin/qtcreator "${pkgdir}"/usr/bin/qtcreator-bin
  echo "#!/bin/sh" > "${pkgdir}"/usr/bin/qtcreator
  echo "QT_LOGGING_TO_CONSOLE=1 qtcreator-bin \$@" >> "${pkgdir}"/usr/bin/qtcreator
  chmod +x "${pkgdir}"/usr/bin/qtcreator

  install -Dm644 ${srcdir}/${_filename}/LICENSE.GPL3-EXCEPT ${pkgdir}/usr/share/licenses/qtcreator/LICENSE.GPL3-EXCEPT
  rm -Rf ${_tmp_dir}
  set +o nounset
}

#if $_building; then
#  qbs setup-qt ${_qbs_settings} /usr/bin/qmake ${_qbs_profile}
#fi
