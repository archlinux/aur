# Maintainer: Donald Carr<sirspudd@gmail.com>

#set -o errexit
#set -o xtrace

# Uncomment for a debug build
#_qmake_args="CONFIG+=debug"
_building=true
pkgname=qtcreator-prerelease
_pkgvermajmin=18.0
_pkgver=${_pkgvermajmin}.0
_verpostfix="beta1"
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
depends=('python-beautifulsoup4' 'qt6-base' 'qt6-tools' 'qt6-declarative' 'litehtml')
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
makedepends=('gcc' 'mold' 'qt6-base' 'patchelf' 'ninja')
source=("${_urlbase}/qtcreator/${_pkgvermajmin}/${_pkgver}/${_source_archive_name}.tar.xz")
sha512sums=('becd852fa360451104cdae31efd15a059747db1da0847f9c151790bacfbd1faed79f44de64d29f42416df5625a06edc12cbe2e2f5e2ccfeee8177af2e0d101da')

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
	-DWITH_QMLDESIGNER=OFF \
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
