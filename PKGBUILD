# Maintainer: Difarem <difarem@gmail.com>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Xyne
# Contributor: Scott Garrett <Wintervenom@archlinux.us>
# Contributor: Thomas Dziedzic

_name=lmms
pkgname=lmms-git
pkgver=1.3.0.alpha.1.r236.g20baf96db
pkgrel=1
pkgdesc='The Linux MultiMedia Studio.'
arch=('x86_64')
url="https://lmms.io"
license=('GPL2')
depends=('fftw' 'fltk' 'fluidsynth' 'lame' 'libgig' 'qt5-x11extras' 'sdl'
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
  # setting proper DESTDIR based install path for bash-completion
  #sed -e 's/\(${BASHCOMP_USER\)/\\$DESTDIR\1/g' -i cmake/modules/BashCompletion.cmake
  #above commented beacuse of variable duplication (cmake module already puts $DESTDIR in shellfile,so replacing  ${BASHCOMP_USER_PATH} with $DESTDIR is reduntant)
  sed -e 's/\(${BASHCOMP_USER\)/\1/g' -i cmake/modules/BashCompletion.cmake
}

build() {
  #first we patch the generated destdir in shell
  #echo "Patching dir for autocompletion."
  #patch < fix_bash_completion_dir.patch
  #echo "Done"
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
