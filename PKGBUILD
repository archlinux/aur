# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_reponame=WaveEdit
_pkgname="${_reponame,,}"
pkgname="${_pkgname}-git"
pkgver=1.1.r0.gf699e1a
pkgrel=1
pkgdesc="A wavetable editor for the E370 and E352 Eurorack synthesizer modules (git version)"
arch=('x86_64')
url="https://github.com/AndrewBelt/${_reponame}"
license=('GPL3')
depends=('gtk2' 'jansson' 'libsamplerate' 'libsndfile' 'sdl2')
makedepends=('git')
#optdepends=()
groups=('pro-audio')
provides=("${_pkgname}" "${_pkgname}=${pkgver//.r*/}" "${_pkgname//-/.}")
conflicts=("${_pkgname}" "${_pkgname//-/.}")
source=("${_pkgname}::git+https://github.com/AndrewBelt/${_reponame}.git"
        'imgui::git+https://github.com/AndrewBelt/imgui.git'
        'lodepng::git+https://github.com/lvandeve/lodepng.git'
        'osdialog::git+https://github.com/AndrewBelt/osdialog.git'
        'pffft::git+https://github.com/marton78/pffft.git'
        'waveedit-makefile-flags.patch')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'd13b1f10a705803cbc8a24b87247ed60')


pkgver() {
  cd "${srcdir}/${_pkgname}"

  (
    set -o pipefail
    git describe --long --tags 2>/dev/null | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule init
  git config submodule.imgui.url "${srcdir}/imgui"
  git config submodule.lodepng.url "${srcdir}/lodepng"
  git config submodule.osdialog.url "${srcdir}/osdialog"
  git config submodule.pfft.url "${srcdir}/pfft"
  git submodule update

  # Fix include and library paths for Linux using system libs
  patch -p1 -N -r - -i "${srcdir}"/waveedit-makefile-flags.patch
  # Patch source for where WaveEdit looks for images
  sed -i -E -e 's|([-a-z]+\.png)|/usr/share/'${_pkgname}'/images/\1|' src/ui.cpp
  # Patch source for where WaveEdit looks for fonts
  sed -i -e 's|"fonts/|"/usr/share/'${_pkgname}'/fonts/|' src/ui.cpp
  # Patch source for where WaveEdit looks for the manual PDF
  sed -i -e 's|"manual\.pdf"|"/usr/share/doc/'${pkgname}'/manual.pdf"|' src/ui.cpp
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -vDm 755 WaveEdit -t "${pkgdir}"/usr/bin
  install -vDm 644 logo-*.png -t "${pkgdir}"/usr/share/${_pkgname}/images
  install -vDm 644 fonts/*.ttf -t "${pkgdir}"/usr/share/${_pkgname}/fonts
  ln -sf WaveEdit "${pkgdir}"/usr/bin/waveedit

  install -vDm644 doc/*.{html,pdf,woff} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm644 doc/images/*.png -t "${pkgdir}/usr/share/doc/${pkgname}/images"
  # used by manual.html, but not really important
  #install -vDm644 doc/Montserrat/*.ttf -t "${pkgdir}/usr/share/doc/${pkgname}/Montserrat"
}
