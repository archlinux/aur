# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatroff-suite-git
pkgver=r443.2b1a13e
pkgrel=1
epoch=
pkgdesc="A complete neatroff typesetting system (neatmkfn, neatroff, neatpost, neateqn and neatrefer)."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
license=('ISC' 'Lucent Public License')
groups=()
depends=('gsfonts')
makedepends=('git')
optdepends=('troff-git: The preprocessors and the macro packages can be used with neatroff'
            'bib2ref: converts bibtex files to refer databases'
            'ref2bib: converts refer databases to bibtex files'
            'nref: manages document references, it can be used as a troff preprocessor'
            'shape: A farsi/arabic shaping preprocessor for troff')
checkdepends=()
provides=('neatmkfn' 'neatroff' 'neatpost' 'neateqn' 'neatrefer')
conflicts=('neatroff' 'neatroff-git' 'neatmkfn' 'neatmkfn-git' 
           'neatpost' 'neatpost-git' 'neateqn' 'neateqn-git'
           'neatrefer' 'neatrefer-git')
replaces=('mktrfn')
backup=()
options=()
changelog=
install=${pkgname%-*}.install
source=("neatmkfn::git://repo.or.cz/neatmkfn.git"
        "neatroff::git+git://repo.or.cz/neatroff.git"
        "neatroff-dir::git+git://repo.or.cz/neatroff.git#branch=dir"
        "neatroff_make::git://repo.or.cz/neatroff_make.git"
        "neatpost::git://repo.or.cz/neatpost.git"
        "neateqn::git://repo.or.cz/neateqn.git"
        "neatrefer::git://repo.or.cz/neatrefer.git"
        "http://litcave.rudi.ir/neatroff.pdf"
        "http://litcave.rudi.ir/neateqn.pdf")
noextract=()
md5sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
sha1sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

## Ghostscript Fonts Location:
FP="/usr/share/fonts/Type1/"

## FONTS directory 
FDIR=/usr/share/neatroff/font

## MACROS directory
MDIR=/usr/share/neatroff/tmac

## HYPHENATION FILES
HYPH=/usr/share/neatroff/hyph

prepare() {
  cd "$srcdir/"
  mkdir hyph/ || return 0

  LNG=(en-us de-1996 fr es it ru)
  LNK="ftp://ftp.ctan.org/tex-archive/language/hyph-utf8/tex/generic/hyph-utf8/patterns/txt/"
  for i in "${LNG[@]}"; do
    for j in "pat.txt" "hyp.txt" "chr.txt"; do
      curl -f -o hyph/hyph-${i}.$j ${LNK}hyph-${i}.$j
    done
  done
}

pkgver() {
  cd $srcdir/neatroff
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/neatmkfn"
  make all
  mkdir fonts || return 0
  ./gen.sh $FP fonts
  sed -i 's|./mkfn|neatmkfn|g' gen.sh
  cd $srcdir/neatroff
  make all FDIR=$FDIR MDIR=$MDIR
  cd $srcdir/neatroff-dir
  make all FDIR=$FDIR MDIR=$MDIR
  cd $srcdir/neatpost
  make all FDIR=$FDIR
  cd $srcdir/neateqn
  make all
  cd $srcdir/neatrefer
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
  install -Dm755 roff $pkgdir/usr/bin/neatroff
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
  install -Dm644 ../neatroff.pdf $pkgdir/usr/share/doc/${pkgname%-*}/neatroff.pdf
  install -Dm644 ../neatroff_make/tmac/NOTICE $pkgdir/usr/share/licenses/${pkgname%-*}/NOTICE
  install -Dm644 ../neatroff_make/man/neatroff.1 $pkgdir/usr/share/man/man1/neatroff.1
  ## copy neatroff macros
  mkdir -p $pkgdir/usr/share/${pkgname%-*-*}/tmac/
  cp -r ../neatroff_make/tmac/* $pkgdir/usr/share/${pkgname%-*-*}/tmac/
  rm -f $pkgdir/usr/share/${pkgname%-*-*}/tmac/NOTICE
  cd $srcdir/neatroff-dir
  install -Dm755 roff $pkgdir/usr/bin/neatroff-dir

  cd $srcdir/neatpost
  install -Dm755 post $pkgdir/usr/bin/neatpost
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README.neatpost
  install -Dm644 ../neatroff_make/man/neatpost.1 $pkgdir/usr/share/man/man1/neatpost.1

  cd $srcdir/neateqn
  install -Dm755 eqn $pkgdir/usr/bin/neateqn
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README.neateqn
  install -Dm644 ../neateqn.pdf $pkgdir/usr/share/doc/${pkgname%-*}/neateqn.pdf
  install -Dm644 ../neatroff_make/man/neateqn.1 $pkgdir/usr/share/man/man1/neateqn.1

  cd $srcdir/neatrefer
  install -Dm755 refer $pkgdir/usr/bin/neatrefer
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/README.neatrefer
  install -Dm644 ../neatroff_make/man/neatrefer.1 $pkgdir/usr/share/man/man1/neatrefer.1

  ## copy hyphenation files
  mkdir -p "$pkgdir/$HYPH"
  cp -a $srcdir/hyph/* "$pkgdir/$HYPH"
}

