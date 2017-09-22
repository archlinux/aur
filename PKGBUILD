# $Id$
# Maintainer: Lukas Sabota <lukas@lwsabota.com>
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Denis A. Altoe Falqueto <denisfalqueto@gmail.com>

_gitname=projectm
pkgbase=projectm-git
pkgname=('projectm-git' 'projectm-libvisual-git' 'projectm-pulseaudio-git' 'projectm-qt-git' 'projectm-test-git' 'projectm-jack-git')
pkgver=1392.b6e7beae
pkgrel=1
arch=('x86_64' 'i686')
url='http://projectm.sourceforge.net/'
license=('LGPL')
makedepends=('mesa-libgl' 'qt4' 'cmake' 'ftgl' 'glew' 'gtkglext' 'libvisual' 'sdl' 'libxext' 'pulseaudio' 'jack')
source=("git+https://github.com/projectM-visualizer/${_gitname}.git"
		'projectm-install-vera-ttf.patch')
sha256sums=('SKIP'
            '2b9805e80ba459b9ba9622cf524a8b97c1f45ada839dd29b19d9df0a7bdd5a64')

pkgver() {
  cd "${_gitname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${_gitname}"

  patch -p1 -i ../projectm-install-vera-ttf.patch
#  sed 's/projectM_isnan/std::isnan/g' -i src/libprojectM/Renderer/BeatDetect.cpp 
}

build() {
  mkdir -p build
  cd build
  cmake \
    -Wno-dev \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
	-DINCLUDE-PROJECTM-LIBVISUAL=ON \
	-DINCLUDE-PROJECTM-QT=ON \
	-DINCLUDE-PROJECTM-TEST=ON \
	-DINCLUDE-PROJECTM-PULSEAUDIO=ON \
    -DINCLUDE-PROJECTM-JACK=ON \
    "../${_gitname}"
  make
}

package_projectm-git() {
  pkgdesc='Music visualizer which uses 3D accelerated iterative image based rendering (git version)'
  depends=('ftgl' 'glew' 'libgl')
  conflicts=('projectm')
  provides=('projectm')
  DESTDIR="$pkgdir" make -C "build/src/NativePresets" install
  DESTDIR="$pkgdir" make -C "build/src/libprojectM" install
  DESTDIR="$pkgdir" install -Dm644 "${srcdir}/${_gitname}/src/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_projectm-libvisual-git() {
  pkgdesc='ProjectM plugin for XMMS (git version)'
  depends=('projectm' 'libvisual' 'gcc-libs')
  provides=('libvisual-projectm' 'projectm-libvisual')
  conflicts=('projectm-libvisual')
  DESTDIR="$pkgdir" make -C "build/src/projectM-libvisual" install
  DESTDIR="$pkgdir" install -Dm644 "${srcdir}/${_gitname}/src/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_projectm-pulseaudio-git() {
  pkgdesc='ProjectM support for Pulseaudio (git version)'
  depends=('projectm-qt' 'pulseaudio')
  conflicts=('projectm-pulseaudio')
  provides=('projectm-pulseaudio')
  DESTDIR="$pkgdir" make -C "$srcdir/build/src/projectM-pulseaudio" install
  DESTDIR="$pkgdir" install -Dm644 "${srcdir}/${_gitname}/src/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_projectm-jack-git() {
  pkgdesc='ProjectM support for Jack (git version)'
  depends=('projectm-qt' 'jack')
  conflicts=('projectm-jack')
  provides=('projectm-jack')
  DESTDIR="$pkgdir" make -C "$srcdir/build/src/projectM-jack" install
  DESTDIR="$pkgdir" install -Dm644 "${srcdir}/${_gitname}/src/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_projectm-qt-git() {
  pkgdesc='Qt bindings for ProjectM (git version)'
  depends=('projectm' 'qt4' 'libgl')
  conflicts=('projectm-qt')
  provides=('projectm-qt')
  DESTDIR="$pkgdir" make -C "$srcdir/build/src/projectM-qt" install
  DESTDIR="$pkgdir" install -Dm644 "${srcdir}/${_gitname}/src/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_projectm-test-git() {
  pkgdesc='ProjectM test applications (git version)'
  depends=('projectm' 'sdl' 'libgl')
  conflicts=('projectm-test')
  provides=('projectm-test')
  DESTDIR="$pkgdir" make -C "$srcdir/build/src/projectM-test" install
  DESTDIR="$pkgdir" install -Dm644 "${srcdir}/${_gitname}/src/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
