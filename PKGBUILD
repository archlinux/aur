# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: Dustin Falgout <dustin@falgout.us>
pkgname='ttf-google-fonts-typewolf'
pkgver='20260112'
_commit='9c5708e735fc805514913d46d259945a3b6ba67a'
pkgrel='1'
pkgdesc="Typewolf's curated collection of the 40 best fonts from the Google Fonts project"
arch=('any')
url='https://www.typewolf.com/google-fonts'
license=('OFL-1.1-no-RFN AND OFL-1.1-RFN')
checkdepends=('fontconfig')
declare -gA _fonts=(
	['ttf-alegreya']='OFL-1.1-no-RFN'
	['ttf-alegreya-sans']='OFL-1.1-no-RFN'
	['ttf-archivo-narrow']='OFL-1.1-no-RFN'
	['ttf-bio-rhyme']='OFL-1.1-no-RFN'
	['ttf-cardo']='OFL-1.1-no-RFN'
	['ttf-chivo']='OFL-1.1-no-RFN'
	['ttf-cormorant']='OFL-1.1-no-RFN'
	['ttf-dm-sans']='OFL-1.1-no-RFN'
	['ttf-eczar']='OFL-1.1-no-RFN'
	['ttf-fira-sans']='OFL-1.1-no-RFN'
	['ttf-fraunces']='OFL-1.1-no-RFN'
	['ttf-ibm-plex-sans']='OFL-1.1-RFN'
	['ttf-ibm-plex-sans-arabic']='OFL-1.1-RFN'
	['ttf-ibm-plex-sans-devanagari']='OFL-1.1-RFN'
	['ttf-ibm-plex-sans-hebrew']='OFL-1.1-RFN'
	['ttf-ibm-plex-sans-jp']='OFL-1.1-RFN'
	['ttf-ibm-plex-sans-kr']='OFL-1.1-RFN'
	['ttf-ibm-plex-sans-thai']='OFL-1.1-RFN'
	['ttf-ibm-plex-sans-thai-looped']='OFL-1.1-RFN'
	['ttf-inconsolata']='OFL-1.1-no-RFN'
	['ttf-inknut-antiqua']='OFL-1.1-no-RFN'
	['ttf-inter']='OFL-1.1-no-RFN'
	['ttf-karla']='OFL-1.1-no-RFN'
	['ttf-lato']='OFL-1.1-RFN'
	['ttf-libre-baskerville']='OFL-1.1-RFN'
	['ttf-libre-franklin']='OFL-1.1-no-RFN'
	['ttf-lora']='OFL-1.1-RFN'
	['ttf-manrope']='OFL-1.1-no-RFN'
	['ttf-merriweather']='OFL-1.1-RFN'
	['ttf-montserrat']='OFL-1.1-no-RFN'
	['ttf-neuton']='OFL-1.1-RFN'
	['ttf-open-sans']='OFL-1.1-no-RFN'
	['ttf-playfair-display']='OFL-1.1-RFN'
	['ttf-poppins']='OFL-1.1-no-RFN'
	['ttf-proza-libre']='OFL-1.1-no-RFN'
	['ttf-pt-sans']='OFL-1.1-RFN'
	['ttf-pt-serif']='OFL-1.1-RFN'
	['ttf-raleway']='OFL-1.1-RFN'
	['ttf-roboto']='OFL-1.1-no-RFN'
	['ttf-rubik']='OFL-1.1-no-RFN'
	['ttf-source-sans3']='OFL-1.1-RFN'
	['ttf-source-serif4']='OFL-1.1-no-RFN'
	['ttf-space-grotesk']='OFL-1.1-no-RFN'
	['ttf-space-mono']='OFL-1.1-no-RFN'
	['ttf-spectral']='OFL-1.1-no-RFN'
	['ttf-syne']='OFL-1.1-no-RFN'
	['ttf-work-sans']='OFL-1.1-no-RFN'
)
provides=(
	"${!_fonts[@]}"
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
)
_ignore=(
	'Inconsolata[wdth,wght].ttf'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/fonts/archive/$_commit.tar.gz")
b2sums=('569318022d9a647c9315cbac6a72aec9f47143b547c4566d9aab3948f147a7f64ada047bef559c134f7283a126dc77941e5e4506c52464ba46a2ba0059c9a876')

_sourcedirectory="fonts-$_commit"

check() {
	# Test one font
	_checkoutput="$(fc-scan "$srcdir/$_sourcedirectory/ofl/alegreya/Alegreya[wght].ttf")"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep --quiet 'family: "Alegreya"'
}

package() {
	cd "$srcdir/$_sourcedirectory/"

	# Create parent folders
	install -dm755 "$pkgdir/usr/share/fonts/TTF/$pkgname/"
	install -dm755 "$pkgdir/usr/share/licenses/$pkgname/"

	# Escape filenames in ignore list
	_ignore="${_ignore[@]//[/\\[}"
	_ignore="${_ignore[@]//]/\\]}"
	_ignore="${_ignore[@]//./\\.}"

	# Replace spaces with pipe symbols
	_ignoreregex="${_ignore[*]// /|}"

	# Loop through each font package name
	local _font
	for _font in "${!_fonts[@]}"; do
		# Get the license of the font from the associative array
		local _license
		_license="${_fonts[${_font}]}"

		# Remove hyphens from the name
		_font="${_font[@]//-/}"

		# Remove 'ttf' from the name
		_font="${_font//ttf/}"

		# If the folder for the given font does not exist, throw an error
		if ! [ -d "ofl/$_font/" ]; then
			echo "Folder for font $_font does not exist, aborting"
			return 1
		fi

		# If the OFL.txt license file for the given font does not exist, throw an error
		if ! [ -f "ofl/$_font/OFL.txt" ]; then
			echo "OFL.txt license file for font $_font does not exist, aborting"
			return 1
		fi

		# If the OFL license type of the given font does not match, throw an error
		if [ "$_license" = 'OFL-1.1-RFN' ]; then
			# Set a flag to false
			local _licensematches
			_licensematches=0

			# Check if we'e working with OFL 1.1 and there is a RFN specified
			if grep --quiet 'SIL OPEN FONT LICENSE Version 1.1' "ofl/${_font}/OFL.txt" && head --lines 2 "ofl/${_font}/OFL.txt" | tr -d '\n' | grep --quiet 'with Reserved Font Name'; then
				_licensematches=1
			fi

			# Return based on the flag
			if [ "$_licensematches" = '0' ]; then
				echo "OFL license type $_license for font $_font does not match the license type, aborting"
				return 1
			fi
		elif [ "$_license" = 'OFL-1.1-no-RFN' ]; then
			# Set a flag to false
			local _licensematches
			_licensematches=0

			# Check if we'e working with OFL 1.1 and there is no RFN specified
			if grep --quiet 'SIL OPEN FONT LICENSE Version 1.1' "ofl/${_font}/OFL.txt" && head --lines 2 "ofl/${_font}/OFL.txt" | tr -d '\n' | grep --quiet --invert-match 'with Reserved Font Name'; then
				_licensematches=1
			fi

			# Return based on the flag
			if [ "$_licensematches" = '0' ]; then
				echo "OFL license type $_license for font $_font does not match the license type, aborting"
				return 1
			fi
		else
			echo "OFL license type $_license for font $_font is not supported, aborting"
			return 1
		fi

		# Copy TTF files for the given font
		find "ofl/${_font}/" \
			-type f \
			-name '*.ttf' \
			-regextype egrep \
			! -regex ".*/($_ignoreregex)" \
			-execdir install -Dm644 '{}' "$pkgdir/usr/share/fonts/TTF/$pkgname" \;

		# Copy license file for the given font
		install -Dm644 "ofl/${_font}/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/$_license-$_font"
	done
}
