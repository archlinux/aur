# Maintainer: Donald Carr<sirspudd@gmail.com>

#set -o errexit
#set -o xtrace

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
_building=true
pkgname=qtcreator-prerelease
_pkgvermajmin=11.0
_pkgver=${_pkgvermajmin}.0
_verpostfix="beta2"
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
conflicts=('qtcreator' 'litehtml')
depends=('python-beautifulsoup4' 'qt6-base' 'qt6-tools' 'qt6-declarative' 'qt6-quickcontrols2' 'clang' 'llvm' 'lld')
install=qtcreator-prerelease.install
optdepends=('qt6-doc: integrated Qt documentation'
            'qt6-examples: welcome page examples'
            'qt6-translations: for other languages'
            'gdb: debugger'
            'cmake: cmake project support'
            'openssh-askpass: ssh support'
            'git: git support'
            'mercurial: mercurial support'
            'bzr: bazaar support'
            'valgrind: analyze support')
makedepends=('clang' 'qt6-base' 'patchelf')
source=("${_urlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_source_archive_name}.tar.xz")
sha512sums=('26178a3962d266a6b202fc76bd7472d3b7da891097149dde3311a34f28c70c21891245cbe3437ea8cdf1085b462ab2ec2348ee694e513c669e999404145f6079')

prepare() {
  local working_dir=${srcdir}/${_source_archive_name}
  cd ${working_dir}
}

build() {
	local working_dir=${srcdir}/${_source_archive_name}
	local build_dir=${working_dir}/build

	rm -Rf ${build_dir}
	mkdir -p ${build_dir}
	cd ${build_dir}

	qt_cmake_in_play=$(which qt-cmake || echo /usr/lib/qt6/bin/qt-cmake)
	echo "Using qt-cmake: ${qt_cmake_in_play}"

	${qt_cmake_in_play} \
	-G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DQT_CHAINLOAD_TOOLCHAIN_FILE=${startdir}/toolchain.cmake \
	-DCMAKE_BUILD_TYPE=Release \
	-DWITH_DOCS=ON \
	-DBUILD_QBS=OFF \
	-DBUILD_WITH_CRASHPAD=OFF \
	${working_dir}

	ninja all
}

package() {
  local working_dir=${srcdir}/${_source_archive_name}
  local build_dir=${working_dir}/build

  cd ${build_dir}
  DESTDIR=${pkgdir} ninja install
}
