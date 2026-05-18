# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=nerd-fonts-apple-hinted
_nfver=3.4.0
pkgver=3.4.0
pkgrel=1
pkgdesc="Apple fonts (SF Pro, SF Compact, SF Mono, SF Arabic, NY), optionally Nerd Fonts patched and/or ttfautohint hinted"
arch=(any)
url="https://developer.apple.com/fonts/"
license=("custom")
makedepends=("p7zip" "python" "python-fonttools" "parallel" "fontforge" "ttfautohint" "libarchive")
options=(!strip !zipman)
conflicts=("nerd-fonts-apple" "apple-fonts" "nerd-fonts-sf-mono")
provides=("nerd-fonts-apple" "ttf-font-nerd")
source=(
  "SF-Pro.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg"
  "SF-Compact.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg"
  "SF-Mono.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg"
  "SF-Arabic.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Arabic.dmg"
  "NY.dmg::https://devimages-cdn.apple.com/design/resources/download/NY.dmg"
  "font-patcher-${_nfver}::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "otf2ttf.py::https://raw.githubusercontent.com/fonttools/fonttools/main/Snippets/otf2ttf.py"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

# ── Build-time options (all settable via env vars) ──────────────────────────
#
#  NERD_PATCH  true/false   Patch fonts with Nerd Fonts glyphs (default: true)
#                           false → install fonts as-is (static OTF or variable TTF)
#
#  WANT_VARIABLE  true/false  Include variable TTF fonts when NERD_PATCH=false.
#                             (Variable fonts are excluded when patching — font-patcher
#                             destroys fvar/gvar axes during generation.)
#                             Ignored when NERD_PATCH=true.
#
#  HINTING   true/false      Apply ttfautohint (default: false)
#                            When NERD_PATCH=true:  hints the patched TTF output.
#                            When NERD_PATCH=false: converts static OTF→TTF first,
#                            then hints. Variable TTFs are hinted directly (axes
#                            are destroyed by ttfautohint — you get a static TTF).
#
#  HINT_MODE  nnn|qqq|qsq|sss   3-char stem-width mode string for ttfautohint:
#               pos1=grayscale  pos2=GDI ClearType  pos3=DW ClearType
#               n=natural  q=quantized  s=strong
#               nnn=HiDPI  qqq=balanced  sss=aggressive low-DPI
#
#  Font family selection:
#  WANT_SF_PRO      true/false   (default: true)
#  WANT_SF_COMPACT  true/false   (default: false)
#  WANT_SF_MONO     true/false   (default: true)
#  WANT_SF_ARABIC   true/false   (default: false)
#  WANT_NY          true/false   (default: true)
#
#  Subfamily selection (space-separated, empty = all):
#  SF_PRO_SUBS      e.g. "Display Text Rounded"
#  SF_COMPACT_SUBS  e.g. "Display Text Rounded"
#  NY_SUBS          e.g. "Small Medium Large ExtraLarge"
#
#  Non-interactive examples:
#    NERD_PATCH=true  HINTING=true  HINT_MODE=qqq  SF_PRO_SUBS="Text" makepkg -si
#    NERD_PATCH=false WANT_VARIABLE=true HINTING=false makepkg -si
# ────────────────────────────────────────────────────────────────────────────

_validate_hint_mode() {
  if [[ ! "$HINT_MODE" =~ ^[nqs]{3}$ ]]; then
    echo "Error: HINT_MODE='$HINT_MODE' is invalid."
    echo "  Must be 3 chars from: n (natural)  q (quantized)  s (strong)"
    echo "  Examples: nnn  qqq  qsq  sss"
    exit 1
  fi
}

_show()    { printf "  [%s] %s\n" "$1" "$2"; }
_ask_yn()  { local _default="${2:-n}"; read -p "  $1? (default: $_default) " _yn; _yn="${_yn:-$_default}"; }
_ask_multi() {
  local _label="$1"; shift; local _opts=("$@"); local _n=${#_opts[@]}
  echo "    Subfamilies (space-separated numbers, or Enter/a for all):"
  for (( i=0; i<_n; i++ )); do printf "      %d) %s\n" "$((i+1))" "${_opts[$i]}"; done
  read -p "    > " _raw; _sel=""
  if [[ "$_raw" =~ ^[aA]$ || -z "$_raw" ]]; then
    _sel="${_opts[*]}"
  else
    for _tok in $_raw; do
      local _idx=$(( _tok - 1 ))
      (( _idx >= 0 && _idx < _n )) && _sel="$_sel ${_opts[$_idx]}"
    done
    _sel="${_sel# }"
  fi
}

build() {
  # ══════════════════════════════════════════════════════════════════════════
  # Prompt section — all questions, only when env vars are not pre-set
  # ══════════════════════════════════════════════════════════════════════════
  echo ""
  echo "╔══════════════════════════════════════════════════════╗"
  echo "║       nerd-fonts-apple-hinted — build options        ║"
  echo "╚══════════════════════════════════════════════════════╝"

  # ── Nerd Fonts patching ──────────────────────────────────────────────────
  if [[ -z "${NERD_PATCH:-}" ]]; then
    _ask_yn "Patch fonts with Nerd Fonts glyphs" y
    [[ "$_yn" =~ ^[yY]$ ]] && NERD_PATCH=true || NERD_PATCH=false
  fi
  NERD_PATCH="${NERD_PATCH:-true}"

  # ── Variable fonts (only relevant when not patching) ─────────────────────
  if [[ "$NERD_PATCH" == false && -z "${WANT_VARIABLE:-}" ]]; then
    echo ""
    echo "  Variable fonts (SF Pro, SF Compact, New York) contain all weights"
    echo "  in a single file with fvar/gvar axes. They are excluded when"
    echo "  patching because font-patcher destroys variable axes."
    _ask_yn "Include variable TTF fonts" y
    [[ "$_yn" =~ ^[yY]$ ]] && WANT_VARIABLE=true || WANT_VARIABLE=false
  fi
  # Variable fonts are never compatible with Nerd Fonts patching
  [[ "$NERD_PATCH" == true ]] && WANT_VARIABLE=false
  WANT_VARIABLE="${WANT_VARIABLE:-false}"

  # ── Hinting ──────────────────────────────────────────────────────────────
  if [[ -z "${HINTING:-}" ]]; then
    echo ""
    if [[ "$NERD_PATCH" == false ]]; then
      echo "  Note: hinting static OTFs requires OTF→TTF conversion (via fonttools)."
      echo "        Hinting variable TTFs flattens their axes to a static instance."
    fi
    _ask_yn "Apply ttfautohint hinting" n
    [[ "$_yn" =~ ^[yY]$ ]] && HINTING=true || HINTING=false
  fi
  HINTING="${HINTING:-false}"

  if [[ "$HINTING" == true && -z "${HINT_MODE:-}" ]]; then
    echo ""
    echo "  Hinting stem-width mode:"
    select _choice in "Balanced (qqq)" "HiDPI (nnn)" "Aggressive (sss)" "Custom"; do
      case "$_choice" in
        "Balanced (qqq)")   HINT_MODE=qqq; break ;;
        "HiDPI (nnn)")      HINT_MODE=nnn; break ;;
        "Aggressive (sss)") HINT_MODE=sss; break ;;
        "Custom") read -p "  Enter 3-char mode (e.g. qsq): " HINT_MODE; break ;;
      esac
    done
  fi
  HINT_MODE="${HINT_MODE:-qqq}"
  [[ "$HINTING" == true ]] && _validate_hint_mode

  # ── Font family & subfamily selection ────────────────────────────────────
  if [[ -z "${WANT_SF_PRO:-}${WANT_SF_COMPACT:-}${WANT_SF_MONO:-}${WANT_SF_ARABIC:-}${WANT_NY:-}" ]]; then
    echo ""
    echo "  ── Font families ────────────────────────────────────────"

    _ask_yn "Include SF Pro" y
    if [[ "$_yn" =~ ^[yY]$ ]]; then
      WANT_SF_PRO=true
      if [[ -z "${SF_PRO_SUBS:-}" ]]; then
        echo "  SF Pro subfamilies:"
        _ask_multi "SF Pro" "Display" "Text" "Rounded"
        SF_PRO_SUBS="$_sel"
      fi
    else
      WANT_SF_PRO=false
    fi

    _ask_yn "Include SF Compact" n
    if [[ "$_yn" =~ ^[yY]$ ]]; then
      WANT_SF_COMPACT=true
      if [[ -z "${SF_COMPACT_SUBS:-}" ]]; then
        echo "  SF Compact subfamilies:"
        _ask_multi "SF Compact" "Display" "Text" "Rounded"
        SF_COMPACT_SUBS="$_sel"
      fi
    else
      WANT_SF_COMPACT=false
    fi

    _ask_yn "Include SF Mono" y
    [[ "$_yn" =~ ^[yY]$ ]] && WANT_SF_MONO=true || WANT_SF_MONO=false

    _ask_yn "Include SF Arabic" n
    [[ "$_yn" =~ ^[yY]$ ]] && WANT_SF_ARABIC=true || WANT_SF_ARABIC=false

    _ask_yn "Include New York" y
    if [[ "$_yn" =~ ^[yY]$ ]]; then
      WANT_NY=true
      if [[ -z "${NY_SUBS:-}" ]]; then
        echo "  New York subfamilies:"
        _ask_multi "New York" "Small" "Medium" "Large" "ExtraLarge"
        NY_SUBS="$_sel"
      fi
    else
      WANT_NY=false
    fi
  fi

  WANT_SF_PRO="${WANT_SF_PRO:-true}"
  WANT_SF_COMPACT="${WANT_SF_COMPACT:-false}"
  WANT_SF_MONO="${WANT_SF_MONO:-true}"
  WANT_SF_ARABIC="${WANT_SF_ARABIC:-false}"
  WANT_NY="${WANT_NY:-true}"

  if [[ "$WANT_SF_PRO$WANT_SF_COMPACT$WANT_SF_MONO$WANT_SF_ARABIC$WANT_NY" != *true* ]]; then
    echo "Error: no font families selected. Aborting."; exit 1
  fi

  # ── Build summary ─────────────────────────────────────────────────────────
  echo ""
  echo "  ── Build summary ───────────────────────────────────────"
  printf "  NERD_PATCH:    %s\n" "$NERD_PATCH"
  printf "  WANT_VARIABLE: %s\n" "$WANT_VARIABLE"
  printf "  HINTING:       %s%s\n" "$HINTING" "$( [[ "$HINTING" == true ]] && echo "  (mode=$HINT_MODE)" )"
  echo ""
  _show "$( [[ "$WANT_SF_PRO"     == true ]] && echo "x" || echo " " )" "SF Pro      ${SF_PRO_SUBS:+(subfamilies: $SF_PRO_SUBS)}"
  _show "$( [[ "$WANT_SF_COMPACT" == true ]] && echo "x" || echo " " )" "SF Compact  ${SF_COMPACT_SUBS:+(subfamilies: $SF_COMPACT_SUBS)}"
  _show "$( [[ "$WANT_SF_MONO"    == true ]] && echo "x" || echo " " )" "SF Mono"
  _show "$( [[ "$WANT_SF_ARABIC"  == true ]] && echo "x" || echo " " )" "SF Arabic"
  _show "$( [[ "$WANT_NY"         == true ]] && echo "x" || echo " " )" "New York    ${NY_SUBS:+(subfamilies: $NY_SUBS)}"
  echo "  ────────────────────────────────────────────────────────"
  echo ""

  # ══════════════════════════════════════════════════════════════════════════
  # Step 1 — Extract fonts from Apple DMG archives (selected families only)
  # ══════════════════════════════════════════════════════════════════════════
  # DMG layout (verified by 7z l):
  #   SF-Pro.dmg     → SFProFonts/     "SF Pro Fonts.pkg"     → SFProFonts.pkg/Payload
  #   SF-Compact.dmg → SFCompactFonts/ "SF Compact Fonts.pkg" → SFCompactFonts.pkg/Payload
  #   SF-Mono.dmg    → SFMonoFonts/    "SF Mono Fonts.pkg"    → SFMonoFonts.pkg/Payload
  #   SF-Arabic.dmg  → SFArabicFonts/  "SF Arabic Fonts.pkg"  → SFArabicFonts.pkg/Payload
  #   NY.dmg         → NYFonts/        "NY Fonts.pkg"         → NYFonts.pkg/Payload
  rm -rf "$srcdir/extracted" "$srcdir/converted" "$srcdir/patched" "$srcdir/selected"
  mkdir -p "$srcdir/extracted" "$srcdir/converted" "$srcdir/patched" "$srcdir/selected"

  declare -A _dmg_want=(
    [SF-Pro]="$WANT_SF_PRO"
    [SF-Compact]="$WANT_SF_COMPACT"
    [SF-Mono]="$WANT_SF_MONO"
    [SF-Arabic]="$WANT_SF_ARABIC"
    [NY]="$WANT_NY"
  )

  local _pwd; _pwd="$(pwd)"
  cd "$srcdir"
  for _archive in *.dmg; do
    local _stem; _stem="$(basename "$_archive" .dmg)"
    if [[ "${_dmg_want[$_stem]}" != true ]]; then
      echo "==> Skipping: $_archive (not selected)"
      continue
    fi
    local _fontDir _metapkg _payload
    _fontDir="$(echo "$_stem" | tr -d '-')Fonts"
    _metapkg="$(echo "$_stem" | sed 's/-/ /g') Fonts.pkg"
    _payload="${_fontDir}.pkg/Payload"
    echo "==> Extracting: $_archive"
    7z x "$_archive" &>/dev/null || true
    if [[ -d "$srcdir/$_fontDir" ]]; then
      cd "$srcdir/$_fontDir"
      bsdtar xvPf "$_metapkg" &>/dev/null || true
      bsdtar xvPf "$_payload"  &>/dev/null || true
      find . \( -name '*.ttf' -o -name '*.otf' \) ! -path '*/._*' \
        -exec cp -n {} "$srcdir/extracted/" \;
      cd "$srcdir"
    fi
  done
  cd "$_pwd"

  # ══════════════════════════════════════════════════════════════════════════
  # Step 2 — Filter by subfamily and variable-font preference
  # ══════════════════════════════════════════════════════════════════════════
  # Variable TTFs (fvar present): SF-Pro.ttf, SF-Pro-Italic.ttf,
  #   SF-Compact.ttf, SF-Compact-Italic.ttf, NewYork.ttf, NewYorkItalic.ttf
  # These are included only when NERD_PATCH=false AND WANT_VARIABLE=true.

  _copy_otf_subfamily() {
    local _want="$1" _subs="$2" _prefix="$3"
    [[ "$_want" != true ]] && return
    if [[ -z "$_subs" ]]; then
      find "$srcdir/extracted" \( -name "${_prefix}-*.otf" \) ! -path '*/._*' \
        -exec cp -n {} "$srcdir/selected/" \;
    else
      for _sub in $_subs; do
        find "$srcdir/extracted" \
          \( -name "${_prefix}-${_sub}-*.otf" -o -name "${_prefix}-${_sub}.otf" \) \
          ! -path '*/._*' \
          -exec cp -n {} "$srcdir/selected/" \;
      done
    fi
  }

  _copy_ny_otf() {
    local _want="$1" _subs="$2"
    [[ "$_want" != true ]] && return
    if [[ -z "$_subs" ]]; then
      find "$srcdir/extracted" -name 'NewYork*.otf' ! -path '*/._*' \
        -exec cp -n {} "$srcdir/selected/" \;
    else
      for _sub in $_subs; do
        find "$srcdir/extracted" -name "NewYork${_sub}-*.otf" ! -path '*/._*' \
          -exec cp -n {} "$srcdir/selected/" \;
      done
    fi
  }

  _maybe_variable() {
    # Copy a variable TTF only when NERD_PATCH=false and WANT_VARIABLE=true
    local _want_family="$1" _file="$2"
    [[ "$_want_family" != true ]] && return
    [[ "$NERD_PATCH" == true || "$WANT_VARIABLE" != true ]] && return
    cp -n "$srcdir/extracted/$_file" "$srcdir/selected/" 2>/dev/null || true
  }

  # SF Mono has no variable font and no subfamilies — always OTF
  [[ "$WANT_SF_MONO" == true ]] && \
    find "$srcdir/extracted" -name 'SF-Mono-*.otf' ! -path '*/._*' \
      -exec cp -n {} "$srcdir/selected/" \;

  # SF Arabic has no variable font — always OTF (TTF)
  [[ "$WANT_SF_ARABIC" == true ]] && \
    find "$srcdir/extracted" -name 'SF-Arabic*' ! -path '*/._*' \
      -exec cp -n {} "$srcdir/selected/" \;

  # SF Pro: static OTFs by subfamily + optional variable TTFs
  _copy_otf_subfamily "$WANT_SF_PRO" "$SF_PRO_SUBS" "SF-Pro"
  _maybe_variable "$WANT_SF_PRO" "SF-Pro.ttf"
  _maybe_variable "$WANT_SF_PRO" "SF-Pro-Italic.ttf"

  # SF Compact: static OTFs by subfamily + optional variable TTFs
  _copy_otf_subfamily "$WANT_SF_COMPACT" "$SF_COMPACT_SUBS" "SF-Compact"
  _maybe_variable "$WANT_SF_COMPACT" "SF-Compact.ttf"
  _maybe_variable "$WANT_SF_COMPACT" "SF-Compact-Italic.ttf"

  # New York: static OTFs by subfamily + optional variable TTFs
  _copy_ny_otf "$WANT_NY" "$NY_SUBS"
  _maybe_variable "$WANT_NY" "NewYork.ttf"
  _maybe_variable "$WANT_NY" "NewYorkItalic.ttf"

  local _sel_count; _sel_count=$(ls "$srcdir/selected/" | wc -l)
  echo "==> Selected $_sel_count font files for processing."
  if (( _sel_count == 0 )); then
    echo "Error: no fonts matched the selection. Check subfamily names."; exit 1
  fi

  # ══════════════════════════════════════════════════════════════════════════
  # Step 3 — OTF → TTF conversion (only when hinting is requested)
  # ══════════════════════════════════════════════════════════════════════════
  # ttfautohint requires TrueType glyf outlines.
  # We use fonttools' otf2ttf.py (cu2qu) which converts CFF cubic beziers to
  # TrueType quadratic splines without touching the name table — the name table
  # is preserved exactly from the original OTF, Apple private name IDs intact.
  # Variable TTFs already have glyf outlines and pass through unchanged.
  # When NERD_PATCH=true, font-patcher handles OTF→TTF implicitly.
  local _patchsrc
  if [[ "$NERD_PATCH" == false && "$HINTING" == true ]]; then
    printf "%b" "\e[1;34m==> INFO:\e[0m Converting static OTF→TTF for ttfautohint...\n"
    find "$srcdir/selected" -name '*.otf' ! -path '*/._*' | sort | \
      parallel -j"$(nproc)" \
        'python "'"$srcdir/otf2ttf.py"'" --post-format 2.0 --max-error 1.0 \
           -o "'"$srcdir/converted"'/{/.}.ttf" "{}"'
    # Variable TTFs and native TTFs pass through unchanged
    find "$srcdir/selected" -name '*.ttf' ! -path '*/._*' \
      -exec cp -n {} "$srcdir/converted/" \;
    _patchsrc="$srcdir/converted"
  elif [[ "$NERD_PATCH" == true && "$HINTING" == true ]]; then
    # font-patcher will convert OTF→TTF; conversion happens in step 4
    _patchsrc="$srcdir/selected"
  elif [[ "$NERD_PATCH" == true && "$HINTING" == false ]]; then
    _patchsrc="$srcdir/selected"
  else
    # NERD_PATCH=false, HINTING=false — install selected fonts directly
    _patchsrc="$srcdir/selected"
  fi

  # ══════════════════════════════════════════════════════════════════════════
  # Step 4 — Nerd Fonts patching (skipped when NERD_PATCH=false)
  # ══════════════════════════════════════════════════════════════════════════
  if [[ "$NERD_PATCH" == true ]]; then
    printf "%b" "\e[1;33m==> WARNING:\e[0m Patching with Nerd Fonts glyphs — this takes a while...\n"

    # SF Mono: -s (--mono) preserves monospace cell-width metrics
    find "$_patchsrc" \( -name 'SF-Mono-*.otf' -o -name 'SF-Mono-*.ttf' \) | sort | \
      parallel -j4 python "$srcdir/font-patcher" \
        --variable-width-glyphs -q -c -s {} \
        -out "$srcdir/patched" &>/dev/null || true

    find "$_patchsrc" \( -name '*.otf' -o -name '*.ttf' \) ! -name 'SF-Mono-*' | sort | \
      parallel -j4 python "$srcdir/font-patcher" \
        --variable-width-glyphs -q -c {} \
        -out "$srcdir/patched" &>/dev/null || true

    local _hintsrc="$srcdir/patched"
  else
    # No patching — hint or install directly from the conversion output
    local _hintsrc="$_patchsrc"
  fi

  # ══════════════════════════════════════════════════════════════════════════
  # Step 5 — ttfautohint hinting (only TTF files)
  # ══════════════════════════════════════════════════════════════════════════
  # When NERD_PATCH=true:  fonts in $_hintsrc are already TTF (font-patcher output)
  # When NERD_PATCH=false: OTFs were converted in step 3; variable TTFs pass through.
  # --fallback-script=none + --fallback-scaling: PUA glyphs (SF Symbols) are scaled
  #   proportionally instead of receiving incorrect Latin hinting.
  if [[ "$HINTING" == true ]]; then
    local _xheight
    case "$HINT_MODE" in
      nnn) _xheight=12 ;;
      *)   _xheight=14 ;;
    esac
    printf "%b" "\e[1;32m==> INFO:\e[0m Applying ttfautohint (mode=$HINT_MODE, x-height=${_xheight}px)...\n"
    mkdir -p "$srcdir/patched/hinted"
    for _f in "$_hintsrc"/*.ttf; do
      [[ -f "$_f" ]] || continue
      ttfautohint \
        --hinting-range-min=8 \
        --hinting-range-max=50 \
        --hinting-limit=200 \
        --increase-x-height="$_xheight" \
        --x-height-snapping-exceptions="" \
        --fallback-script=none \
        --fallback-scaling \
        --stem-width-mode="$HINT_MODE" \
        --no-info \
        --ignore-restrictions \
        "$_f" "$srcdir/patched/hinted/$(basename "$_f")"
    done
  fi

  # Persist state for package() — makepkg functions don't share shell vars
  printf "%s\n%s\n%s\n" "$HINTING" "$NERD_PATCH" "$WANT_VARIABLE" \
    > "$srcdir/.build_state"
}

package() {
  # Restore state written by build()
  local HINTING NERD_PATCH WANT_VARIABLE
  { read -r HINTING; read -r NERD_PATCH; read -r WANT_VARIABLE; } \
    < "$srcdir/.build_state" 2>/dev/null || { HINTING=false; NERD_PATCH=true; WANT_VARIABLE=false; }

  install -d "$pkgdir/usr/share/fonts/apple"

  if [[ "$HINTING" == true ]]; then
    # Hinted TTFs are always in patched/hinted/ regardless of NERD_PATCH path
    install -m644 "$srcdir/patched/hinted/"*.ttf "$pkgdir/usr/share/fonts/apple"

  elif [[ "$NERD_PATCH" == true ]]; then
    # Patched but not hinted: font-patcher always outputs TTF
    install -m644 "$srcdir/patched/"*.ttf "$pkgdir/usr/share/fonts/apple"

  else
    # No patching, no hinting: install selected fonts directly (OTF + optional variable TTF)
    if compgen -G "$srcdir/selected/*.otf" &>/dev/null; then
      install -m644 "$srcdir/selected/"*.otf "$pkgdir/usr/share/fonts/apple"
    fi
    if [[ "$WANT_VARIABLE" == true ]] && compgen -G "$srcdir/selected/*.ttf" &>/dev/null; then
      install -m644 "$srcdir/selected/"*.ttf "$pkgdir/usr/share/fonts/apple"
    fi
  fi

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
Apple San Francisco, SF Compact, SF Mono, SF Arabic, and New York fonts
are proprietary fonts owned by Apple Inc. They are provided for use on
Apple platforms and non-Apple platforms for personal, non-commercial use.
See https://developer.apple.com/fonts/ for the full license agreement.

Nerd Fonts glyphs are licensed under their respective open-source licenses.
See https://github.com/ryanoasis/nerd-fonts for details.
EOF
}
