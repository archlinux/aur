# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatroff-git
pkgver=r556.d06e79c
pkgrel=1
pkgdesc='An implementation of troff typesetting system in C programming language.'
arch=('i686' 'x86_64')
url='http://dev.rudi.ir/'
license=('ISC' 'LPL-1.0')
depends=('neatmkfn-git')
makedepends=('git')
optdepends=('neatpost-git: Postscript postprocessor for neatroff.'
            'neateqn-git: An eqn preprocessor for neatroff.'
            'neatroff-hyph: Hyphenation files (patterns, exceptions and mappings).'
            'neatrefer-git: A small refer clone for managing bibliographic references.'
            'neatshape: A farsi/arabic shaping preprocessor for troff.')
checkdepends=()
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+https://github.com/aligrudi/neatroff"
        'git+https://github.com/aligrudi/neatroff_make'
        'http://dev.rudi.ir/neatroff.pdf')
md5sums=('SKIP'
         'SKIP'
         'ada01d6183f58aeddd7c95a341f0de85')

## FONTS directory
FDIR=/usr/share/neatroff/font

## MACROS directory
MDIR=/usr/share/neatroff/tmac

pkgver() {
	cd $srcdir/$pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make all FDIR=$FDIR MDIR=$MDIR
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 roff $pkgdir/usr/bin/neatroff
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
	install -D -m644 ../neatroff.pdf $pkgdir/usr/share/doc/${pkgname%-*}/neatroff.pdf
	install -D -m644 ../neatroff_make/tmac/NOTICE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
	install -D -m644 ../neatroff_make/man/neatroff.1 $pkgdir/usr/share/man/man1/neatroff.1
	## copy neatroff macros
	mkdir -p $pkgdir/usr/share/neatroff/tmac/
	cp -r ../neatroff_make/tmac/* $pkgdir/usr/share/neatroff/tmac/
	rm -f $pkgdir/usr/share/neatroff/tmac/NOTICE
}
