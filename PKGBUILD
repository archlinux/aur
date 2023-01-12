# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Dustin Falgout <dustin@falgout.us>
pkgname='ttf-google-fonts-typewolf'
pkgver='20230110'
_commit='9aba8ae2d286384be87dbd12a8a5a0e16db14408'
pkgrel='1'
pkgdesc="Typewolf's curated collection of the 40 best fonts from the Google Fonts project"
arch=('any')
url='https://www.typewolf.com/google-fonts'
license=('custom:SIL Open Font License v1.1' 'Apache')
provides=(
	# OFL v1.1 if not specified
	'ttf-alegreya'
	'ttf-alegreya-sans'
	'ttf-archivo-narrow'
	'ttf-bio-rhyme'
	'ttf-cardo'
	'ttf-chivo'
	'ttf-cormorant'
	'ttf-dm-sans'
	'ttf-eczar'
	'ttf-fira-sans'
	'ttf-ibm-plex-sans'
	'ttf-inconsolata'
	'ttf-inknut-antiqua'
	'ttf-inter'
	'ttf-karla'
	'ttf-lato'
	'ttf-libre-baskerville'
	'ttf-libre-franklin'
	'ttf-lora'
	'ttf-manrope'
	'ttf-merriweather'
	'ttf-montserrat'
	'ttf-neuton'
	'ttf-open-sans'
	'ttf-playfair-display'
	'ttf-poppins'
	'ttf-proza-libre'
	'ttf-pt-sans'
	'ttf-pt-serif'
	'ttf-raleway'
	'ttf-roboto' # Apache 2.0
	'ttf-roboto-slab' # Apache 2.0
	'ttf-rubik'
	'ttf-source-sans-pro'
	'ttf-source-serif-pro'
	'ttf-space-grotesk'
	'ttf-space-mono'
	'ttf-spectral'
	'ttf-syne'
	'ttf-work-sans'
	# Aliases
	'adobe-source-sans-pro-fonts'
	'adobe-source-serif-pro-fonts'
	'montserrat-ttf'
	'ttf-librebaskerville'
	'ttf-opensans'
	'ttf-sourcesanspro'
	'ttf-spacemono'
)
conflicts=(
	"${provides[@]}"
	'adobe-source-sans-fonts'
	'adobe-source-serif-fonts'
	'ttf-adobe-fonts'
	'ttf-google-fonts-git'
	'ttf-google-fonts-opinionated-git'
	'ttf-ibm-plex'
)
_ignore=(
	'Inconsolata[wdth,wght].ttf'
	'Roboto[wdth,wght].ttf'
	'Roboto-Italic[wdth,wght].ttf'
)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/google/fonts/archive/$_commit.tar.gz")
sha512sums=('186db42ead74af1706a01317ef907774af7de90a7a557b58e8f6677565739e919839836c6c9c57af625c5e7a1e93e1a46ea2253da4fe6aa15654d8a54e25b25b')

package() {
	cd "$srcdir/fonts-$_commit/"

	install -Dm644 'ofl/alegreya/OFL.txt' "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"

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
