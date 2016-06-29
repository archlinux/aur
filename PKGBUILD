# Maintainer: xpt <user.xpt@gmail.com>

pkgname=liggghts
pkgver=3.4.0
pkgrel=1
pkgdesc="Open Source Discrete Element Method Particle Simulation Software"
arch=('any')
url="https://github.com/CFDEMproject/LIGGGHTS-PUBLIC"
license=('GPL')
depends=('paraview' 'openmpi' 'voro++' 'fftw') 
makedepends=('git')
source=('fftw3.patch' 'usrlocal.patch')
md5sums=('20fb3f88185884af9f0e16477671ca8e' 'ea4006138a0750ab6223678bb767ef0c')

_gitroot="https://github.com/CFDEMproject/LIGGGHTS-PUBLIC.git"
_gitname="liggghts-public"


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

  patch -Np0 < ../fftw3.patch
  patch -Np0 < ../usrlocal.patch # diff -Naur Makefile.lammps.old Makefile.lammps > usrlocal.patch

  cd src
  make  clean-all
  make openmpi || return 1
}

 package() {
  mkdir -p $pkgdir/usr/share/$pkgname
  mkdir -p $pkgdir/usr/share/doc/$pkgname
  mkdir -p $pkgdir/usr/share/$pkgname/examples
  mkdir -p $pkgdir/usr/share/doc/$pkgname/PDF/
  
  cd $srcdir/$_gitname-build
  install -Dm 755 src/lmp_openmpi $pkgdir/usr/bin/$pkgname
  
  cp -r --no-preserve='ownership' examples/LIGGGHTS/Tutorials_public/* $pkgdir/usr/share/$pkgname/examples
#   install -Dm644 examples/LIGGGHTS/Tutorials_public/ $pkgdir/usr/share/$pkgname/examples
  cp -r --no-preserve='ownership' doc/*.{html,pdf} $pkgdir/usr/share/doc/$pkgname/
  cp -r --no-preserve='ownership' doc/PDF/*.pdf $pkgdir/usr/share/doc/$pkgname/PDF/
#   install -Dm644 doc/* $pkgdir/usr/share/doc/$pkgname

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README" "$pkgdir/usr/share/licenses/$pkgname/README"
} 
