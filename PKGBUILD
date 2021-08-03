# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# A minimal version of tageditor which has only the CLI enabled and no JSON export
# by default.

# whether the experimental JSON export is enabled: ON or OFF
_json_export=${TAGEDITOR_JSON_EXPORT:-OFF}

_reponame=tageditor
pkgname=tageditor-cli
pkgver=3.4.2
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='A tag editor with command-line interface supporting MP4/M4A/AAC (iTunes), ID3, Vorbis, Opus, FLAC and Matroska (GUI disabled)'
license=('GPL')
depends=('c++utilities' 'tagparser')
makedepends=('cmake' 'ninja')
conflicts=("${pkgname%-cli}")
provides=("${pkgname%-cli}")
[[ $_json_export == ON ]] && makedepends+=('reflective-rapidjson')
checkdepends=('cppunit')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('43029df40c53122a6dd5b0c986bf53945bf492d30904d3d4d723b1936b0cbdd4')

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DWIDGETS_GUI=OFF \
    -DQUICK_GUI=OFF \
    -DENABLE_JSON_EXPORT="${_json_export}" \
    -DREFLECTION_GENERATOR_EXECUTABLE:FILEPATH='/usr/bin/reflective_rapidjson_generator' \
    .
  ninja
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  if [[ $TEST_FILE_PATH ]]; then
    ninja check
  else
    msg2 'Skipping execution of testsuite because the environment variable TEST_FILE_PATH is not set.'
  fi
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install
}
