# Maintainer: András Wacha <awacha at gmail>
pkgname=demeter
pkgver=0.9.27
pkgrel=5
pkgdesc="Demeter is a comprehensive system for processing and analyzing X-ray Absorption Spectroscopy data."
arch=('i686' 'x86_64')
url="https://bruceravel.github.io/demeter/"
license=('GPL')
depends=('ifeffit' 'pgplot' 'perl-archive-zip' 'perl-capture-tiny' 
	'perl-config-ini' 'perl-const-fast' 'perl-datetime' 'perl-file-touch' 
	'perl-graph' 'perl-heap' 'perl-list-moreutils' 'perl-moose'
	'perl-moosex-types' 'perl-pdl' 'perl-pod-pom' 
	'perl-regexp-common' 'perl-statistics-descriptive' 'perl-text-template'
	'perl-text-unidecode' 'perl-tree-simple' 'perl-want' 'perl-xmlrpc-lite>=0'
	'perl-wx' 'perl-chemistry-elements' 'perl-encoding-fixlatin'
	'perl-file-countlines' 'perl-math-combinatorics' 'perl-math-derivative'
	'perl-math-random' 'perl-math-round' 'perl-math-spline' 
	'perl-moosex-aliases' 'perl-moosex-types-laxnum' 'perl-pdl-stats'
	'perl-regexp-assemble' 'perl-spreadsheet-writeexcel' 'perl-file-slurper'
	'perl-pod-projectdocs' 'perl-file-monitor-lite' 
	'perl-graphics-gnuplotif' 'perl-term-sk' 'perl-term-twiddle' 'perl-file-copy-recursive' 
	'perl-rpc-xml' 'perl-yaml-tiny')
makedepends=('perl-module-build' 'imagemagick' 'perl-file-copy-recursive' 'python-sphinx' 'python-pybtex' 'python-sphinxcontrib-bibtex' 'python-sphinxcontrib-blockdiag' 'gendesk' 'perl-module-build-tiny')
source=("https://github.com/bruceravel/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9cc4f0f862fbea3d569079435208707e848cf61762aa901bd7ad199aed0330ca651658ce99e26d7fb8eafaa3874432d3478c1af48042d0ef91a26f48685b61f0')

CFLAGS="${CFLAGS} -Wno-error=format-security"

prepare() {
	cd "$pkgname-$pkgver"
	perl -I. Build.PL
}

build() {
	cd "$pkgname-$pkgver"
	./Build --config optimize="${CFLAGS} -W'no-error=format-security'"
}

check() {
	cd "$pkgname-$pkgver"
	./Build test
}

package() {
	cd "$pkgname-$pkgver"
	PLIB=${pkgdir}/usr/share/perl5/vendor_perl
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
	mkdir -p ${pkgdir}/usr/share/pixmaps
	cp "blib/lib/Demeter/UI/Artemis/share/artemis_icon.png" ${pkgdir}/usr/share/pixmaps/dartemis.png
	cp "blib/lib/Demeter/UI/Athena/share/athena_icon.png" ${pkgdir}/usr/share/pixmaps/dathena.png
	convert "blib/lib/Demeter/UI/Atoms/icons/atoms.ico" ${pkgdir}/usr/share/pixmaps/datoms.png
	cp "blib/lib/Demeter/UI/Hephaestus/icons/vulcan.png" ${pkgdir}/usr/share/pixmaps/dhephaestus.png
	mkdir -p ${pkgdir}/usr/share/applications
	gendesk -n -f --pkgname=Hephaestus --pkgdesc="A souped-up periodic table for the X-ray absorption spectroscopistd" --name=DHephaestus --icon=dhephaestus.png --terminal=false --startupnotify=true --categories="Science;Chemistry;Physics;Education" --exec=/usr/bin/dhephaestus ../../PKGBUILD
	gendesk -n -f --pkgname=Artemis --pkgdesc="EXAFS analysis using Feff and Ifeffit" --name=DArtemis --icon=dartemis.png --terminal=false --startupnotify=true --categories="Science;Chemistry;Physics;Education" --exec=/usr/bin/dartemis ../../PKGBUILD
	gendesk -n -f --pkgname=Athena --pkgdesc="XAS Data Processing" --name=DAthena --icon=dathena.png --terminal=false --startupnotify=true --categories="Science;Chemistry;Physics;Education" --exec=/usr/bin/dathena ../../PKGBUILD
 	cp "Hephaestus.desktop"  ${pkgdir}/usr/share/applications
 	cp "Artemis.desktop"  ${pkgdir}/usr/share/applications
 	cp "Athena.desktop"  ${pkgdir}/usr/share/applications
}
