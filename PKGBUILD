# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=glcapsviewer-git
pkgver=1.1
pkgrel=1
pkgdesc='OpenGL Hardware Capability Viewer'
url='http://www.saschawillems.de/?page_id=771/'
arch=('i686' 'x86_64')
license=('GPL3')
source=('git+https://github.com/SaschaWillems/glCapsViewer'
        'https://github.com/proudzhu/glCapsViewer/commit/45044a7a0c754d95f6ae9c63ff25b6b107878651.patch'
        'glcapsviewer.desktop')
sha256sums=('SKIP'
            'fe350e9391cf76ad18ddea4e04e4f9be86dd3375440a64216cf17fa092854248'
            'e9b0f64c620ccbaea7574d418cffa673c81b3e82d68a995e44158b0003a2211a')
makedepends=('git' 'cmake')
depends=('boost-libs' 'glew' 'glfw' 'qt5-base')

pkgver() {
  cd "$srcdir"/glCapsViewer
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/glCapsViewer

  patch -p1 -i "$srcdir"/45044a7a0c754d95f6ae9c63ff25b6b107878651.patch
}

package() {

  cd "$srcdir"/glCapsViewer
  cmake . -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir"
  cmake --build .

  install -dm755 "$pkgdir"/opt/glcapsviewer
  install -m755 "$srcdir"/glCapsViewer/glcapsviewer "$pkgdir"/opt/glcapsviewer/glcapsviewer
  install -m644 "$srcdir"/glCapsViewer/capslist.xml "$pkgdir"/opt/glcapsviewer/capslist.xml
  install -m644 "$srcdir"/glCapsViewer/enumList.xml "$pkgdir"/opt/glcapsviewer/enumList.xml

  install -dm755 "$pkgdir"/usr/share/applications
  install -m644 "$srcdir"/glcapsviewer.desktop "$pkgdir"/usr/share/applications/glcapsviewer.desktop
}
