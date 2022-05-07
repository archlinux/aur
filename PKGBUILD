# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=jasper-git
pkgname=('jasper-git' 'jasper-doc-git')
pkgver=3.0.3.r6.g411571c
pkgrel=2
pkgdesc='Implementation of the JPEG-2000 Part-1 standard codec (git version)'
url='https://www.ece.uvic.ca/~mdadams/jasper/'
arch=('x86_64')
license=('custom:JasPer2.0')
makedepends=('git' 'glibc' 'libjpeg' 'libheif' 'freeglut' 'glu' 'cmake'
             'doxygen'
             'texlive-bin' 'texlive-core' 'texlive-latexextra'
             'biber' 'texlive-bibtexextra' 'texlive-pictures' 
             'texlive-fontsextra' 'texlive-formatsextra' 'texlive-pstricks' 
             'texlive-games' 'texlive-humanities' 'texlive-science'
             'ghostscript' 'plantuml')
options=('staticlibs')
source=("${pkgbase%-git}::git+https://github.com/jasper-software/jasper.git")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgbase%-git}"

  # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
  local _gitversion=$(git describe --long --tags --match 'version-[0-9].[0-9.][0-9.]*' | sed -e 's|^version-||' | tr '[:upper:]' '[:lower:]') 

  # Format git-based version for pkgver
  echo "${_gitversion}" | sed \
    -e 's|^\([0-9]\.[0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
    -e 's|\([0-9]\+-g\)|r\1|' \
    -e 's|-|.|g'
}

build() {
  cd "${pkgbase%-git}"

  # Sourcing JRE in case it was just installed
  local jre_profile='/etc/profile.d/jre.sh'
  if [ -x "${jre_profile}" ]; then
    source "${jre_profile}"
  fi

  local options=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects"
    -DJAS_ENABLE_LIBJPEG=ON
    -DJAS_ENABLE_LIBHEIF=ON
    -DJAS_ENABLE_OPENGL=ON
    -DJAS_ENABLE_HIDDEN=OFF
  )

  printf "\nConfiguring build for static lib...\n"
  cmake \
    -B build-static \
    "${options[@]}" \
    -DJAS_ENABLE_SHARED=OFF \
    -DJAS_ENABLE_DOC=OFF \
    -DJAS_ENABLE_LATEX=OFF \
    -DJAS_ENABLE_PROGRAMS=OFF
  printf "\nBuilding static lib...\n"
  make -C build-static

  printf "\nConfiguring build for shared lib...\n"
  cmake \
    -B build-shared \
    "${options[@]}" \
    -DJAS_ENABLE_SHARED=ON \
    -DJAS_ENABLE_DOC=ON \
    -DJAS_ENABLE_LATEX=ON \
    -DJAS_ENABLE_PROGRAMS=ON
  printf "\nRefreshing doc/Doxyfile...\n"
  doxygen -u build-shared/doc/Doxyfile
  printf "\nBuilding shared lib...\n"
  make -j1 -C build-shared
}

check() {
  cd "${pkgbase%-git}/build-shared"
  ctest --parallel 1 --output-on-failure
}

package_jasper-git() {
  depends=('glibc' 'libjpeg' 'libheif')
  optdepends=('jasper-doc-git: documentation'
              'freeglut: jiv support'
              'glu: jiv support')
  provides=("${pkgname%-git}=${pkgver}" 'libjasper.so')
  conflicts=("${pkgname%-git}")

  cd "${pkgbase%-git}"
  make -C build-static DESTDIR="${pkgdir}" install
  make -C build-shared DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -r "${pkgdir}/usr/share/doc"
}

package_jasper-doc-git() {
  pkgdesc+=' (documentation)'
  arch=('any')
  optdepends=('jasper-git')
  provides=("${pkgname%-git}=${pkgver}")
  conflicts=("${pkgname%-git}")

  cd "${pkgbase%-git}"
  make -C build-shared DESTDIR="${pkgdir}" install
  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -rf "${pkgdir}/usr/"{bin,include,lib,share/man}
}
