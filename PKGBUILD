# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=glcapsviewer-git
pkgver=r139.eb621b2
pkgrel=2
pkgdesc='OpenGL Hardware Capability Viewer'
url='https://opengl.gpuinfo.org/'
arch=('i686' 'x86_64')
license=('GPL3')
source=('git+https://github.com/SaschaWillems/glCapsViewer'
        'https://github.com/SaschaWillems/glCapsViewer/pull/15.patch'
        'glfw-init-platform.patch'
        'glcapsviewer.desktop')
sha256sums=('SKIP'
            '1bbc59c259e18a550d788688be7a731e1f379ee08902759cf3e802123b745493'
            'b8ed176e8fb2193012f9b7044d225d82802d4f0d06877753939eec6947cd1826'
            '3ff750cda95917ff93388dd373437b12129427bc33e52343247bf69bf1d24c02')
makedepends=('git' 'cmake')
depends=('glew' 'glfw' 'qt5-base')

pkgver() {
  cd "$srcdir"/glCapsViewer
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/glCapsViewer

  patch -p0 -i "$srcdir"/glfw-init-platform.patch
  patch -p1 -i "$srcdir"/15.patch
}

package() {

  cd "$srcdir"/glCapsViewer
  cmake . -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cmake --build .


  install -dm755 "$pkgdir"/usr/bin
  install -m755 "$srcdir"/glCapsViewer/glcapsviewer "$pkgdir"/usr/bin/glcapsviewer

  install -dm755 "$pkgdir"/usr/share/applications
  install -m644 "$srcdir"/glcapsviewer.desktop "$pkgdir"/usr/share/applications/glcapsviewer.desktop
}
