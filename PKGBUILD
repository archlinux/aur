# Mantainer Jens Staal <staal1978@gmail.com>

pkgname=arcan
pkgver=0.5.0.r25.g18d5347
pkgrel=1
pkgdesc="Game Engine meets a Display Server meets a Multimedia Framework"
arch=('i686' 'x86_64')
url="http://arcan-fe.com"
license=('GPL' 'BSD')

depends=('sdl' 'openal' 'mesa' 'freetype2' 'sqlite' 'luajit')
optdepends=('ffmpeg' 'vlc' 'apr' 'xz')
makedepends=('cmake' 'git')

source=('git://github.com/letoram/arcan.git' 'arcan.sh')

sha256sums=('SKIP' 'a62a2e44f96699e956f84fa47256aea3e2b60574d452a20c7f7565298779d6c0')

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
  # video platform options
  # DVIDEO_PLATFORM=egl-dri, egl-nvidia, sdl, egl-gles, x11, x11-headless
  cmake -DCMAKE_BUILD_TYPE="Release" -DVIDEO_PLATFORM=sdl -DENABLE_LWA=ON -DISTR_TAG=arch -DDISABLE_HIJACK=OFF ../src
  make -j 12
}


package() {
  cd "$srcdir"/$pkgname/build
  cmake -E cmake_echo_color --cyan "Install the project..."
  DESTDIR="$pkgdir" cmake -DCMAKE_INSTALL_PREFIX="/usr" -P cmake_install.cmake
  #fix potential installation errors putting stuff in /usr/local
  cp -r "$pkgdir"/usr/local/* "$pkgdir"/usr/
  rm -rf "$pkgdir"/usr/local
  #install default environment variables
  mkdir -p "$pkgdir"/etc/profile.d
  cp "$srcdir"/arcan.sh "$pkgdir"/etc/profile.d/
}



