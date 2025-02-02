# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Dustin Falgout <dustin@falgout.us>
pkgname='ttf-google-fonts-typewolf'
pkgver='20250116'
_commit='2cb2f66207b904608e0e85870d8f18f2a65f69f3'
pkgrel='1'
pkgdesc="Typewolf's curated collection of the 40 best fonts from the Google Fonts project"
arch=('any')
url='https://www.typewolf.com/google-fonts'
license=('OFL-1.1-no-RFN AND OFL-1.1-RFN')
checkdepends=('fontconfig')
provides=(
	'ttf-alegreya' # OFL-1.1-no-RFN
	'ttf-alegreya-sans' # OFL-1.1-no-RFN
	'ttf-archivo-narrow' # OFL-1.1-no-RFN
	'ttf-bio-rhyme' # OFL-1.1-no-RFN
	'ttf-cardo' # OFL-1.1-no-RFN
	'ttf-chivo' # OFL-1.1-no-RFN
	'ttf-cormorant' # OFL-1.1-no-RFN
	'ttf-dm-sans' # OFL-1.1-no-RFN
	'ttf-eczar' # OFL-1.1-no-RFN
	'ttf-fira-sans' # OFL-1.1-no-RFN
	'ttf-fraunces' # OFL-1.1-no-RFN
	'ttf-ibm-plex-sans' # OFL-1.1-RFN
	'ttf-ibm-plex-sans-arabic' # OFL-1.1-RFN
	'ttf-ibm-plex-sans-devanagari' # OFL-1.1-RFN
	'ttf-ibm-plex-sans-hebrew' # OFL-1.1-RFN
	'ttf-ibm-plex-sans-jp' # OFL-1.1-RFN
	'ttf-ibm-plex-sans-kr' # OFL-1.1-RFN
	'ttf-ibm-plex-sans-thai' # OFL-1.1-RFN
	'ttf-ibm-plex-sans-thai-looped' # OFL-1.1-RFN
	'ttf-inconsolata' # OFL-1.1-no-RFN
	'ttf-inknut-antiqua' # OFL-1.1-no-RFN
	'ttf-inter' # OFL-1.1-no-RFN
	'ttf-karla' # OFL-1.1-no-RFN
	'ttf-lato' # OFL-1.1-RFN
	'ttf-libre-baskerville' # OFL-1.1-RFN
	'ttf-libre-franklin' # OFL-1.1-no-RFN
	'ttf-lora' # OFL-1.1-RFN
	'ttf-manrope' # OFL-1.1-no-RFN
	'ttf-merriweather' # OFL-1.1-RFN
	'ttf-montserrat' # OFL-1.1-no-RFN
	'ttf-neuton' # OFL-1.1-RFN
	'ttf-open-sans' # OFL-1.1-no-RFN
	'ttf-playfair-display' # OFL-1.1-RFN
	'ttf-poppins' # OFL-1.1-no-RFN
	'ttf-proza-libre' # OFL-1.1-no-RFN
	'ttf-pt-sans' # OFL-1.1-RFN
	'ttf-pt-serif' # OFL-1.1-RFN
	'ttf-raleway' # OFL-1.1-RFN
	'ttf-roboto' # OFL-1.1-no-RFN
	'ttf-rubik' # OFL-1.1-no-RFN
	'ttf-source-sans3' # OFL-1.1-RFN
	'ttf-source-serif4' # OFL-1.1-RFN
	'ttf-space-grotesk' # OFL-1.1-no-RFN
	'ttf-space-mono' # OFL-1.1-no-RFN
	'ttf-spectral' # OFL-1.1-no-RFN
	'ttf-syne' # OFL-1.1-no-RFN
	'ttf-work-sans' # OFL-1.1-no-RFN
	# Aliases
	'lora-cyrillic-font'
	'lora-font'
	'montserrat-ttf'
	'ttf-fraunces-variable'
	'ttf-librebaskerville'
	'ttf-opensans'
	'ttf-raleway-variable'
	'ttf-rubik-vf'
	'ttf-spacemono'
)
conflicts=(
	"${provides[@]}"
	 # We only provide some fonts from these packages, so no provide
	'adobe-source-sans-fonts'
	'adobe-source-serif-fonts'
	'ttf-adobe-source-sans-fonts'
	'ttf-adobe-source-serif-fonts'
	'ttf-dm-fonts'
	'ttf-google-fonts-git'
	'ttf-ibm-plex'
	# These packages don't use correct provides, so we have to conflict
	'lora-font-git'
	'ttf-ibm-plex-git'
)
_ignore=(
	'Inconsolata[wdth,wght].ttf'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/fonts/archive/$_commit.tar.gz")
b2sums=('6efbefa7e3729c5f20f4e0faee7ab6fbba6d5ecad49b15912bf4cd28a12225ab21fc758409ad34b72939f1cfb3fd67203b7186bcbca8f7d5d3221cd7eaab4538')

_sourcedirectory="fonts-$_commit"

check() {
	# Test one font
	_checkoutput="$(fc-scan "$srcdir/$_sourcedirectory/ofl/alegreya/Alegreya[wght].ttf")"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q 'family: "Alegreya"'
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	install -Dm644 'ofl/alegreya/OFL.txt' "$pkgdir/usr/share/licenses/$pkgname/OFL-1.1-no-RFN"
	install -Dm644 'ofl/ibmplexsans/OFL.txt' "$pkgdir/usr/share/licenses/$pkgname/OFL-1.1-RFN"

	# Remove hyphens from each element in array
	_fonts="${provides[@]//-/}"
	# Remove 'ttf' from each element in array
	_fonts="${_fonts[@]//ttf/}"
	# Replace spaces with pipe symbols
	_regex="${_fonts[*]// /|}"

	# Escape filenames in ignore list
	_ignore="${_ignore[@]//[/\\[}"
	_ignore="${_ignore[@]//]/\\]}"
	_ignore="${_ignore[@]//./\\.}"

	# Replace spaces with pipe symbols
	_ignoreregex="${_ignore[*]// /|}"

	install -dm755 "$pkgdir/usr/share/fonts/TTF/$pkgname/"

	find . \
		-type f \
		-regextype egrep \
		-regex ".*/($_regex)/.+\.ttf" \
		! -regex ".*/($_ignoreregex)" \
		-execdir install -Dm644 '{}' "$pkgdir/usr/share/fonts/TTF/$pkgname" \;
}
