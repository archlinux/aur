# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: thotypous <matias@archlinux.br.org>

pkgname=chipmunksystem
pkgver=20140525
pkgrel=1
pkgdesc='Circuit schematic and simulation environment, includes diglog'
arch=('x86_64' 'i686')
license=('GPL')
url='https://john-lazzaro.github.io/chipmunk/'
depends=('libx11' 'bash')
makedepends=('sed' 'findutils' 'setconf')
options=('!emptydirs')
source=("http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/psys-1.61.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/log-5.66.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/view-1.16.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/until-1.16.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/wol-1.16.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/wolcomp-1.16.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/netcmp-1.15.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/mosis-1.16.tar.gz"
        "http://www.cs.berkeley.edu/~lazzaro/chipmunk/pickup/sources/util-1.13.tar.gz")
sha256sums=('09a46f36e78fd54f22c16720c3151bb89848926cd52d1625e005faa54e0e12c8'
            'a80e6d6c6f6625b0c2b64fbcfa8261cd2535567c9eb0ae618868a6ad012d3c1f'
            'aacafec6dc0c1a576700a577cddee6362af0bf38c52dc68d48e05e6e89a2ad24'
            '80d01bdb7b8b4063e325f81aeb43236c66922790131d05f9761566145119f629'
            '6309ffa221678781e194cf31a3e442824d03ab201099a7da35650db661de3145'
            'fde2208a819d120621b20fd1f343e75d8fbd77bd02a18c39b4c256182eed7d33'
            'aa700b6234576277e2cd0822ffbdfcd67bb781a6af9f520bbae53f2783fedbdf'
            '015d4b371da201352494798d9206c7aaa9908c4b54bfd535a6d915090b184151'
            'c521b103c3246d255af8b6d1f97b78c6f79dd146b5c51ead7065dda89df67c34')

build() {
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
}

package() {
  cd build

  # Create a directory so that make below doesn't complain (!)
  install -d "$pkgdir/usr/bin"

  # Build everything (relies on directories in $pkgdir (!))
  for _x in 'psys/src' 'log/src' 'view' 'until/V1.2' 'wol' 'wolcomp' 'netcmp' 'mosis' 'util' 'util/spc-tools'; do
  	make -C "$srcdir/build/$_x" LIBDIR="/usr/share/$pkgname/lib"
  done

  # Install everything
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

  # Rename binary file that conflicts with base package iproute2
  mv "$pkgdir/usr/bin/ss" "$pkgdir/usr/bin/ss_chipmunk"
}

# vim:set ts=2 sw=2 et:
