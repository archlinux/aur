# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Dustin Falgout <dustin@falgout.us>
pkgname='ttf-google-fonts-typewolf'
pkgver='20240105'
_commit='e10dd01507a2a015ddbe8140aae06354dce94889'
pkgrel='1'
pkgdesc="Typewolf's curated collection of the 40 best fonts from the Google Fonts project"
arch=('any')
url='https://www.typewolf.com/google-fonts'
license=('OFL-1.1-no-RFN' 'OFL-1.1-RFN')
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
	'ttf-ibm-plex-git'
	'ttf-ibm-plex'
	# These packages don't use correct provides, so we have to conflict
	'lora-font-git'
)
_ignore=(
	'Inconsolata[wdth,wght].ttf'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/fonts/archive/$_commit.tar.gz")
sha512sums=('df2467e8a863c5132f73f3233290c0ed1d00c037e36dc10bbafbd97836860705ad7138b473287d44d1cc3e39821ace7a4ebc416a7e8afe93ab792ef84ae66049')

package() {
	cd "$srcdir/fonts-$_commit/"

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

	install -dm755 "$pkgdir/usr/share/fonts/TTF"

	find . \
		-type f \
		-regextype egrep \
		-regex ".*/($_regex)/.+\.ttf" \
		! -regex ".*/($_ignoreregex)" \
		-execdir install -Dm644 '{}' "$pkgdir/usr/share/fonts/TTF" \;
}
