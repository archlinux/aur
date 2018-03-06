# Maintainer: xpt <user.xpt@gmail.com>

pkgname=liggghts
pkgver=3.8.0
pkgrel=1
pkgdesc="Open Source Discrete Element Method Particle Simulation Software"
arch=('any')
url="https://github.com/CFDEMproject/LIGGGHTS-PUBLIC"
license=('GPL')
depends=('paraview' 'openmpi' 'voro++' 'fftw') 
makedepends=('git')
source=('liggghts.patch')
md5sums=('fcecfe6b91ce6d74a84b7ecd09be8f38')

_gitroot="https://github.com/CFDEMproject/LIGGGHTS-PUBLIC.git"
_gitname="liggghts-public"
_make="mpi"

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
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/"

  patch -Np0 < ../liggghts.patch # diff -Naur Makefile.mpi.old Makefile.mpi > liggghts.patch
  cd src
  make  clean-all
  make $_make || return 1
}

 package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  mkdir -p "$pkgdir/usr/share/$pkgname/examples"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/PDF/"
  mkdir -p "$pkgdir/usr/bin/"
  
  cd "$srcdir/$_gitname-build"
  install -Dm 755 src/lmp_$_make "$pkgdir/usr/bin/$pkgname"
  
  cp -r --no-preserve='ownership' examples/LIGGGHTS/Tutorials_public/* "$pkgdir/usr/share/$pkgname/examples"
#   install -Dm644 examples/LIGGGHTS/Tutorials_public/ $pkgdir/usr/share/$pkgname/examples
  cp -r --no-preserve='ownership' doc/*.{html,pdf} "$pkgdir/usr/share/doc/$pkgname/"
  cp -r --no-preserve='ownership' doc/PDF/*.pdf "$pkgdir/usr/share/doc/$pkgname/PDF/"
#   install -Dm644 doc/* $pkgdir/usr/share/doc/$pkgname

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README" "$pkgdir/usr/share/licenses/$pkgname/README"
} 
