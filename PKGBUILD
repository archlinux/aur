# Maintainer: Ron Asimi <ron.asimi@gmail.com>
pkgname=raveo-ttf-hinted
_raveover=1.1
_nfver=3.4.0
pkgver="${_raveover}"
pkgrel=1
pkgdesc='Raveo is a warmer modification of Inter with redrawn glyphs, distributed with optional hinting and Nerd Fonts patching.'
arch=('any')
url='https://github.com/jakubfoglar/raveo'
license=('custom:OFL')
depends=('fontconfig')
makedepends=('python' 'fontforge' 'parallel' 'ttfautohint')
conflicts=('raveo-ttf')
source=(
		"Raveo.${_raveover}.zip::https://github.com/jakubfoglar/raveo/releases/download/v${_raveover}/Raveo.${_raveover}.zip"
		"font-patcher-$_nfver::https://github.com/ryanoasis/nerd-fonts/releases/download/v$_nfver/FontPatcher.zip")
sha256sums=('9c2adf3bd7cbeb39d335bf0e70c588c9c20e404d247bff21c403340040b77dfd'
            'a8f11e511ed7c69e96680858c06b50a643ea7752e26d5cd13dd5e5cc53ab1760')

	FONT_TYPE=""
	HINTING=false
	HINT_MODE=""
	NERD=false

	build(){
	# Prompt for font type preference
	echo "Do you prefer Variable Fonts or Static TTF Fonts?"
	select font_type in "Variable Font (TTF)" "Static OTF Fonts"; do
		break
	done

	# Set the font type variable
	case $font_type in
		"Variable Font (TTF)")
			FONT_TYPE="variable"
			;;
		"Static OTF Fonts")
			FONT_TYPE="otf"
			;;
		*)
			echo "Invalid choice. Exiting."
			exit 1
			;;
	esac

	# Prompt for Nerd Fonts patching preference
	echo "Do you want to patch the fonts with Nerd Fonts glyphs? (y/n)"
	read -p "(default: n) " _nerd_answer
	_nerd_answer=${_nerd_answer:-n}
	if [[ $_nerd_answer == y ]]; then
		NERD=true
	else
		NERD=false
	fi

	# Prompt for hinting preference
	echo "Do you want to enable font hinting? (y/n)"
	read -p "(default: n) " _hint_answer

	# Set default value if no input
	_hint_answer=${_hint_answer:-n}

	# Convert y/n to true/false
	if [[ $_hint_answer == y ]]; then
		if [[ $FONT_TYPE != "variable" ]]; then
			echo "Error: hinting via ttfautohint is only supported for TTF fonts."
			echo "The static fonts are OTF (CFF) which ttfautohint does not support."
			echo "Please re-run and select Variable Font (TTF) if you want hinting."
			exit 1
		fi
		HINTING=true

		# Prompt for hint mode preference
		echo "Select ttfautohint mode:"
		select _hint_mode in "Balanced (qqq)" "Aggressive (sss)" "HiDPI (nnn)"; do
			case $_hint_mode in
				"Balanced (qqq)") HINT_MODE="qqq"; break;;
				"Aggressive (sss)") HINT_MODE="sss"; break;;
				"HiDPI (nnn)") HINT_MODE="nnn"; break;;
			esac
		done
	else
		HINTING=false
	fi

	# Print variables for debugging
	echo "FONT_TYPE:  $FONT_TYPE"
	echo "NERD:       $NERD"
	echo "HINTING:    $HINTING"
	echo "HINT_MODE:  $HINT_MODE"

	mkdir -p "$srcdir/forinstall"

	if [[ "$FONT_TYPE" == "variable" ]]; then
		mkdir -p "$srcdir/work"
		# Keep only the full desktop TTF, not the web-only woff2 files
		cp "$srcdir/raveo/fonts/variable/RaveoVF.ttf" "$srcdir/work/"
		cd "$srcdir/work"
	else
		cd "$srcdir/raveo/fonts/static"
		# Drop woff2 web fonts — package only OTF desktop fonts
		rm -f ./*.woff2
	fi

	# ── Step 1: Nerd Fonts patching ────────────────────────────────────────────
	# NOTE: font-patcher (FontForge) strips all hint bytecode during patching.
	# Therefore we ALWAYS patch first, then hint — hinting before patching is
	# pointless as the hints would be discarded. This also ensures ttfautohint
	# sees the complete final glyph set including the newly added Nerd Fonts icons.
	if [[ $NERD == true ]]; then
		mkdir -p "$srcdir/nerd-patched"
		printf "%b" "\e[1;33m==> WARNING: \e[0mNow patching all fonts with Nerd Fonts glyphs. This will take very long...\n"
		if [[ "$FONT_TYPE" == "otf" ]]; then
			parallel -j$(nproc) python "$srcdir/font-patcher" \
				--variable-width-glyphs -q -c {} \
				-out "$srcdir/nerd-patched" &> /dev/null ::: ./*.otf
		else
			parallel -j$(nproc) python "$srcdir/font-patcher" \
				--variable-width-glyphs -q -c {} \
				-out "$srcdir/nerd-patched" &> /dev/null ::: ./*.ttf
		fi
		# Work on the nerd-patched fonts from here on
		cd "$srcdir/nerd-patched"
	fi

	# ── Step 2: Hinting ────────────────────────────────────────────────────────
	if [[ $HINTING == true ]]; then
		mkdir -p hinted
		for f in ./*.ttf ; do
			## HINT_MODE options:
			##   qqq  Balanced  — good Linux balance
			##   sss  Aggressive — maximize contrast at small sizes (low-DPI screens)
			##   nnn  HiDPI      — natural stem widths, minimal distortion at 2x scaling
			case $HINT_MODE in
				qqq) _xheight=14;;
				sss) _xheight=14;;
				nnn) _xheight=12;;
			esac
			ttfautohint \
			--hinting-range-min=8 \
			--hinting-range-max=48 \
			--hinting-limit=200 \
			--increase-x-height=$_xheight \
			--x-height-snapping-exceptions="" \
			--fallback-script=grek \
			--default-script=latn \
			--stem-width-mode=$HINT_MODE \
			--no-info \
			--ignore-restrictions \
			"${f}" "./hinted/${f}"
		done

		cp ./hinted/* "$srcdir/forinstall"
	else
		if ls ./*.ttf > /dev/null 2>&1; then
			echo "copying ttf fonts"
			cp ./*.ttf "$srcdir/forinstall"
		elif ls ./*.otf > /dev/null 2>&1; then
			echo "copying otf fonts"
			cp ./*.otf "$srcdir/forinstall"
		fi
	fi

}

package() {
	cd "$srcdir"

	install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
	install -D -m644 "$srcdir/raveo/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

	install -d -m755 "$pkgdir/usr/share/fonts/raveo"
	if ls "${srcdir}/forinstall"/*.ttf > /dev/null 2>&1; then
		install -D -m644 "$srcdir/forinstall"/*.ttf "$pkgdir/usr/share/fonts/raveo"
	elif ls "${srcdir}/forinstall"/*.otf > /dev/null 2>&1; then
		install -D -m644 "$srcdir/forinstall"/*.otf "$pkgdir/usr/share/fonts/raveo"
	fi
}
