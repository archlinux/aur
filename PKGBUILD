# Mantainer Jens Staal <staal1978@gmail.com>

pkgname=arcan
pkgver=0.5.0.r24.gb9f3e35
pkgrel=1
pkgdesc="Game Engine meets a Display Server meets a Multimedia Framework"
arch=('i686' 'x86_64')
url="http://arcan-fe.com"
license=('GPL' 'BSD')

depends=('sdl' 'openal' 'mesa' 'freetype2' 'sqlite' 'lua')
makedepends=('cmake' 'git')

source=('git://github.com/letoram/arcan.git')

sha256sums=('SKIP')

options=('!libtool' '!strip' '!makeflags' '!buildflags' 'staticlibs')

pkgver() {
  cd "$srcdir"/$pkgname

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
  else
    echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
  fi
}

prepare() {
  cd "$srcdir"/$pkgname
  rm -rf build
  mkdir build
}

build() {
  cd "$srcdir"/$pkgname/build
  # change Release to Debug if testing
  cmake -DCMAKE_BUILD_TYPE="Release" -DVIDEO_PLATFORM=sdl ../src
  make -j 12
}


package() {
  cd "$srcdir"/$pkgname/build
  cmake -E cmake_echo_color --cyan "Install the project..."
  DESTDIR="$pkgdir" cmake -DCMAKE_INSTALL_PREFIX="/usr" -P cmake_install.cmake
}



