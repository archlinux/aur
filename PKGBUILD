# Maintainer:  Eric Biggers <ebiggers3 at gmail dot com>


# Note: this software is difficult to install.

pkgname=mummer
pkgver=3.23
pkgrel=2
pkgdesc="MUMmer is a program for rapidly aligning large genomes"
arch=('i686' 'x86_64')
url="http://mummer.sourceforge.net"
license=('PerlArtistic')
depends=('perl')
optdepends=('gnuplot: for alignment visualization'
                'xfig: for alignment visualization'
                'transsfig: for alignment visualization'
		'tcsh: for running some optional scripts')

source=("http://downloads.sourceforge.net/project/mummer/mummer/${pkgver}/MUMmer${pkgver}.tar.gz")

build() {
  cd MUMmer${pkgver}
  make
}

package() {
  cd MUMmer${pkgver}

  mkdir -p ${pkgdir}/usr/share/doc/mummer \
           ${pkgdir}/usr/bin \
           ${pkgdir}/usr/lib/mummer/{aux_bin,scripts} \
           ${pkgdir}/usr/share/man/man1

  install -m755 annotate combineMUMs delta-filter dnadiff exact-tandems \
                gaps mapview mgaps mummer mummerplot nucmer nucmer2xfig \
                promer repeat-match run-mummer1 run-mummer3 show-aligns \
                show-coords show-diff show-snps show-tiling \
                ${pkgdir}/usr/bin

  install -m755 aux_bin/{prenuc,postnuc,prepro,postpro} \
                ${pkgdir}/usr/lib/mummer/aux_bin

  install -m755 scripts/*.{pl,awk,csh} ${pkgdir}/usr/lib/mummer/scripts

  # The software hard-codes the build directory into some scripts.  Fix this...
  cp -r README ACKNOWLEDGEMENTS docs/*{.README,.pdf} docs/web \
                ${pkgdir}/usr/share/doc/mummer
  install -Dm644 scripts/Foundation.pm ${pkgdir}/usr/lib/perl5/site_perl/Foundation.pm
  #first replace scripts and aux_bin
  find ${pkgdir} -type f -exec sed -i -e "s@$PWD/scripts@/usr/lib/mummer/scripts@g" {} \;
  find ${pkgdir} -type f -exec sed -i -e "s@$PWD/aux_bin@/usr/lib/mummer/aux_bin@g" {} \;
  # now replace all that's left with /usr/bin
  find ${pkgdir} -type f -exec sed -i -e "s@$PWD@/usr/bin@g" {} \;

  # Fix conflict with `gd' package
  mv ${pkgdir}/usr/bin/{,mummer-}annotate
  sed -i -e 's@\$bindir/annotate@\$bindir/mummer-annotate@' \
  			${pkgdir}/usr/bin/run-mummer1 \
			${pkgdir}/usr/lib/mummer/scripts/run-mummer1.csh
}
md5sums=('f2422b3d2638dba4baedb71b1acdffa2')
