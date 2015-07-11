# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>
pkgname=dssi-vst-git
pkgver=20130811
pkgrel=1
pkgdesc="DSSI adapter/wrapper for win32 VST plug-ins"
arch=("i686" "x86_64")
url="https://github.com/falkTX/dssi-vst"
license=("GPL")
depends=("wine" "liblo" "jack")
if test "$CARCH" == "x86_64"; then
  depends+=("lib32-jack")
fi
makedepends=("git")
provides=("dssi-vst")

_gitroot="https://github.com/falkTX/dssi-vst.git"
_gitname="dssi-vst"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # Apply necessary modifications to Makefile

  # Use /usr as destination
  sed -i "s/\/usr\/local/\/usr/g" Makefile
  # Use CXXFLAGS for building
  sed -i "s/BUILD_FLAGS  =.*/BUILD_FLAGS  = -ffast-math -fvisibility=hidden -fPIC -Wall -Ivestige \$(CXXFLAGS)/g" Makefile
#  # pthread, and rt are also needed when linking the host
#  sed -i "s/LINK_HOST   =/LINK_HOST   = -lpthread -lrt/g" Makefile

  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
