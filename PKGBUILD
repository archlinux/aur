# Maintainer: Donald Carr<sirspudd@gmail.com>

#set -o errexit
#set -o xtrace

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
_building=true
pkgname=qtcreator-prerelease
_pkgvermajmin=7.0
_pkgver=${_pkgvermajmin}.1
_verpostfix=""
pkgver="${_pkgver}${_verpostfix}"
pkgrel=1
_urlbase="https://download.qt.io/official_releases"
if [[ -n $_verpostfix ]]; then
  _pkgver=${_pkgver}-${_verpostfix}
  _urlbase="https://download.qt.io/development_releases"
fi
_source_archive_name=qt-creator-opensource-src-${_pkgver}
pkgdesc='Qt Creator prerelease/latest'
arch=('x86_64')
url='http://qt.io/ide'
license=('GPL')
provides=('qtcreator')
conflicts=('qtcreator')
depends=('python-beautifulsoup4' 'qt6-base' 'qt6-tools' 'qt6-declarative' 'qt6-quickcontrols2' 'clang' 'llvm' 'mold')
install=qtcreator-prerelease.install
optdepends=('qbs'
            'qt6-doc: integrated Qt documentation'
            'qt6-examples: welcome page examples'
            'qt6-translations: for other languages'
            'gdb: debugger'
            'cmake: cmake project support'
            'openssh-askpass: ssh support'
            'git: git support'
            'mercurial: mercurial support'
            'bzr: bazaar support'
            'valgrind: analyze support')
makedepends=('qbs' 'clang' 'qt6-base' 'patchelf')
source=("${_urlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_source_archive_name}.tar.xz")
sha512sums=('2b07260eaf7892d90c99b93e8a757c9847cd2f696a57c85db7c77ab1cc97d43dc323f6923721f0fd9099367a08a29d356f1da5d71764522f67e5d39cfdca98f6')

prepare() {
  local working_dir=${srcdir}/${_source_archive_name}
  cd ${working_dir}
}

build() {
  local working_dir=${srcdir}/${_source_archive_name}
  local build_dir=${working_dir}/build

  mkdir -p ${build_dir}
  cd ${build_dir}

  cmake -G Ninja \
    -DCMAKE_TOOLCHAIN_FILE=${startdir}/toolchain.cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release -DWITH_DOCS=ON -DBUILD_QBS=OFF -DBUILD_WITH_CRASHPAD=OFF \
    ${working_dir}

  ninja all
}

package() {
  local working_dir=${srcdir}/${_source_archive_name}
  local build_dir=${working_dir}/build

  cd ${build_dir}
  DESTDIR=${pkgdir} ninja install
}
