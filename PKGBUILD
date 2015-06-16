# Maintainer: Sebastian Wilzbach < sebi at wilzbach dot me >
pkgname=biopieces
pkgver=r2311
pkgrel=1
epoch=
pkgdesc="Bioinformatic framework of tools easily used and easily created"
arch=("any")
url="http://biopieces.googlecode.com/"
license=('GPL2')
groups=()
depends=('perl' 'ruby' "perl-svg" "perl-bit-vector" "perl-term-readkey" "perl-dbi" "perl-xml-parser" "perl-carp-clan" 
	"perl-class-inspector" "perl-html-parser" "perl-soap-lite" "perl-uri" "perl-inline" "perl-parse-recdescent" "perl-dbd-mysql"
	'ruby-gnuplot' 'ruby-narray' 'perl-json-xs' 'python2' 'ruby-rubyinline' 'ruby-terminal-table')
makedepends=("svn")
checkdepends=()
optdepends=('rubyinline' 'blast: legacy blast'  'gnuplot' 'blat' 'ray' 'bwa' 'bowtie' 'bowtie2' 'hmmer' 'mummer' 'muscle' 'velvet')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("biopieces::svn+http://biopieces.googlecode.com/svn/trunk"
"biopieces/bp_usage::svn+http://biopieces.googlecode.com/svn/wiki"        
"biopieces.sh")
noextract=()
md5sums=('SKIP'
'SKIP'
'8ebebd698533ae818c8cfbef4fa8e9ca')

pkgver() {
	cd "$srcdir/$pkgname"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

package() {
	cd "$pkgdir"
	mkdir -p "opt/$pkgname"

	cp -a "$srcdir/biopieces" "opt/"

	# remove svn history
	rm -r -f "opt/$pkgname/.svn"
	rm -r -f "opt/$pkgname/bp_usage/.svn"
	rm -r -f "opt/$pkgname/.makepkg"

	# patch python2 scripts
	find "opt/$pkgname/code_python" -type f -exec sed -i 's/#!\/usr\/bin\/python/&2/' {} \;

	# install exports
	install -Dm755 "$srcdir/$pkgname.sh" etc/profile.d/$pkgname.sh
	source etc/profile.d/$pkgname.sh
}

check() {
	cd "$srcdir/biopieces"

	# set the constant for the test suite
	export BP_DIR=$(pwd)
	export BP_TMP=$BP_DIR"/tmp"
	export BP_LOG="$BP_TMP/log"
	mkdir -p $BP_LOG

	# source the config
	source "bp_conf/bashrc"

	# permission to write on bp_test
	chmod a+w "bp_test"
	chmod a+w "bp_test/in"
	chmod a+w "bp_test/out"

	# calling test
	/bin/bash "bp_test/test_all"

	# remove unnecessary test output
	rm -r -f $BP_TMP
}
