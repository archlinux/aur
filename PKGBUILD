# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
# Contributor: Dustin Falgout <dustin@falgout.us>
pkgname='ttf-google-fonts-typewolf'
pkgver='20.06.7993310'
_commit='799331018b4fe67a33f1d001d09304b612864568'
pkgrel='2'
pkgdesc="Typewolf's curated collection of the 40 best fonts from the Google Fonts project"
arch=('any')
url='https://www.typewolf.com/google-fonts'
license=('custom:SIL Open Font License v1.1' 'Apache')
provides=(
	'adobe-source-sans-pro-fonts'
	'adobe-source-serif-pro-fonts'
	'ttf-alegreya'
	'ttf-alegreya-sans'
	'ttf-anonymous-pro'
	'ttf-archivo-narrow'
	'ttf-arvo'
	'ttf-biorhyme'
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
	'ttf-opensans' # Apache 2.0
	'ttf-play-fair-display'
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
	'ttf-spacemono'
	'ttf-spectral'
	'ttf-worksans'
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
	'Inconsolata[wdth,wght].ttf'
	'Karla-Italic[wght].ttf'
	'Karla[wght].ttf'
	'Lora-Italic[wght].ttf'
	'Lora[wght].ttf'
	'PlayfairDisplay-Italic[wght].ttf'
	'PlayfairDisplay[wght].ttf'
	'Roboto-Italic[wdth,wght].ttf'
	'Roboto[wdth,wght].ttf'
	'RobotoSlab[wght].ttf'
	'WorkSans-Italic[wght].ttf'
	'WorkSans[wght].ttf'
)
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/google/fonts/archive/$_commit.tar.gz")
sha256sums=('fc0d93228b98c1ed12c2a62362276110a1107ff7db2c0c06f0abc6d96fc4256b')

package() {
	cd "$srcdir/fonts-$_commit"

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
