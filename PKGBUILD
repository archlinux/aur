# Contributor: ianux <ianux@free.fr>
pkgname=puae-git
pkgver=20110803
pkgrel=1
pkgdesc="Amiga emulator for *nix systems - successor of E-UAE"
arch=('i686' 'x86_64')
url="http://github.com/GnoStiC/PUAE"
license=('GPL')
depends=('alsa-lib' 'gtk2' 'libgl' 'sdl')
makedepends=('git')
conflict=('e-uae' 'uae')
source=()
md5sums=()

_gitroot="http://github.com/GnoStiC/PUAE.git"
_gitname="PUAE"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./bootstrap.sh
  ./configure --prefix=/usr \
    --with-sdl \
    --with-sdl-gfx \
    --with-sdl-gl \
    --with-alsa \
    --enable-bsdsock
    # --enable-scsi-device
  make
  make DESTDIR="$pkgdir" install
} 
