# Maintainer: Lili1228 <aur at lili dot lgbt>
# Contributor: orumin <dev@orum.in>

_pkgname=previous
pkgname="${_pkgname}"-svn
pkgver=r1466
pkgrel=1
pkgdesc='NeXTSTEP Emulator'
arch=('i686' 'x86_64' 'aarch64')
url='https://previous.unixdude.net/about.html'
license=('GPL-2.0-or-later')
depends=('hicolor-icon-theme' 'libpcap' 'libpng' 'sdl2' 'zlib' # explicit
'gcc-libs' 'glibc' 'readline') # implicit
makedepends=('subversion' 'cmake>=3.5')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$_pkgname::svn://svn.code.sf.net/p/previous/code/trunk"
        'http://galgot.free.fr/transit/PReV-icons-WOshad.zip'
        'previous-r1466-fix-build.patch'
        'previous.desktop')
sha512sums=('SKIP'
            '8fcb45edec5e186fc7c85a6c25f2ada11511403f3e173e04bba1e796978e2ecda6db56737f6e889ca05708a36e3626a6458e6cc57a0d6f8e98e2dfa3e2558469'
            'edc6364bb138dff502a7635f590e636289ccc1b507fd3b9b17771f34c6e4fe107ea027ebf9ed1cd5bd166c6210ad1341c23fd2682c4619a424ad3e0ab4d282f8'
            '92c166e19c9c6cb9a2560198879c3bcbc8b794760c801dbe375cd7990e372811daddd04e462e296e7b93c0e424c36fec05c020f6dc47c716f76535beab2fbbc7')

pkgver() {
  cd "$srcdir"/$_pkgname
  local ver
  ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $_pkgname
  sed -i '/Previous-icon\.bmp/d' src/CMakeLists.txt
  patch -p1 < ../previous-r1466-fix-build.patch
}

build() {
  cmake -S$_pkgname -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_RENDERING_THREAD=off
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build "${srcdir}"/build --target install
  install -Dm644 previous.desktop -t "${pkgdir}"/usr/share/applications
  for icon in "${srcdir}"/HighResOSX-WOshadow.iconset/*.png; do
    local size
    size="$(basename "${icon}" | sed -e 's/icon_//' -e 's/.png//')"
    mkdir -p "${pkgdir}"/usr/share/icons/hicolor/"${size}"/apps
    install -Dm644 "$icon" "${pkgdir}"/usr/share/icons/hicolor/"${size}"/apps/"${_pkgname}".png
  done
}

# vim:set ts=2 sw=2 et:
