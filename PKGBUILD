# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>

pkgname=chipmunksystem
pkgver=20120224
pkgrel=2
pkgdesc="Circuit schematic and simulation environment, includes diglog"
arch=('x86_64' 'i686')
license=('GPL')
url="http://www.cs.berkeley.edu/~lazzaro/chipmunk/"
depends=('libx11' 'bash')
makedepends=('sed' 'findutils' 'setconf')
options=('!emptydirs')
source=("http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/psys-1.60.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/log-5.65.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/view-1.15.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/until-1.15.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/wol-1.15.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/wolcomp-1.15.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/netcmp-1.14.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/mosis-1.15.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/util-1.12.tar.gz")
sha256sums=('d910601b14645bb2118e99cda0e80f577067d073cf0053a2857ab0b8d78d823f'
            '01d432d211f3d2542bc2d645373a28255cfa2d4a69ad7f8b78cea0be97f59c7b'
            'bd7e8cb00c35911f9aa78529fd2d1b7b3061263e656ebedf7cb039a412378b97'
            '9135da9b8819a9705d317d0b59bc9aee68df698fc660e186f95233322d551a8b'
            'ae9bb0884904564279fffabd72a062100eafbcfe5db0e326ed4605109874a2ea'
            'd5cf71985f6d872165b212ab2bad65dc9f46e5294f8a6099781b3dd55850ea9c'
            'd71b74cce8ec5ce90ed34778a9b3c33cbb887cd0862feddeddfb7458a8972a6a'
            '56abe3b8fe22cf1ef70047f2ea345e96110b9b4cd0786cf1414c33b3b23dabd6'
            '6a817b95830c262d931c631c430a5ab502f2e514e024ef19a866390e0e776bed')

build() {
  cd "$srcdir"

  # diglog segfaults
  #export CFLAGS="-O0 -g -DDEBUG"

  rm -rf build
  mkdir -p build build/bin
  mv 'psys' 'log' 'view' 'until' 'wol' 'wolcomp' 'netcmp' 'mosis' 'util' build
  cd build

  # Add missing legacy define
  echo "#define L_cuserid 9" > tmp
  cat view/viewmod.c >> tmp
  rm view/viewmod.c
  cp tmp view/viewmod.c

  # Add missing legacy define
  echo "#define L_cuserid 9" > tmp
  cat wol/wol_init.c >> tmp
  rm wol/wol_init.c
  cp tmp wol/wol_init.c

  # Fix conflicting function name
  sed -i 's/getline(/getline2(/g' until/V1.2/ffman.c
  
  # Adjust Makefiles
  for _x in `find . -name Makefile`; do
  	setconf "$_x" CHIPMUNKFLAGS "-DBSD -Dlinux -DF_OK=0 $CFLAGS"
    setconf "$_x" BINDIR "$pkgdir/usr/bin"
  done
  
  # Fix paths
  sed -i "s|-DCHIPLIB=.*$|-DCHIPLIB=\\\\\"/usr/share/$pkgname/lib\\\\\"|" 'psys/src/Makefile'
  setconf log/src/Makefile LOGLIBDIR "/usr/share/$pkgname/lib"
  for _x in 'psys/src/plot.c' 'log/lib/log.doc' 'log/lib/logspc.cnf' 'log/lib/lplot.cnf' 'log/lib/lplot.cnf'; do
  	sed -i "s|/usr/chipmunk|/usr/share/$pkgname|" "$_x"
  done
  for _x in 'wol/wol_drc.c' 'wol/wol_init.c'; do
  	sed -i "s|/usr/%s|/home/%s/.wol|" "$_x"
  done

  # Create a directory so make doesn't complain (!)
  mkdir -p "$pkgdir/usr/bin"
  
  # Build everything
  for _x in 'psys/src' 'log/src' 'view' 'until/V1.2' 'wol' 'wolcomp' 'netcmp' 'mosis' 'util' 'util/spc-tools'; do
  	make -C "$srcdir/build/$_x" LIBDIR="/usr/share/$pkgname/lib"
  done
}

package() {
  cd "$srcdir/build"

  for _x in 'psys/src' 'log/src' 'view' 'until/V1.2' 'wol' 'wolcomp' 'netcmp' 'mosis' 'util' 'util/spc-tools'; do
  	make -C "$srcdir/build/$_x" install
  done
  install -m755 "$srcdir/build/bin/"* "$pkgdir/usr/bin"
  install -m755 -d "$pkgdir/usr/share/$pkgname/lib"
  install -m644 "$srcdir/build/lib/"* "$pkgdir/usr/share/$pkgname/lib"
  cp -r "$srcdir/build/log/lib/"* "$pkgdir/usr/share/$pkgname/lib"
  for _x in view cnf; do
  	install -m644 "$srcdir/build/view/lib/"*."$_x" "$pkgdir/usr/share/$pkgname/lib"
  done
  install -m755 -d "$pkgdir/usr/share/$pkgname/until/designrules"
  install -m644 "$srcdir/build/until/designrules/"* "$pkgdir/usr/share/$pkgname/until/designrules"
  install -m644 "$srcdir/build/until/V1.2/"*.ff "$pkgdir/usr/share/$pkgname/until"
  install -m755 -d "$pkgdir/usr/share/$pkgname/netcmp"
  install -m644 "$srcdir/build/netcmp/"*.ntk "$pkgdir/usr/share/$pkgname/netcmp"
}

# vim:set ts=2 sw=2 et:
