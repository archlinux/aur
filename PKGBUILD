# Maintainer: gaou-piou <i.am.piou@gmail.com>
# Contributor: GCMarvin <GCMarvin@users.noreply.github.com>

pkgname=ttf-google-sans-hinted
_nfver=3.4.0
pkgver=1
pkgrel=1
pkgdesc="Google Sans fonts (GoogleSans, GoogleSansDisplay), optionally Nerd Fonts patched and/or ttfautohint hinted"
url='https://flutter.googlesource.com/gallery-assets'
arch=('any')
license=('custom')
makedepends=('python' 'python-fonttools' 'parallel' 'fontforge' 'ttfautohint')
options=(!strip !zipman)
conflicts=('ttf-google-sans')
provides=('ttf-google-sans' 'ttf-font-nerd')

source=(
  'fonts.tar.gz::https://flutter.googlesource.com/gallery-assets/+archive/refs/heads/master/lib/fonts.tar.gz'
  "font-patcher-${_nfver}::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
)
sha256sums=('SKIP' 'SKIP')

# ── Build-time options (all settable via env vars) ──────────────────────────
#
#  NERD_PATCH  true/false   Patch fonts with Nerd Fonts glyphs (default: false)
#
#  HINTING     true/false   Apply ttfautohint (default: false)
#
#  HINT_MODE   nnn|qqq|qsq|sss   3-char stem-width mode string for ttfautohint:
#                pos1=grayscale  pos2=GDI ClearType  pos3=DW ClearType
#                n=natural  q=quantized  s=strong
#                nnn=HiDPI  qqq=balanced  sss=aggressive low-DPI
#
#  Font family selection:
#  WANT_GOOGLE_SANS          true/false  (default: true)
#  WANT_GOOGLE_SANS_DISPLAY  true/false  (default: true)
#
#  Non-interactive examples:
#    NERD_PATCH=true HINTING=true HINT_MODE=qqq makepkg -si
#    NERD_PATCH=false HINTING=false WANT_GOOGLE_SANS_DISPLAY=false makepkg -si
# ────────────────────────────────────────────────────────────────────────────

_validate_hint_mode() {
  if [[ ! "$HINT_MODE" =~ ^[nqs]{3}$ ]]; then
    echo "Error: HINT_MODE='$HINT_MODE' is invalid."
    echo "  Must be 3 chars from: n (natural)  q (quantized)  s (strong)"
    echo "  Examples: nnn  qqq  qsq  sss"
    exit 1
  fi
}

_show()   { printf "  [%s] %s\n" "$1" "$2"; }
_ask_yn() { local _default="${2:-n}"; read -p "  $1? (default: $_default) " _yn; _yn="${_yn:-$_default}"; }

build() {
  # ══════════════════════════════════════════════════════════════════════════
  # Prompt section — all questions, only when env vars are not pre-set
  # ══════════════════════════════════════════════════════════════════════════
  echo ""
  echo "╔══════════════════════════════════════════════════════╗"
  echo "║         ttf-google-sans-hinted — build options       ║"
  echo "╚══════════════════════════════════════════════════════╝"

  # ── Nerd Fonts patching ──────────────────────────────────────────────────
  if [[ -z "${NERD_PATCH:-}" ]]; then
    _ask_yn "Patch fonts with Nerd Fonts glyphs" n
    [[ "$_yn" =~ ^[yY]$ ]] && NERD_PATCH=true || NERD_PATCH=false
  fi
  NERD_PATCH="${NERD_PATCH:-false}"

  # ── Hinting ──────────────────────────────────────────────────────────────
  if [[ -z "${HINTING:-}" ]]; then
    echo ""
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

  # ── Font family selection ────────────────────────────────────────────────
  if [[ -z "${WANT_GOOGLE_SANS:-}${WANT_GOOGLE_SANS_DISPLAY:-}" ]]; then
    echo ""
    echo "  ── Font families ────────────────────────────────────────"
    _ask_yn "Include Google Sans (Regular, Medium, Bold + Italics)" y
    [[ "$_yn" =~ ^[yY]$ ]] && WANT_GOOGLE_SANS=true || WANT_GOOGLE_SANS=false

    _ask_yn "Include Google Sans Display (Regular, Medium, Bold + Italics)" y
    [[ "$_yn" =~ ^[yY]$ ]] && WANT_GOOGLE_SANS_DISPLAY=true || WANT_GOOGLE_SANS_DISPLAY=false
  fi

  WANT_GOOGLE_SANS="${WANT_GOOGLE_SANS:-true}"
  WANT_GOOGLE_SANS_DISPLAY="${WANT_GOOGLE_SANS_DISPLAY:-true}"

  if [[ "$WANT_GOOGLE_SANS$WANT_GOOGLE_SANS_DISPLAY" != *true* ]]; then
    echo "Error: no font families selected. Aborting."; exit 1
  fi

  # ── Build summary ─────────────────────────────────────────────────────────
  echo ""
  echo "  ── Build summary ───────────────────────────────────────"
  printf "  NERD_PATCH:  %s\n" "$NERD_PATCH"
  printf "  HINTING:     %s%s\n" "$HINTING" "$( [[ "$HINTING" == true ]] && echo "  (mode=$HINT_MODE)" )"
  echo ""
  _show "$( [[ "$WANT_GOOGLE_SANS"         == true ]] && echo "x" || echo " " )" "Google Sans"
  _show "$( [[ "$WANT_GOOGLE_SANS_DISPLAY" == true ]] && echo "x" || echo " " )" "Google Sans Display"
  echo "  ────────────────────────────────────────────────────────"
  echo ""

  # ══════════════════════════════════════════════════════════════════════════
  # Step 1 — Select font files from the downloaded archive
  # ══════════════════════════════════════════════════════════════════════════
  rm -rf "$srcdir/selected" "$srcdir/patched"
  mkdir -p "$srcdir/selected" "$srcdir/patched"

  if [[ "$WANT_GOOGLE_SANS" == true ]]; then
    find "$srcdir" -maxdepth 1 -name 'GoogleSans-*.ttf' ! -path '*/._*' \
      -exec cp -n {} "$srcdir/selected/" \;
  fi

  if [[ "$WANT_GOOGLE_SANS_DISPLAY" == true ]]; then
    find "$srcdir" -maxdepth 1 -name 'GoogleSansDisplay-*.ttf' ! -path '*/._*' \
      -exec cp -n {} "$srcdir/selected/" \;
  fi

  local _sel_count; _sel_count=$(ls "$srcdir/selected/" | wc -l)
  echo "==> Selected $_sel_count font files for processing."
  if (( _sel_count == 0 )); then
    echo "Error: no fonts matched the selection."; exit 1
  fi

  # ══════════════════════════════════════════════════════════════════════════
  # Step 2 — Nerd Fonts patching (skipped when NERD_PATCH=false)
  # ══════════════════════════════════════════════════════════════════════════
  if [[ "$NERD_PATCH" == true ]]; then
    printf "%b" "\e[1;33m==> WARNING:\e[0m Patching with Nerd Fonts glyphs — this takes a while...\n"
    find "$srcdir/selected" -name '*.ttf' ! -path '*/._*' | sort | \
      parallel -j4 python "$srcdir/font-patcher-${_nfver}" \
        --variable-width-glyphs -q -c {} \
        -out "$srcdir/patched" &>/dev/null || true
    local _hintsrc="$srcdir/patched"
  else
    local _hintsrc="$srcdir/selected"
  fi

  # ══════════════════════════════════════════════════════════════════════════
  # Step 3 — ttfautohint hinting
  # ══════════════════════════════════════════════════════════════════════════
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

  # Persist state for package()
  printf "%s\n%s\n" "$HINTING" "$NERD_PATCH" > "$srcdir/.build_state"
}

package() {
  local HINTING NERD_PATCH
  { read -r HINTING; read -r NERD_PATCH; } \
    < "$srcdir/.build_state" 2>/dev/null || { HINTING=false; NERD_PATCH=false; }

  install -d "$pkgdir/usr/share/fonts/TTF"

  if [[ "$HINTING" == true ]]; then
    install -m644 "$srcdir/patched/hinted/"*.ttf "$pkgdir/usr/share/fonts/TTF"
  elif [[ "$NERD_PATCH" == true ]]; then
    install -m644 "$srcdir/patched/"*.ttf "$pkgdir/usr/share/fonts/TTF"
  else
    install -m644 "$srcdir/selected/"*.ttf "$pkgdir/usr/share/fonts/TTF"
  fi

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
Google Sans fonts are proprietary fonts owned by Google LLC.
They are distributed as part of Google's Flutter gallery assets.
See https://flutter.googlesource.com/gallery-assets for details.

Nerd Fonts glyphs are licensed under their respective open-source licenses.
See https://github.com/ryanoasis/nerd-fonts for details.
EOF
}
