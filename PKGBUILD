# Maintainer: András Wacha <awacha at gmail>
pkgname=demeter
pkgver=0.9.25
pkgrel=2
pkgdesc="Demeter is a comprehensive system for processing and analyzing X-ray Absorption Spectroscopy data."
arch=('i686' 'x86_64')
url="https://bruceravel.github.io/demeter/"
license=('GPL')
depends=('ifeffit' 'pgplot' 'perl-archive-zip' 'perl-capture-tiny' 
	'perl-config-ini' 'perl-const-fast' 'perl-datetime' 'perl-file-touch' 
	'perl-graph' 'perl-heap' 'perl-list-moreutils' 'perl-moose'
	'perl-moosex-types' 'perl-pdl-nohdf4' 'perl-pod-pom' 
	'perl-regexp-common' 'perl-statistics-descriptive' 'perl-text-template'
	'perl-text-unidecode' 'perl-tree-simple' 'perl-want' 'perl-xmlrpc-lite>=0'
	'perl-wx' 'perl-chemistry-elements' 'perl-encoding-fixlatin'
	'perl-file-countlines' 'perl-math-combinatorics' 'perl-math-derivative'
	'perl-math-random' 'perl-math-round' 'perl-math-spline' 
	'perl-moosex-aliases' 'perl-moosex-types-laxnum' 'perl-pdl-stats'
	'perl-regexp-assemble' 'perl-spreadsheet-writeexcel' 'perl-file-slurper'
	'perl-pod-projectdocs' 'perl-file-monitor-lite' 
	'perl-graphics-gnuplotif' 'perl-term-sk' 'perl-term-twiddle')
makedepends=('perl-module-build' 'imagemagick')
source=(https://github.com/bruceravel/${pkgname}/archive/${pkgver}.tar.gz
	dathena.desktop
	dartemis.desktop
	dhephaestus.desktop
	)

md5sums=('ddd8f92b88c262c9f3e041cce87369a2'
         'a978d9dd0527e655f6a040472a8d84dd'
         'accb135663d3f3cfdd5733bb983048c5'
         '733d9d4df36032b606b0c27dc268795b')

prepare() {
	cd "$pkgname-$pkgver"
	perl Build.PL
}

build() {
	cd "$pkgname-$pkgver"
	./Build
}

check() {
	cd "$pkgname-$pkgver"
	./Build test
}

package() {
	cd "$pkgname-$pkgver"
	PLIB=${pkgdir}/usr/lib/perl5/vendor_perl
	mkdir -p $PLIB
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/share/man
	./Build --install_path lib=$PLIB \
		--install_path arch=$PLIB \
		--install_path bin=${pkgdir}/usr/bin \
		--install_path script=${pkgdir}/usr/bin \
		--install_path bindoc=${pkgdir}/usr/share/man \
		--install_path libdoc=${pkgdir}/usr/share/man \
		install
	mkdir -p ${pkgdir}/usr/share/icons/hicolor/48x48/apps
	cp "blib/lib/Demeter/UI/Artemis/share/artemis_icon.png" ${pkgdir}/usr/share/icons/hicolor/48x48/apps/artemis.png
	cp "blib/lib/Demeter/UI/Athena/share/athena_icon.png" ${pkgdir}/usr/share/icons/hicolor/48x48/apps/athena.png
	convert "blib/lib/Demeter/UI/Atoms/icons/atoms.ico" ${pkgdir}/usr/share/icons/hicolor/48x48/apps/atoms.png
	cp "blib/lib/Demeter/UI/Hephaestus/icons/vulcan.png" ${pkgdir}/usr/share/icons/hicolor/48x48/apps/vulcan.png
	mkdir -p ${pkgdir}/usr/share/applications
 	cp "${srcdir}/dhephaestus.desktop"  ${pkgdir}/usr/share/applications
 	cp "${srcdir}/dartemis.desktop"  ${pkgdir}/usr/share/applications
 	cp "${srcdir}/dathena.desktop"  ${pkgdir}/usr/share/applications
}
