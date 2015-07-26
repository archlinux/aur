# Contributor: Sietse van der Molen
# Contributor: Rod Kay <charlie5 on #ada at freenode.net>

pkgname=gprbuild
pkgver=2015
pkgrel=1

depends=('gcc-ada' 'xmlada')

pkgdesc="Software tool designed to help automate the construction of multi-language systems"

arch=('any')
license=('GPL')
url="http://www.adacore.com/gnatpro/toolsuite/gprbuild/"

#source=("http://downloads.dragonlace.net/src/${pkgname}-gpl-${pkgver}-src.tar.gz"
#        "https://www.assembla.com/spaces/openada/documents/aNlX7o4oyr5lxdacwqjQWU/download/aNlX7o4oyr5lxdacwqjQWU"
#        "patch-src_gpr__version.adb"
#       "extrapatch-src_gprbuild-main.adb"
#        "extrapatch-src_rewrite__data.ada"
#        "extrapatch-5-gprbuild-slave.adb"
#        "extrapatch-protocol.adb"
#        "patch-src_gprinstall-install.adb"
#        "extrapatch-src_gprslave.adb")

source=("http://mirrors.cdn.adacore.com/art/3c2da2f1d3335d39bc9ebb65a3a58264ddac6d41"
        "Makefile.archy"
        "patch-gnat_targparm"
)


sha256sums=('5d5bbc8c57075250c264e2f15d9949383450ac696eb8a90803c2a36b55ecd0e2'
            '374dc526242e5210508c11631d3bd84c41a4322b228c9c6b4210cd1a95eac76c'
            'd5da23b8457c2746e2a23adcfea053d070a08b84e87a2bf076a29245e75abdc5'
)



prepare()
{
  WRKSRC=$srcdir/$pkgname-gpl-$pkgver-src
  CONHOST=Linux
  

	cp $srcdir/Makefile.archy ${WRKSRC}

#	sed -i "" -e "s,@AUXPREFIX@,${PREFIX}/gcc5-aux," \
#		${WRKSRC}/share/gprconfig/compilers.xml

	sed -e 's|@host@|${CONHOST}|' \
		${WRKSRC}/src/gprconfig-sdefault.ads.in > \
		${WRKSRC}/src/gprconfig-sdefault.ads

#	mv ${WRKSRC}/share/gprconfig/*.orig ${WRKSRC}/obj-cov

  cd $pkgname-gpl-$pkgver-src

  patch -p0 -i ../patch-gnat_targparm
}



build() 
{
#  export OS=unix


  cd $pkgname-gpl-$pkgver-src

#  rm -fr gnat
#  cp -r ../gnat .

#  find -name '*.adb' -print -exec sed -i.bak 's/Try_Help;//g' {} \;

#  rm -fr src/rewrite_data.ads
#  rm -fr src/rewrite_data.adb

#  patch -p0 -i ../patch-src_gpr__version.adb
#  patch -p0 -i ../extrapatch-src_gprbuild-main.adb
#  patch -p0 -i ../extrapatch-src_rewrite__data.ada
#  patch -p0 -i ../extrapatch-5-gprbuild-slave.adb
#  patch -p0 -i ../extrapatch-protocol.adb
#  patch -p0 -i ../patch-src_gprinstall-install.adb
#  patch -p0 -i ../extrapatch-src_gprslave.adb

  ./configure --prefix="/usr"
  PREFIX=/usr  make -f Makefile.archy all
}


package() 
{
  cd $pkgname-gpl-$pkgver-src
  DESTDIR=$pkgdir  PREFIX=/usr  make -f Makefile.archy prefix="$pkgdir/usr" install
}
