# Maintainer: András Wacha <awacha at gmail>
pkgname=demeter
pkgver=0.9.26
pkgrel=1
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

sha512sums=('1e79fba4a5a6da35e6d3b353455d7c17b3af5455ee43288d644524ebdb15cba483ebd57d6cf216b71f3983b29dddd3762248758f5565ee770d6f695538b6f112'
            '78cd3f5cef6e990f386c6161e214b6e4986e2cccf3019b1766f3ce97cb81b40804092d85a7f532e76fd0e5185940ea0a3b9dd01315ffc177fcca75164b1940f5'
            '43457010f1d7251c606380c0a4ca9faa601be627d37476c4a23dd1d4715c1793bfbdfb45dd8925c2fe8b92b9d1f4798f05b22a4898633a2b6e9b702cafe767a7'
            '4f7b47ed4b09226fe494b52ca9f51d0ac2a12e816507bd279c6cfde14c356f5843740c0d2c01781eaf0c0b8ad3a0d49a617d1a5ccc1af67d67bae26498adc1d3')

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
