# Maintainer: 2022-04-04 blacktav <blacktav at gmail dot com>
# Contributor: Original submitter q9 <qqqqqqqqq9 at web dot de>
pkgname=scidb-svn
pkgver=1.0.beta.r1531
pkgrel=7
# epoch=2
pkgdesc="Chess database browser: chess, chess960, etc engines; import Chessbase, PGN, Scid; CQL"
arch=('x86_64' 'i686')
url="https://sourceforge.net/projects/scidb"
license=('GPL2')
depends=('tk'
         'shared-mime-info'
         'libsm'
         'libxcursor'
         'minizip'
         'tcl'
         # recommended
         'gdbm'
         'zziplib'
         # recommended for KDE, GTK & XFCE
         'desktop-file-utils'
         'hicolor-icon-theme'
         'shared-mime-info'
         'xdg-utils'
         )
makedepends=(
           # needed for build purposes
           'patch'
           'subversion'
            )
conflicts=('scidb')
#options=('!buildflags' '!makeflags' '!debug' )
install=$pkgname.install
source=('scidb-svn::svn://svn.code.sf.net/p/scidb/code/trunk'
        'configure.patch'
        'dump_eco.cpp.patch'
        'engines.Sjeng.Makefile.patch'
        'sys_info.cpp.patch'
        'tcl.Makefile.patch'
        )
md5sums=('SKIP'
         '3dd938a3a7f744813ccb76fe4826d167'
         '47f44f0eec5d9e0a9e7e1bb25adea3b4'
         '68c9d47e5af84ac25c87045e3388c6f1'
         'ef91ffeceab48c260bb1c2af7d02cd9c'
         'a2025bd063a9f18615dba96c09e3bc99'
        )
pkgver() {
  cd $srcdir/$pkgname
  local ver="$(svnversion)"
  printf "%s" "1.0.beta.r${ver//[[:alpha:]]}"
}

prepare() {
  # Refreshing patched files
  # 1 remove files to be patched
  rm $srcdir/$pkgname/configure
  rm $srcdir/$pkgname/src/dump_eco.cpp
  rm $srcdir/$pkgname/src/sys/sys_info.cpp
  rm $srcdir/$pkgname/engines/Sjeng/Makefile
  rm $srcdir/$pkgname/tcl/Makefile
  # 2 refresh from repo
  cd $srcdir/$pkgname
  svn update
}

build() {
  # 3 Patch files
  patch -u $srcdir/$pkgname/configure -i configure.patch
  patch -u $srcdir/$pkgname/src/dump_eco.cpp -i dump_eco.cpp.patch
  patch -u $srcdir/$pkgname/src/sys/sys_info.cpp -i sys_info.cpp.patch
  patch -u $srcdir/$pkgname/engines/Sjeng/Makefile -i engines.Sjeng.Makefile.patch
  patch -u $srcdir/$pkgname/tcl/Makefile -i tcl.Makefile.patch
  # Set switches for configure script
  # Default switches had debugging turned on
  #     deployment is below /usr/local/bin
  #     this version has debugging off and small code
  cd $srcdir/$pkgname
  SWITCHES=()
  SWITCHES+=("--destdir=${pkgdir}")             # so we can create a build file
  SWITCHES+=("--prefix=/usr")                   # defaults to /usr/local/
  SWITCHES+=("--exec-prefix=/usr")              # defaults to /usr/local/
#  SWITCHES+=("--bindir=/usr/bin")               # defaults to EPREFIX/bin
  SWITCHES+=("--enginesdir=/usr/games")           # defaults to EPREFIX/games
#  SWITCHES+=("--datadir=/usr/bin")              # defaults to PREFIX/share
#  SWITCHES+=("--libdir=/usr/lib")               # defaults to EPREFIX/lib
  SWITCHES+=("--mandir=/usr/share/man")         # defaults to EPREFIX/man
#  SWITCHES+=("--fontdir=/usr/")                 # defaults to PREFIX/share/fonts
  SWITCHES+=("--enable-freedesktop=no")         # default=yes
#  SWITCHES+=("--enable-fam=yes")                # default=no
  SWITCHES+=("--enable-symbols=no")             # default=yes
  SWITCHES+=("--enable-assertions=no")          # default=yes
#  SWITCHES+=("--enable-sse2=yes")               # default=no
#  SWITCHES+=("--enable-gprof-profiling=yes")    # default=no
#  SWITCHES+=("--enable-gcov-coverage=yes")      # default=no
#  SWITCHES+=("--enable-inline-text=no")         # default=yes
  SWITCHES+=("--suppress-insane-message")
#  SWITCHES+=("")
#  SWITCHES+=("")
  SWITCHSTRING=""
  for SWITCH in "${SWITCHES[@]}" ; do
    SWITCHSTRING="${SWITCHSTRING} ${SWITCH}"
  done
  export CFLAGS="-fcommon" CXXFLAGS="-fcommon" ; ./configure ${SWITCHSTRING}
  make
}

package() {
  cd $srcdir/$pkgname
  make install
}
