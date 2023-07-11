# Maintainer: Benjamin Radel <aur@radel.tk>
# Contributor: xpt <user.xpt@gmail.com>

pkgname=liggghts-git
_execname=liggghts
pkgver=3.8.0.r81.gbbd23c85
pkgrel=2
pkgdesc="Open Source Discrete Element Method Particle Simulation Software"
arch=('x86_64')
url="https://github.com/CFDEMproject/LIGGGHTS-PUBLIC"
license=('GPL')
depends=('paraview' 'openmpi') 
makedepends=('git' 'patchelf')
provides=('liggghts')
conflicts=('liggghts')
source=('liggghts-git::git+https://github.com/CFDEMproject/LIGGGHTS-PUBLIC.git')

sha256sums=('SKIP')

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

 cp "$srcdir/$pkgname/src/MAKE/Makefile.user_default" "$srcdir/$pkgname/src/MAKE/Makefile.user"
 echo "MPI_CCFLAGS_USR=$CXXFLAGS" >> "$srcdir/$pkgname/src/MAKE/Makefile.user"
 echo "MPI_LDFLAGS_USR=$LDFLAGS" >> "$srcdir/$pkgname/src/MAKE/Makefile.user"
 echo "VTK_INC_USR=-I/opt/paraview/include/paraview" >> "$srcdir/$pkgname/src/MAKE/Makefile.user"
 echo "VTK_LIB_USR=-L/opt/paraview/lib" >> "$srcdir/$pkgname/src/MAKE/Makefile.user"
}

build() {
  cd "$srcdir/$pkgname"
  cd src
  make  clean-all
  make auto || return 1
}

 package() {
  mkdir -p "$pkgdir/usr/share/$pkgname"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  mkdir -p "$pkgdir/usr/share/$pkgname/examples"
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/PDF/"
  mkdir -p "$pkgdir/usr/bin/"
  
  cd "$srcdir/$pkgname"
  install -Dm 755 src/lmp_auto "$pkgdir/usr/bin/${_execname}-exec"
  patchelf --remove-rpath "$pkgdir/usr/bin/${_execname}-exec"
  install -Dm 755 /dev/null "$pkgdir/usr/bin/${_execname}" 
  echo "#!/bin/sh" > "$pkgdir/usr/bin/${_execname}"
  echo 'export LD_LIBRARY_PATH=/opt/paraview/lib/:"${LD_LIBRARY_PATH}"' >> "$pkgdir/usr/bin/${_execname}"
  echo "exec /usr/bin/${_execname}-exec \"\$@\"" >> "$pkgdir/usr/bin/${_execname}"
  
  cp -r --no-preserve='ownership' examples/LIGGGHTS/Tutorials_public/* "$pkgdir/usr/share/$pkgname/examples"
#   install -Dm644 examples/LIGGGHTS/Tutorials_public/ $pkgdir/usr/share/$pkgname/examples
  cp -r --no-preserve='ownership' doc/*.{html,pdf} "$pkgdir/usr/share/doc/$pkgname/"
  cp -r --no-preserve='ownership' doc/PDF/*.pdf "$pkgdir/usr/share/doc/$pkgname/PDF/"
#   install -Dm644 doc/* $pkgdir/usr/share/doc/$pkgname

  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README" "$pkgdir/usr/share/licenses/$pkgname/README"
} 
