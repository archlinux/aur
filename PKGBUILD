# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatroff-suite-git
pkgver=r556.d06e79c
pkgrel=2
epoch=
pkgdesc='A complete neatroff typesetting system (neatmkfn, neatroff, neatpost, neateqn, neatrefer and neatshape).'
arch=('i686' 'x86_64')
url='http://dev.rudi.ir/'
license=('ISC' 'LPL-1.02')
depends=('gsfonts-type1')
makedepends=('git')
optdepends=('troff-git: Port of Plan 9 troff (the preprocessors and the macro packages can be used with neatroff'
            'bib2ref: Converts bibtex files to refer databases'
            'ref2bib: Converts refer databases to bibtex files'
            'nref: Manages document references, it can be used as a troff preprocessor')
checkdepends=()
provides=('neatmkfn' 'neatroff' 'neatpost' 'neateqn' 'neatrefer' 'shape')
conflicts=('neatroff' 'neatroff-git' 'neatmkfn' 'neatmkfn-git'
           'neatpost' 'neatpost-git' 'neateqn' 'neateqn-git'
           'neatrefer' 'neatrefer-git' 'shape' 'neatshape')
replaces=('mktrfn')
install="${pkgname%-*}".install
source=('neatmkfn::git+https://github.com/aligrudi/neatmkfn'
        'neatroff::git+https://github.com/aligrudi/neatroff'
        'neatroff_make::git+https://github.com/aligrudi/neatroff_make'
        'neatpost::git+https://github.com/aligrudi/neatpost'
        'neathyph::git+https://github.com/aksr/neatroff-hyph'
        'neateqn::git+https://github.com/aligrudi/neateqn'
        'neatrefer::git+https://github.com/aligrudi/neatrefer'
        'http://dev.rudi.ir/neatroff.pdf'
        'http://dev.rudi.ir/neateqn.pdf')
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'ada01d6183f58aeddd7c95a341f0de85'
         '1b50637775dc7ffe3ffa15504d5508aa')
sha1sums=('SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          'SKIP'
          '83f7c6bfeb091ebf0d21ed5125d94f8648334de1'
          '9fe8ad25994a8377c084db0783401b584773e5e4')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '4569b2ea774a96831f94064e017e9cae78e5fd95f3ea0b753a7887ef3a5e2b80'
            '438bc852b9f32f3172ff4d0a5ce7573e4b578c087cc8d2f5dedc9c60b9ba67b7')

## Ghostscript Fonts Location:
FP="/usr/share/fonts/Type1/"

## FONTS directory
FDIR=/usr/share/neatroff/font

## MACROS directory
MDIR=/usr/share/neatroff/tmac

## HYPHENATION FILES
HYPH=/usr/share/neatroff/hyph

pkgver() {
	cd $srcdir/neatroff
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/neatmkfn"
	make all
	mkdir fonts || return 0

	## XXX: temporary fix until `gen.sh' is updated
	sed -i 's/NimbusSansNarrow-BoldOblique.afm/NimbusSansNarrow-BdOblique.afm/' gen.sh

	./gen.sh $FP fonts
	sed -i 's|./mkfn|neatmkfn|g' gen.sh
	cd $srcdir/neatroff
	make all FDIR=$FDIR MDIR=$MDIR
	cd $srcdir/neatpost
	make all FDIR=$FDIR
	cd $srcdir/neateqn
	make all
	cd $srcdir/neatrefer
	make all
	cd $srcdir/neatroff_make/shape
	make all
}

package() {
	cd $srcdir/neatmkfn
	install -Dm755 mkfn $pkgdir/usr/bin/neatmkfn
	install -Dm644 ../neatroff_make/man/neatmkfn.1 $pkgdir/usr/share/man/man1/neatmkfn.1
	install -Dm644 gen.sh $pkgdir/usr/share/doc/${pkgname%-*}/gen.sh
	install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README.neatmkfn
	mkdir -p $pkgdir/usr/share/${pkgname%-*-*}/font/devutf/
	cp fonts/* $pkgdir/usr/share/${pkgname%-*-*}/font/devutf/

	cd $srcdir/neatroff
	install -D -m755 roff $pkgdir/usr/bin/neatroff
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
	install -D -m644 ../neatroff.pdf $pkgdir/usr/share/doc/${pkgname%-*}/neatroff.pdf
	install -D -m644 ../neatroff_make/tmac/NOTICE $pkgdir/usr/share/licenses/${pkgname%-*}/NOTICE
	install -D -m644 ../neatroff_make/man/neatroff.1 $pkgdir/usr/share/man/man1/neatroff.1
	## copy neatroff macros
	mkdir -p $pkgdir/usr/share/${pkgname%-*-*}/tmac/
	cp -r ../neatroff_make/tmac/* $pkgdir/usr/share/${pkgname%-*-*}/tmac/
	rm -f $pkgdir/usr/share/${pkgname%-*-*}/tmac/NOTICE

	cd $srcdir/neatpost
	install -D -m755 post $pkgdir/usr/bin/neatpost
	install -D -m755 pdf $pkgdir/usr/bin/neatpdf
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README.neatpost
	install -D -m644 ../neatroff_make/man/neatpost.1 $pkgdir/usr/share/man/man1/neatpost.1

	cd $srcdir/neateqn
	install -D -m755 eqn $pkgdir/usr/bin/neateqn
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README.neateqn
	install -D -m644 ../neateqn.pdf $pkgdir/usr/share/doc/${pkgname%-*}/neateqn.pdf
	install -D -m644 ../neatroff_make/man/neateqn.1 $pkgdir/usr/share/man/man1/neateqn.1

	cd $srcdir/neatrefer
	install -D -m755 refer $pkgdir/usr/bin/neatrefer
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README.neatrefer
	install -D -m644 ../neatroff_make/man/neatrefer.1 $pkgdir/usr/share/man/man1/neatrefer.1

	cd $srcdir/neatroff_make/shape
	install -D -m755 shape $pkgdir/usr/bin/neatshape

	## copy hyphenation files
	mkdir -p $pkgdir/$HYPH
	cp -a $srcdir/neathyph/hyph/* "$pkgdir/$HYPH"

	## copy hyphenation macro file
	install -m644 $srcdir/neathyph/tmac/tmac.hyph $pkgdir/$MDIR/tmac.hyph
}
