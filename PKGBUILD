# Maintainer: Alex
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=lightspark-local
pkgver=20120810
pkgrel=1
pkgdesc="My modified version of the lightspark-git PKGBUILD; Enhancements: choose between devel and normal buildtype, save changes local even if you use yaourt"
#pkgdesc="An alternative Flash Player for Linux - Flash for real. Now."
arch=(i686 x86_64)
url="http://lightspark.sourceforge.net"
license=(LGPL3)
depends=(mesa ftgl gtk2 curl zlib ffmpeg glew pcre libffi boost-libs
         hicolor-icon-theme desktop-file-utils libxml++ rtmpdump xz) 
makedepends=(git cmake nasm xulrunner llvm glproto boost fontconfig
             sdl libpulse)
optdepends=('gnash-gtk: Gnash fallback support'
            'libpulse: PulseAudio audio backend'
            'sdl: SDL audio backend')
provides=(lightspark)
conflicts=(lightspark lightspark-git)
install=lightspark.install
_gitroot="git://github.com/lightspark/lightspark.git"
_gitname="lightspark"
srcdir=~/prog/git/

build() {
  
  cd $srcdir
  
  msg "Connecting to GIT server...."
  if [ -d ./$_gitname ] ; then
    cd $srcdir/$_gitname
    
    if ! git remote show origin | grep "$_gitroot" > /dev/null ; then
      echo "error: origin should be $_gitroot"
      exit 1
    fi
    git fetch -p --all
    
    if ! git branch | grep "* master" > /dev/null; then
      echo "shall be switched to master? [y] (not the default)"
      read -n 1 SHALL_GIT_MASTER
      if [ "$SHALL_GIT_MASTER" = "y" ]; then
        git checkout master
      fi
    fi
    
    #warning target repo should be origin
    if ! git branch | grep "* master" > /dev/null; then
      echo "Should origin/master be merged? [y] (not the default)"
      read -n 1 SHALL_GIT_MERGE
    fi
    [ "$SHALL_GIT_MERGE" != "n" ] && if ! git merge --ff-only --no-commit origin/master; then
      warning "Git merge failed!"
    fi
  else
    git clone $_gitroot $_gitname
  fi
  
  msg "GIT checkout done or server timeout"
  msg "Starting build..."
  
  buildtype="Release"
  msg "Shall devel build type be used? [y] (not the default)"
  read -n 1 SHALL_DEVEL
  if [ "$SHALL_DEVEL" = "y" ];then
  buildtype="Debug"
  fi
  
  
  cd $srcdir
  rm -rf ./${_gitname}-build/*
  mkdir -p ./${_gitname}-build
  cp -r ~/prog/git/${_gitname}/* ${_gitname}-build/
  cd $srcdir/${_gitname}-build


  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCOMPILE_PLUGIN=1 \
    -DCMAKE_BUILD_TYPE=$buildtype \
    -DGNASH_EXE_PATH=/usr/bin/gtk-gnash \
    -DAUDIO_BACKEND="pulseaudio" \
    ../${_gitname}-build
# sdl

  make
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir" install
}
