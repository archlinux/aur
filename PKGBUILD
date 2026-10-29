# Maintainer: Ron Asimi <ron.asimi@gmail.com>
pkgname=raveo-ttf-hinted
_raveover=1.1
_nfver=3.4.0
pkgver="${_raveover}"
pkgrel=2
pkgdesc='Raveo is a warmer modification of Inter with redrawn glyphs, distributed with optional hinting and Nerd Fonts patching.'
arch=('any')
url='https://github.com/jakubfoglar/raveo'
license=('custom:OFL')
depends=('fontconfig')
makedepends=('python' 'fontforge' 'parallel' 'ttfautohint')
conflicts=('raveo-ttf')
source=(
		"Raveo.${_raveover}.zip::https://github.com/jakubfoglar/raveo/releases/download/v${_raveover}/Raveo.${_raveover}.zip"
		"font-patcher-$_nfver::https://github.com/ryanoasis/nerd-fonts/releases/download/v$_nfver/FontPatcher.zip"
		"make_features.py")
sha256sums=('9c2adf3bd7cbeb39d335bf0e70c588c9c20e404d247bff21c403340040b77dfd'
            'a8f11e511ed7c69e96680858c06b50a643ea7752e26d5cd13dd5e5cc53ab1760'
            '0723caa5f49782372701905a5acbc577cb7437a87fd30d9b30524a499a505632')

# ── FEATURE_DEFAULTS / FEATURE_FAMILY (both optional, empty by default) ──────
#
#  FEATURE_DEFAULTS  "tag,tag,..."  Bake these GSUB features into the font's
#                    'calt' feature, so that EVERY renderer applies them, not
#                    only pango. fontconfig's fontfeatures is read by pango/GTK
#                    alone; Chromium, Electron, Qt and LibreOffice ignore it, and
#                    a browser can only ask from page CSS. A shaper applies a
#                    fixed list of features whatever the font declares, so
#                    moving a feature's lookups into calt is the only way to
#                    make it a default.
#
#                    Be aware that Raveo 1.1 has almost nothing to bake. Audited
#                    with fontTools + HarfBuzz: calt (only the nerd-font PUA
#                    substitutions), case (parens/brackets to .case forms),
#                    ccmp, dlig (nothing fires), ordn (nothing fires), pnum
#                    (no-op), tnum (tabular figures and .tf spaced punctuation).
#                    There are NO ssXX, cvXX, zero or smcp features at all, so
#                    a tag set copied from Inter (zero,ss01,ss03,cv01,...) does
#                    nothing here - which is exactly what the Raveo Variable
#                    block in ~/.config/fontconfig/fonts.conf used to ask for.
#                    Suggested: leave it empty. "tnum" would make the figures
#                    tabular everywhere, "case" raises the brackets.
#
#  FEATURE_FAMILY  "Name"  Install as another family instead of in place, so
#                    the stock Raveo stays available.
#
#  Never aalt/ordn/salt: make_features.py refuses those without --allow-risky.

	FONT_TYPE=""
	HINTING=false
	HINT_MODE=""
	NERD=false

	build(){
	# Prompt for font type preference. Without a TTY (makepkg </dev/null,
	# chroot, CI, an AUR helper's non-interactive build) nothing is read:
	# FONT_TYPE / NERD / HINTING / HINT_MODE from the environment win, and the
	# defaults below apply. makepkg runs build() with set -e, so a read at EOF
	# used to abort the whole build.
	if [[ -t 0 ]]; then
		echo "Do you prefer Variable Fonts or Static TTF Fonts?"
		select font_type in "Variable Font (TTF)" "Static OTF Fonts"; do
			break
		done
	else
		echo "==> Non-interactive build (no TTY): using the environment / defaults."
		case "${FONT_TYPE:-variable}" in
			variable) font_type="Variable Font (TTF)" ;;
			otf|static) font_type="Static OTF Fonts" ;;
			*) font_type="$FONT_TYPE" ;;
		esac
	fi

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
	if [[ -t 0 ]]; then
		echo "Do you want to patch the fonts with Nerd Fonts glyphs? (y/n)"
		read -p "(default: n) " _nerd_answer || _nerd_answer=""
	fi
	if [[ -n "${NERD:-}" ]]; then
		_nerd_answer=$([[ "$NERD" == true || "$NERD" == y ]] && echo y || echo n)
	else
		_nerd_answer=${_nerd_answer:-n}
	fi
	if [[ $_nerd_answer == y ]]; then
		NERD=true
	else
		NERD=false
	fi

	# Prompt for hinting preference
	if [[ -t 0 ]]; then
		echo "Do you want to enable font hinting? (y/n)"
		read -p "(default: n) " _hint_answer || _hint_answer=""
	fi
	if [[ -n "${HINTING:-}" ]]; then
		_hint_answer=$([[ "$HINTING" == true || "$HINTING" == y ]] && echo y || echo n)
	fi

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
		if [[ -t 0 && -z "${HINT_MODE:-}" ]]; then
			echo "Select ttfautohint mode:"
			select _hint_mode in "Balanced (qqq)" "Aggressive (sss)" "HiDPI (nnn)"; do
				case $_hint_mode in
					"Balanced (qqq)") HINT_MODE="qqq"; break;;
					"Aggressive (sss)") HINT_MODE="sss"; break;;
					"HiDPI (nnn)") HINT_MODE="nnn"; break;;
				esac
			done
		fi
		HINT_MODE="${HINT_MODE:-qqq}"
	else
		HINTING=false
	fi

	# ── Step 3: bake features (FEATURE_DEFAULTS; empty = skip) ────────────────
	# Last step, on the files that will be installed, so ttfautohint never sees
	# the extra lookups.
	FEATURE_DEFAULTS="${FEATURE_DEFAULTS:-}"
	FEATURE_FAMILY="${FEATURE_FAMILY:-}"
	rm -rf "$srcdir/featured"

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

	if [[ -n "$FEATURE_DEFAULTS" ]]; then
		_fam=()
		[[ -n "$FEATURE_FAMILY" ]] && _fam=(--family "$FEATURE_FAMILY")
		echo "==> Baking $FEATURE_DEFAULTS into calt${FEATURE_FAMILY:+ (as '$FEATURE_FAMILY')}..."
		python "$srcdir/make_features.py" --features "$FEATURE_DEFAULTS" \
			"${_fam[@]+"${_fam[@]}"}" -o "$srcdir/featured" "$srcdir/forinstall/"*.[ot]tf
	fi
}

package() {
	cd "$srcdir"

	install -d -m755 "$pkgdir/usr/share/licenses/$pkgname"
	install -D -m644 "$srcdir/raveo/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

	install -d -m755 "$pkgdir/usr/share/fonts/raveo"
	# Baked copies, when the build made them (package() runs in its own shell,
	# so the directory existing is the state).
	_src="$srcdir/forinstall"
	if ls "${srcdir}/featured"/*.[ot]tf > /dev/null 2>&1; then _src="$srcdir/featured"; fi
	if ls "$_src"/*.ttf > /dev/null 2>&1; then
		install -D -m644 "$_src"/*.ttf "$pkgdir/usr/share/fonts/raveo"
	elif ls "$_src"/*.otf > /dev/null 2>&1; then
		install -D -m644 "$_src"/*.otf "$pkgdir/usr/share/fonts/raveo"
	fi
}
