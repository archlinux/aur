# Maintainer: Sławomir Śpiewak <slawekwaga@gmail.com>
# Contributor: Difarem <difarem@gmail.com>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Xyne
# Contributor: Scott Garrett <Wintervenom@archlinux.us>
# Contributor: Thomas Dziedzic

_name=lmms
pkgname=lmms-git
pkgver=1.3.0.alpha.1.r857.gbbdfeff5e
pkgrel=2
pkgdesc='The Linux MultiMedia Studio.'
arch=('x86_64')
url="https://lmms.io"
license=('GPL2')
depends=('fftw' 'fltk' 'fluidsynth' 'lame' 'libgig' 'qt5-x11extras' 'sdl2'
'stk')
optdepends=('pulseaudio: pulseaudio support'
            'wine: VST plugin support'
            'carla: carla support')
makedepends=('cmake' 'doxygen' 'extra-cmake-modules' 'freetype2' 'git'
'ladspa' 'qt5-tools' 'wine' 'perl-list-moreutils' 'perl-xml-parser')
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
  git -c protocol.file.allow=always submodule update
  # setting lib dir
  sed -e 's|lib64|lib|g' -i cmake/modules/DetectMachine.cmake
  sed -e 's/\(${BASHCOMP_USER\)/\1/g' -i cmake/modules/BashCompletion.cmake
}

build() {
  #echo "Done"
  cd "${_name}/build"
  # TODO: Remove CMAKE_POLICY_VERSION_MINIMUM from here once qt5-x11embed PR#7 is merged.
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DWANT_QT5=ON \
        -DWANT_SOUNDIO=OFF \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_MODULE_PATH=/usr/share/ECM/find-modules \
        -DCMAKE_PREFIX_PATH=/usr/include/wine/windows \
        -DWINE_INCLUDE_DIR=/usr/include/wine/windows \
        -DWINE_LIBRARY=/usr/lib32/wine \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        ..
  #actually aknowledge other defaults
  cmake --build .
}

package() {
  cd "${_name}/build"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
