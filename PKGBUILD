# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Kyle Keen <keenerd@gmail.com>

_pkgname='solvespace'
pkgname="${_pkgname}-git"
pkgver=r1579.c514dda
pkgrel=2
pkgdesc='Parametric 2d/3d CAD'
arch=('x86_64')
url='https://solvespace.com'
_url_source='https://github.com/solvespace/solvespace'
license=('GPL3')
depends=('gtkmm3' 'libspnav')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${_url_source}.git"
        "git+${_url_source%/*}/angle.git"
        "git+${_url_source%/*}/cairo.git"
        "git+https://github.com/google/flatbuffers.git"
        "git+https://git.savannah.nongnu.org/r/freetype/freetype2.git"
        "git+${_url_source%/*}/libdxfrw.git"
        "git+https://github.com/glennrp/libpng.git"
        "git+https://github.com/microsoft/mimalloc.git"
        "git+${_url_source%/*}/pixman.git"
        "git+https://github.com/q3k/q3d.git"
        "git+https://github.com/madler/zlib.git")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "${_pkgname}"
  # Submodule list: https://github.com/solvespace/solvespace/raw/master/.gitmodules
  git submodule init
  git config submodule.extlib/angle.url "${srcdir}/angle"
  git config submodule.extlib/cairo.url "${srcdir}/cairo"
  git config submodule.extlib/flatbuffers.url "${srcdir}/flatbuffers"
  git config submodule.extlib/freetype.url "${srcdir}/freetype2"
  git config submodule.extlib/libdxfrw.url "${srcdir}/libdxfrw"
  git config submodule.extlib/libpng.url "${srcdir}/libpng"
  git config submodule.extlib/mimalloc.url "${srcdir}/mimalloc"
  git config submodule.extlib/pixman.url "${srcdir}/pixman"
  git config submodule.extlib/q3d.url "${srcdir}/q3d"
  git config submodule.extlib/zlib.url "${srcdir}/zlib"
  git submodule update
}

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" PREFIX="/usr" -C "build" install
  install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" "${_pkgname}/README.md"
}

# vim: ts=2 sw=2 et:
