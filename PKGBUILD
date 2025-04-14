# Maintainer: Hammer <topo20@protonmail.com>

pkgname=texmacs-guile3-git
_pkgname=texmacs
pkgver=2.1.4_r13833.77970d811
pkgrel=1
pkgdesc="Free scientific text editor, inspired by TeX and GNU Emacs. WYSIWYG
editor and CAS-interface. Pulled from github.com/hammerfunctor/texmacs"
arch=('x86_64')
url="http://www.texmacs.org/"
license=('GPL3')
depends=('perl' 'guile' 'texlive-basic' 'python' 'libxext' 'freetype2'
	 'qt6-svg' 'hicolor-icon-theme' 'gawk')
optdepends=('transfig: convert images using fig2ps'
            'ghostscript: rendering ps files'
            'imagemagick: convert images'
            'aspell: spell checking'
            'inkscape: svg convertion'
            'python-lxml: inkscape editting')
makedepends=('ghostscript' 'cmake' 'git' 'gcc')
#_commit=75ff838984008e545b07f7c4d21cf25f1ff77137
#source=("${_pkgname}::git+https://github.com/hammerfunctor/texmacs#commit=$_commit")
#sha256sums=('19238e3d8d4b5894b8c9752b1f530a6be4a1d517000c85dc6c4efb4969e0b945')
source=("${_pkgname}::git+https://github.com/hammerfunctor/texmacs")
sha256sums=('SKIP')
options=('!emptydirs')
provides=('texmacs')
conflicts=('texmacs')
LANG=C

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s.%s.%s_r%s.%s" \
         $(awk -F '\"' '/set \(VERSION_MAJOR / {print $2}' CMakeLists.txt) \
         $(awk -F '\"' '/set \(VERSION_MINOR / {print $2}' CMakeLists.txt) \
         $(awk -F '\"' '/set \(VERSION_BUILD / {print $2}' CMakeLists.txt) \
         $(git rev-list --count HEAD) \
         $(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  #sed -e 's/-Wno-deprecated-register//' -i src/CMakeLists.txt # Remove wrong flag on Linux

  # replace function (... start end . delta) by (range-list*-1 start end . delta) to supress warning
  for f in $(grep -l "(\\.\\.\\." $(find . -iname "*.scm")); do
    sed -i -e "s/(\\.\\.\\./(range-list*-1/" $f
  done

  for f in ../../*.patch; do
    git apply < $f
  done
}

build() {
  cd "${srcdir}/${_pkgname}"

  #export CC=/usr/bin/clang
  #export CXX=/usr/bin/clang++
  cmake -Bbuild \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_PRIO_GUILE3=YES
  cd build && make -j8
}

package() {
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="$pkgdir" install
  # fix the KDE/plasma on wayland clipboard bug
  sed -i '$ s/texmacs.bin/texmacs.bin $([[ $XDG_CURRENT_DESKTOP == KDE ]] \&\& [[ $XDG_SESSION_TYPE == wayland ]] \&\& echo -platform wayland)/g' "$pkgdir"/usr/bin/texmacs

  # fix fig2ps script
  #sed -i 's|${prefix}|/usr|' "$pkgdir"/usr/bin/fig2ps
  # fix FS#37518
  #sed -i '/^Path=/d' "$pkgdir"/usr/share/applications/texmacs.desktop
}

# vim:set ts=2 sw=2 et:
