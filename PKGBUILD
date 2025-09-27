# Maintainer: Nils Nolde <nilsnolde+aur@proton.me>
# Contributor: Nils Nolde <nilsnolde+aur@proton.me>
# mostly based on https://aur.archlinux.org/packages/valhalla

pkgname=valhalla-git
_pkgname=${pkgname%-git}
### will be updated by GHA/sed ###
pkgver=3.5.1.r244.b74c857
_git_commit=b74c857d0fc9b19bd32c5840e6b736dab17f50b0
#########################
pkgrel=1
pkgdesc="Routing engine for OpenStreetMap."
arch=('x86_64' 'aarch64')
url="https://github.com/valhalla/valhalla"
license=('MIT')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=('prime_server' 'protobuf' 'python' 'libspatialite' 'luajit' 'chrono-date' 'gdal' 'python-lz4' 'python-shapely')
makedepends=('cmake' 'git' 'vim' 'jq' 'boost' 'cxxopts' 'libosmium' 'unordered_dense')
checkdepends=('spatialite-tools' 'unzip' 'curl' 'jq')
source=("valhalla-git::git+${url}.git#commit=${_git_commit}")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive

  cmake -S. -Bbuild \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS}" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS}" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_DATA_TOOLS=On \
    -DENABLE_PYTHON_BINDINGS=On \
    -DENABLE_SERVICES=On \
    -DENABLE_CCACHE=On \
    -DENABLE_HTTP=On \
    -DENABLE_SINGLE_FILES_WERROR=Off \
    -DENABLE_WERROR=Off \
    -DBUILD_SHARED_LIBS=On \
    -DPREFER_EXTERNAL_DEPS=ON \
    -DVALHALLA_VERSION_MODIFIER=${_git_commit} \
    -DENABLE_TESTS=ON
}

# this is done inside GHA
# pkgver() {
#   cd "${pkgname}"
#   # e.g. 3.5.1.r199.3226974 (version.distance_from_last_tag.git_hash)
#   printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//g')"
# }

build() {
  make -C "${pkgname}/build"
}

check() {
  "${pkgname}/build/valhalla_build_tiles" -h
  "${pkgname}/build/valhalla_service" -h
  make -C "${pkgname}/build" run-python_valhalla
}

package() {
  cd "$pkgname"
  make -C build DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/share/doc/"{libvalhalla-dev,libvalhalla0,python-valhalla}
  rm -rf "$pkgdir/usr/share/doc/valhalla/"{README_python.md,contributing.md,index.md}

  install -Dm644 COPYING README.md CHANGELOG.md -t "$pkgdir/usr/share/licenses/${pkgname}"
  cp -a docs/docs/* "$pkgdir/usr/share/doc/${_pkgname}/"
}
