#Maintainer: Yury Bobylev <bobilev_yury@mail.ru>
pkgname="mylibrary"
pkgver="4.2.2"
pkgrel="1"
pkgdesc="Home librarian"
arch=('x86_64')
provides=("${pkgname}")
source=("https://github.com/ProfessorNavigator/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
url="https://github.com/ProfessorNavigator/mylibrary"
license=('GPL-3.0-only')
makedepends=('cmake' 'pkgconf' 'gcc' 'doxygen' 'texlive-latex' 'texlive-latexrecommended' 'texlive-latexextra' 'texlive-plaingeneric' 'texlive-fontsrecommended' 'texlive-fontutils')
depends=('gtkmm-4.0' 'icu' 'libgcrypt' 'poppler' 'djvulibre' 'libarchive' 'imagemagick')
sha256sums=('b8aaedf6a5f0d7255866ca276eb8488500b1631a6511c165ed15adf2041f2334')

build() {   
   local cmake_options=(
    -B build
    -S $pkgname-$pkgver
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D USE_OPENMP=ON
    -D USE_PLUGINS=ON
    -D CREATE_HTML_DOCS_MLBOOKPROC=ON
    -D CREATE_PDF_DOCS_MLBOOKPROC=ON
    -D CREATE_HTML_DOCS_PLUGINIFC=ON
    -D CREATE_PDF_DOCS_PLUGINIFC=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build --target test
  cmake --build build --parallel $(nproc)
}

package() {
    DESTDIR=$pkgdir cmake --install build
    install -D -m644 "${pkgname}-${pkgver}/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
