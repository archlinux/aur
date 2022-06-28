# Maintainer: Joe Baldino <pedanticdm@gmx.us>
# Contributorr: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=nyble
pkgver=0.5.0
pkgrel=3
pkgdesc='A snake game for the terminal'
arch=('x86_64')
url='https://octobanana.com/software/nyble'
license=('MIT')
depends=('boost-libs' 'mpfr')
makedepends=('boost' 'cmake')

_patch='include-optional-in-lispp.diff'
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/octobanana/${pkgname}/archive/${pkgver}.tar.gz"
        "${_patch}")
sha256sums=('c05b842fa7cae9def06e6916690e12be249ad584d195c3fdc1f56d44bb87a47e'
            'SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 -i "${srcdir}/${_patch}"
}

build() {
  CFLAGS="${CFLAGS} -DNDEBUG" CXXFLAGS="${CXXFLAGS} -DNDEBUG" \
  cmake -B build -S "${pkgname}-${pkgver}" \
    -DCMAKE_SKIP_RPATH="TRUE" \
    -DCMAKE_BUILD_TYPE="None" \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/"{README.md,doc/help.txt}
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${pkgname}-${pkgver}/LICENSE"
}
