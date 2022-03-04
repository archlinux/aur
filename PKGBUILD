# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_reponame=OsirisEdit
_pkgname="${_reponame,,}"
pkgname="${_pkgname}"
pkgver=1.1.0
pkgrel=1
pkgdesc="A wavetable editor for the Osiris Eurorack synthesizer module."
arch=('x86_64')
url="https://www.modbap.com/pages/osirisedit"
license=('GPL3')
depends=('gtk2' 'jansson' 'libsamplerate' 'libsndfile' 'sdl2')
makedepends=('git')
groups=('pro-audio')
source=("${_pkgname}::git+https://github.com/switchupcb/${_reponame}#tag=v${pkgver}"
        'imgui::git+https://github.com/AndrewBelt/imgui.git#commit=cfb1dd6'
        'lodepng::git+https://github.com/lvandeve/lodepng#commit=8a0f16a'
        'osdialog::git+https://github.com/AndrewBelt/osdialog#commit=e66caf0'
        'pffft::git+https://github.com/marton78/pffft#commit=c5062dc'
        'osirisedit-makefile-flags.patch')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '8b573b67aae5cf0375eede9d85356aef')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git submodule add -f "${srcdir}/imgui" ext/imgui
  git submodule add -f "${srcdir}/lodepng" ext/lodepng
  git submodule add -f "${srcdir}/osdialog" ext/osdialog
  git submodule add -f "${srcdir}/pffft" ext/pffft
  
  git submodule init
  git submodule update

  # Fix include and library paths for Linux using system libs
  patch -p1 -N -r - -i "${srcdir}"/osirisedit-makefile-flags.patch
  # Patch source for where OsirisEdit looks for images
  sed -i -E -e 's|([-a-z]+\.png)|/usr/share/'${_pkgname}'/images/\1|' src/ui.cpp
  # Patch source for where OsirisEdit looks for fonts
  sed -i -e 's|"fonts/|"/usr/share/'${_pkgname}'/fonts/|' src/ui.cpp
  # Patch source for where OsirisEdit looks for the manual PDF
  sed -i -e 's|"manual\.pdf"|"/usr/share/doc/'${_pkgname}'/manual.pdf"|' src/ui.cpp
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -vDm 755 OsirisEdit -t "${pkgdir}"/usr/bin
  install -vDm 644 logo-*.png -t "${pkgdir}"/usr/share/${_pkgname}/images
  install -vDm 644 fonts/*.ttf -t "${pkgdir}"/usr/share/${_pkgname}/fonts
  ln -sf OsirisEdit "${pkgdir}"/usr/bin/osirisedit

  install -vDm644 doc/*.{html,pdf,woff} -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 doc/images/*.png -t "${pkgdir}/usr/share/doc/${_pkgname}/images"
  # used by manual.html, but not really important
  #install -vDm644 doc/Montserrat/*.ttf -t "${pkgdir}/usr/share/doc/${_pkgname}/Montserrat"
}
