# Maintainer: Difarem <difarem@gmail.com>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Xyne
# Contributor: Scott Garrett <Wintervenom@archlinux.us>
# Contributor: Thomas Dziedzic

_name=lmms
pkgname=lmms-git
pkgver=1.2.0.rc7.r9.g5c362e51a
pkgrel=1
pkgdesc='The Linux MultiMedia Studio.'
arch=('x86_64')
url="https://lmms.io"
license=('GPL2')
depends=('fftw' 'fltk' 'fluidsynth' 'lame' 'libgig' 'qt5-x11extras' 'sdl'
'stk')
optdepends=('pulseaudio: pulseaudio support'
            'wine: VST plugin support')
makedepends=('carla' 'cmake' 'doxygen' 'extra-cmake-modules' 'freetype2' 'git'
'ladspa' 'qt5-tools' 'wine')
provides=('lmms')
conflicts=('lmms')
source=("git+https://github.com/${_name}/${_name}.git"
        'git+https://github.com/Lukas-W/qt5-x11embed.git'
        'git+https://github.com/rampantpixels/rpmalloc.git')
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${_name}"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${_name}"
  mkdir -vp build
  git submodule init
  git config submodule.src/3rdparty/qt5-x11embed.url "${srcdir}/qt5-x11embed"
  git config submodule.src/3rdparty/rpmalloc.url "${srcdir}/rpmalloc"
  git submodule update
  # setting lib dir
  sed -e 's|lib64|lib|g' -i cmake/modules/DetectMachine.cmake
  # setting proper DESTDIR based install path for bash-completion
  sed -e 's/\(${BASHCOMP_USER\)/\\$DESTDIR\1/g' -i cmake/modules/BashCompletion.cmake
}

build() {
  cd "${_name}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DWANT_QT5=ON \
        -DWANT_SOUNDIO=OFF \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_MODULE_PATH=/usr/share/ECM/find-modules \
        -DCMAKE_PREFIX_PATH=/usr/include/wine/windows \
        -DWINE_INCLUDE_DIR=/usr/include/wine/windows \
        -DWINE_LIBRARY=/usr/lib32/wine \
        ..
  make
}

package() {
  cd "${_name}/build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
