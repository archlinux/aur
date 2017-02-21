# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=glcapsviewer-git
pkgver=r118.fb53d2c
pkgrel=1
pkgdesc='OpenGL Hardware Capability Viewer'
url='http://www.saschawillems.de/?page_id=771/'
arch=('i686' 'x86_64')
license=('GPL3')
source=('git+https://github.com/SaschaWillems/glCapsViewer'
        'https://github.com/SaschaWillems/glCapsViewer/pull/15.patch'
        'add_x11_library.patch'
        'glcapsviewer.desktop'
        'glcapsviewer')
sha256sums=('SKIP'
            '1bbc59c259e18a550d788688be7a731e1f379ee08902759cf3e802123b745493'
            '0d622a96a3bf458726e94cb7a3125dd97db9edd7665a1c4277904f350d3335e4'
            '3ff750cda95917ff93388dd373437b12129427bc33e52343247bf69bf1d24c02'
            '139ceb073a34bea5450ca2b6d7f50523f8986d9f5a6b069d36cf05d03609f352')
makedepends=('git' 'cmake' 'boost')
depends=('glew' 'glfw' 'qt5-base')

pkgver() {
  cd "$srcdir"/glCapsViewer
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/glCapsViewer

  patch -p1 -i "$srcdir"/15.patch
  patch -p1 -i "$srcdir"/add_x11_library.patch
}

package() {

  cd "$srcdir"/glCapsViewer
  cmake .
  cmake --build .

  install -dm755 "$pkgdir"/opt/glcapsviewer
  install -m755 "$srcdir"/glCapsViewer/glcapsviewer "$pkgdir"/opt/glcapsviewer/glcapsviewer
  install -m644 "$srcdir"/glCapsViewer/capslist.xml "$pkgdir"/opt/glcapsviewer/capslist.xml
  install -m644 "$srcdir"/glCapsViewer/enumList.xml "$pkgdir"/opt/glcapsviewer/enumList.xml

  install -dm755 "$pkgdir"/usr/bin
  install -m755 "$srcdir"/glcapsviewer "$pkgdir"/usr/bin/glcapsviewer

  install -dm755 "$pkgdir"/usr/share/applications
  install -m644 "$srcdir"/glcapsviewer.desktop "$pkgdir"/usr/share/applications/glcapsviewer.desktop
}
