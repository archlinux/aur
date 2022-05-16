# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: xpt <user.xpt@gmail.com>

pkgname=liggghts-git
_execname=liggghts
pkgver=3.8.0.r45.g86544c3f
pkgrel=1
pkgdesc="Open Source Discrete Element Method Particle Simulation Software"
arch=('any')
url="https://github.com/CFDEMproject/LIGGGHTS-PUBLIC"
license=('GPL')
depends=('paraview' 'openmpi' 'voro++' 'fftw') 
makedepends=('git')
provides=('liggghts')
conflicts=('liggghts')
source=('liggghts-git::git+https://github.com/CFDEMproject/LIGGGHTS-PUBLIC.git'
	'0001-use-paraviewVTK.patch'
	'0002-fix-int-to-string-conversion.patch')

sha256sums=('SKIP'
	'cfbd4027050a33653b9960edc5a503947a39845cee50063a663189696e63f66f'
	'047ae8867d90550e34558ee1dfe5fef582a22922632863c66ad4a288e33b2a3c')

_make="mpi"

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/$pkgname
  for p in "${source[@]}"; do
    if [[ "$p" =~ \.patch$ ]]; then
      echo "Applying patch ${p##*/}"
      patch -p1 -N -i "$srcdir/${p##*/}"
    fi
  done
}

build() {
  cd "$srcdir/$pkgname"
  cd src
  make  clean-all
  make $MAKEFLAGS $_make || return 1
}

 package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  mkdir -p "$pkgdir/usr/share/$pkgname/examples"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/PDF/"
  mkdir -p "$pkgdir/usr/bin/"
  
  cd "$srcdir/$pkgname"
  install -Dm 755 src/lmp_$_make "$pkgdir/usr/bin/$_execname"
  
  cp -r --no-preserve='ownership' examples/LIGGGHTS/Tutorials_public/* "$pkgdir/usr/share/$pkgname/examples"
#   install -Dm644 examples/LIGGGHTS/Tutorials_public/ $pkgdir/usr/share/$pkgname/examples
  cp -r --no-preserve='ownership' doc/*.{html,pdf} "$pkgdir/usr/share/doc/$pkgname/"
  cp -r --no-preserve='ownership' doc/PDF/*.pdf "$pkgdir/usr/share/doc/$pkgname/PDF/"
#   install -Dm644 doc/* $pkgdir/usr/share/doc/$pkgname

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README" "$pkgdir/usr/share/licenses/$pkgname/README"
} 
