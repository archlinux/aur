# Maintainer: Yurii Kolesnykov <root@yurikoles.com>

_pkgname=libsolv
pkgname="${_pkgname}-git"
pkgver=0.7.15.r0.g1b6c40ba
pkgrel=2
pkgdesc='Library for solving packages and reading repositories'
arch=('x86_64')
url="https://github.com/openSUSE/${_pkgname}"
license=('BSD')
depends=(
  'rpm-tools'
  'zchunk'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'perl'
  'python'
  'ruby'
  'swig'
)
optdepends=(
  'perl: for perl bindings'
  'python: for python bindings'
  'ruby: for ruby bindings'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+https://github.com/openSUSE/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  rm -rf build
}

build() {
  cmake \
    -B build \
    -S "${pkgname}" \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_FLAGS="$CFLAGS $CPPFLAGS" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DUSE_VENDORDIRS=ON \
    -DARCHLINUX=1 \
    -DENABLE_APPDATA=ON \
    -DENABLE_ARCHREPO=ON \
    -DENABLE_BZIP2_COMPRESSION=ON \
    -DENABLE_COMPLEX_DEPS=1 \
    -DENABLE_COMPS=ON \
    -DENABLE_CONDA=ON \
    -DENABLE_CUDFREPO=ON \
    -DENABLE_DEBIAN=ON \
    -DENABLE_HAIKU=OFF \
    -DENABLE_HELIXREPO=ON \
    -DENABLE_LZMA_COMPRESSION=ON \
    -DENABLE_MDKREPO=ON \
    -DENABLE_PERL=ON \
    -DENABLE_PUBKEY=ON \
    -DENABLE_PYTHON=0 \
    -DENABLE_PYTHON3=1 \
    -DENABLE_RPMDB=ON \
    -DENABLE_RPMDB_BYRPMHEADER=ON \
    -DENABLE_RPMDB_LIBRPM=ON \
    -DENABLE_RPMMD=ON \
    -DENABLE_RPMPKG=ON \
    -DENABLE_RUBY=ON \
    -DENABLE_SUSEREPO=ON \
    -DENABLE_TCL=OFF \
    -DENABLE_ZCHUNK_COMPRESSION=ON \
    -DWITH_SYSTEM_ZCHUNK=ON \
    -DENABLE_ZSTD_COMPRESSION=ON \
    -DMULTI_SEMANTICS=ON \
    -DWITH_LIBXML2=OFF \

  cmake --build build
}

check() {
  ARGS="-V" cmake --test build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dp -m644 "${pkgname}"/LICENSE.BSD  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD"
  install -Dp -m644 "${pkgname}"/README       "${pkgdir}/usr/share/doc/${pkgname}/README"
}
