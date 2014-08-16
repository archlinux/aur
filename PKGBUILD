# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=daphne-svn
pkgver=4276
pkgrel=1
pkgdesc='Command-line multiple arcade laserdisc emulator (development version)'
arch=('i686' 'x86_64')
url="http://daphne-emulator.com"
license=('GPL2')
if [[ "$CARCH" == "x86_64" ]]; then
  depends=('lib32-sdl_image' 'lib32-sdl_ttf' 'lib32-glew' 'lib32-libvorbis' 'lib32-libgl')
  makedepends=('svn' 'gcc-multilib')
else
  depends=('sdl_image' 'sdl_ttf' 'glew' 'libvorbis' 'libgl')
  makedepends=('svn')
fi
conflicts=('daphne')
provides=('daphne')
source=('daphne.sh')
sha256sums=('193553cd02a6d3e02c295a4ae2462ddb178819db3e155eaabae430355e1ba2b1')
options=('!buildflags')

_svndir=https://www.daphne-emu.com:9443/daphnesvn/branches/v_1_0/
_svnmod=daphne

prepare() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up --username svn --password svn --non-interactive -r $pkgver)
  else
    svn co --username svn --password svn --non-interactive $_svndir --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"

  # use makefile variables for i386 architecture
  cd "$srcdir/$_svnmod-build/src"
  cp Makefile.vars.linux_x86 Makefile.vars

  # disable -Werror
  sed 's|-Werror||' -i Makefile

  # add libGL
  sed 's|-lGLEW|-lGL -lGLEW|' -i Makefile.vars

  if [[ "$CARCH" == "x86_64" ]]; then
    # patch to use multilib gcc and 32 bit sdl
    sed 's|gcc|gcc -m32|;s|g++|g++ -m32|;s|sdl-config|&-32|g' -i \
      Makefile.vars vldp2/Makefile.linux game/singe/Makefile.linux
    sed 's|as |as --32 |' -i video/Makefile sound/Makefile
  fi
}

build() {
  cd "$srcdir/$_svnmod-build/src"

  if [[ "$CARCH" == "x86_64" ]]; then
    export CC="gcc -m32"
    export CXX="g++ -m32"
    export AS="as --32"
  fi

  msg "Building libvldp2..."
  cd vldp2
  chmod +x configure
  ./configure
  make -f Makefile.linux

  msg "Building SINGE..."
  cd ../game/singe
    make -f Makefile.linux

  msg "Building DAPHNE..."
  cd ../..
  make
}

package() {
  cd "$srcdir/$_svnmod-build"

  # launcher
  install -Dm755 ../daphne.sh "$pkgdir"/usr/bin/daphne
  # binary
  install -Dm755 daphne.bin "$pkgdir"/usr/share/daphne/daphne
  # libs
  if [[ "$CARCH" == "x86_64" ]]; then
    install -d "$pkgdir"/usr/lib32
    install -Dm755 libsinge.so libvldp2.so "$pkgdir"/usr/lib32
  else
    install -d "$pkgdir"/usr/lib
    install -Dm755 libsinge.so libvldp2.so "$pkgdir"/usr/lib
  fi
  # data
  cp -rup pics roms sound "$pkgdir"/usr/share/daphne
  # doc
  install -d "$pkgdir"/usr/share/doc/daphne
  cp -rup doc/* daphne-changelog.txt "$pkgdir"/usr/share/doc/daphne
}
