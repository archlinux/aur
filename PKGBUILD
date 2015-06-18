# Maintainer: Fabio Zanini <fabio.zanini@tuebingen.mpg.de>
pkgname=kmc
pkgver=2.0
pkgrel=2
pkgdesc="Count k-mers in a set of reads from genome sequencing projects"
arch=('x86_64')
url="http://sun.aei.polsl.pl/$pkgname/"
license=('GPL')
depends=()
makedepends=('git' 'gcc')
source=("http://sun.aei.polsl.pl/$pkgname/download/$pkgname.tar.gz")
noextract=()
md5sums=('3d36398f63277bf1c7c8bd69a026cd40')

_gitroot='https://github.com/marekkokot/KMC.git'
_gitname='KMC'

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

  # FIXME: the authors say to use these flags
  # Strip the -static flag, arch uses dynlibs only for libgomp (openMP)
  sed -i 's/-static //' makefile
  make CFLAGS="-Wall -O3 -m64 -fopenmp -pthread -std=c++11" CLINK="-lm -fopenmp -O3 -pthread -std=c++11"
}

package() {
  cd "$srcdir/$_gitname-build"

  mkdir -p "$pkgdir"/usr/bin
  install -o root -g root bin/kmc "$pkgdir"/usr/bin/kmc
  install -o root -g root bin/kmc_dump "$pkgdir"/usr/bin/kmc_dump
}

# vim:set ts=2 sw=2 et:
