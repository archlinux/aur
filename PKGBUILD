# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Dustin Falgout <dustin@falgout.us>
pkgname='ttf-google-fonts-typewolf'
pkgver='20201125'
_commit='5222456e6e79ff15c6ff71b6e2544386b750c11d'
pkgrel='1'
pkgdesc="Typewolf's curated collection of the 40 best fonts from the Google Fonts project"
arch=('any')
url='https://www.typewolf.com/google-fonts'
license=('custom:SIL Open Font License v1.1' 'Apache')
provides=(
	'ttf-alegreya'
	'ttf-alegreya-sans'
	'ttf-anonymous-pro'
	'ttf-archivo-narrow'
	'ttf-bio-rhyme'
	'ttf-cabin'
	'ttf-cardo'
	'ttf-chivo'
	'ttf-cormorant'
	'ttf-crimson-text'
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
	'ttf-merriweather'
	'ttf-montserrat'
	'ttf-neuton'
	'ttf-open-sans' # Apache 2.0
	'ttf-playfair-display'
	'ttf-poppins'
	'ttf-proza-libre'
	'ttf-pt-sans'
	'ttf-pt-serif'
	'ttf-raleway'
	'ttf-roboto'
	'ttf-roboto-slab' # Apache 2.0
	'ttf-rubik'
	'ttf-source-sans-pro'
	'ttf-source-serif-pro'
	'ttf-space-grotesk'
	'ttf-space-mono'
	'ttf-spectral'
	'ttf-work-sans'
	# Aliases
	'adobe-source-sans-pro-fonts'
	'adobe-source-serif-pro-fonts'
	'ttf-spacemono'
)
conflicts=(
	"${provides[@]}"
	'ttf-adobe-fonts'
	'ttf-google-fonts-git'
	'ttf-google-fonts-opinionated-git'
	'ttf-ibm-plex'
)
_ignore=(
	'ArchivoNarrow-Italic[wght].ttf'
	'ArchivoNarrow[wght].ttf'
	'Cabin[wdth,wght].ttf'
	'Cabin-Italic[wdth,wght].ttf'
	'Inconsolata[wdth,wght].ttf'
	'Karla[wght].ttf'
	'Karla-Italic[wght].ttf'
	'LibreFranklin[wght].ttf'
	'LibreFranklin-Italic[wght].ttf'
	'Lora[wght].ttf'
	'Lora-Italic[wght].ttf'
	'PlayfairDisplay[wght].ttf'
	'PlayfairDisplay-Italic[wght].ttf'
	'Raleway[wght].ttf'
	'Raleway-Italic[wght].ttf'
	'Roboto[wdth,wght].ttf'
	'Roboto-Italic[wdth,wght].ttf'
	'RobotoSlab[wght].ttf'
	'Rubik[wght].ttf'
	'Rubik-Italic[wght].ttf'
	'SpaceGrotesk[wght].ttf'
	'WorkSans[wght].ttf'
	'WorkSans-Italic[wght].ttf'
)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/google/fonts/archive/$_commit.tar.gz")
sha256sums=('c6382686ed276b22382280f3002ed9591e770e2ca2cee3650dcc888b5852b89f')

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
