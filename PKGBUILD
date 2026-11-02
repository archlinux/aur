# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-geom-hinted
_gmver=1.102
_gfcommit=a60a77e14f28abd4ef243a1b5dfc48df0cec5205
_nfver=3.5.1
pkgver="${_gmver}"
pkgrel=1
pkgdesc='Geom (Google Fonts), a geometric sans with a wght axis and Greek, re-hinted with ttfautohint for FreeType (optionally static / Nerd Fonts patched)'
arch=('any')
url='https://fonts.google.com/specimen/Geom'
license=('OFL-1.1')
makedepends=('python' 'python-fonttools' 'fontforge' 'parallel' 'ttfautohint')
options=(!strip)
provides=('ttf-geom')
conflicts=('ttf-geom' 'geom-ttf-hinted')
source=(
  "GeomVF.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/geom/Geom%5Bwght%5D.ttf"
  "GeomItalicVF.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/geom/Geom-Italic%5Bwght%5D.ttf"
  "OFL.txt::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/geom/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "make_statics.py"
  "make_features.py"
  "set_gasp.py"
  "measure.py"
  "README.md"
  "FEATURES.md"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('4509ad62e97c2e07c7fbc51180caba092b66fb2967e4de7dcba149ab3beb3b15'
            'f448d04a281a0e8198a109e1809e145ffd5567a26299c8b2b772297de17500ad'
            '614e89d16af045c1c32716f67d1e826c692cf643c549cba46b38d41d6919d77b'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '1ad9748de7280a3f70acf49e21bfb505818db3f097f75d4fa11b8119ea03b18b'
            '200fc13d7cf288ebd10c2832a0c9e1cf5a8b7c7e4e6283311778a2df7057581e'
            '0b0464b268525569b5fa28b4735791efb22f22829ad178629776ae3ea82d7f99'
            '3d45aadde50db7e27a9ff33a00de44dc8bada3f5cd6b9afb2e5344dc86efae1f'
            'a802ddcf008a042ac2e2b0bf77c56769f61621dc5893fdb27f7e71c83fa74664'
            '8eccb99941b863aa4070211dc2819cd829ad1b76ed1dead5e3f51eca22d9515c')

# ── What this package does ──────────────────────────────────────────────────
#
# Geom (Thanos Poulakidas, added to Google Fonts 2025-11-14) is a geometric
# sans shipped as two one-axis variable fonts: Geom[wght].ttf (upright) and
# Geom-Italic[wght].ttf (-10 degrees), wght 300-900, default 400. It covers
# Latin (incl. Latin Extended-A) and modern monotonic Greek; no Cyrillic. The
# sources are pinned to the google/fonts commit above.
#
# Upstream ships NO hinting (no fpgm/cvt, glyphs without instructions, a tiny
# prep). At hintstyle hintmedium/hintfull FreeType then treats the face as
# hinted and does not run its autohinter: Geom renders completely unhinted and
# the i/j/ï/ϊ dots touch the letters at small sizes (README.md section 3).
# This package runs ttfautohint over it. See README.md for the measurements
# and FEATURES.md for what the font can do.
#
# ttfautohint takes its blue zones from the default master (Regular). At
# 700-900 a static, hinted on its own, is clearly closer to the outline than the
# variable font (Black: dev 5.8 vs 14.4). The variable font stays the default
# because one file keeps every weight; GM_VARIANT=static is the better choice
# if you mostly use the heavy weights.
#
# FreeType only runs TrueType bytecode at hintstyle hintmedium/hintfull. The
# package ships (not enabled) /usr/share/fontconfig/conf.avail/80-$pkgname.conf
# that turns it on for the installed families, excluding Chromium/Electron by
# prgname (at device scale 1 they round every advance at hintmedium).
#
# ── Build-time options ───────────────────────────────────────────────────────
#
# Run from a terminal, prepare() asks for NERD_PATCH, GM_VARIANT, FEATURE_DEFAULTS,
# HINTING and HINT_PRESET (Enter keeps the default). Anything already set in the
# environment is not asked. Without a TTY the environment / defaults apply.
# Answers are saved to $srcdir/.build_opts.
#
#  GM_VARIANT   variable|static  (default: variable)
#                 variable  the two variable fonts (upright + italic)
#                 static    one TTF per weight (and italic), cut with the
#                           fontTools instancer and hinted on its own
#  STATIC_WEIGHTS "300 ... 900"  wght values to cut (default: all seven)
#  STATIC_ITALIC  true/false     also cut the italic (default true)
#
#  NERD_PATCH   true/false  Patch with Nerd Fonts glyphs (default: false).
#                           font-patcher drops fvar/gvar, so this forces
#                           GM_VARIANT=static. Family "Geom Nerd Font (Mono|Propo)".
#
#  HINTING      true/false  Hint with ttfautohint (default: true).
#
#  HINT_PRESET  natural|balanced|sharp|light|custom (default: natural)
#               natural    stem=nnn  range 8-48   x-height 0   (closest to the
#                                                              outline; default)
#               balanced   stem=qsq  range 8-48   x-height 14  (ttfautohint
#                                                              defaults; opens
#                                                              a few more dots,
#                                                              same dev at 400)
#               sharp      stem=sss  range 6-48   x-height 14  (higher dev)
#               light      stem=nnn  range 12-48  x-height 0   (HiDPI)
#               custom     use the HINT_* variables below verbatim
#  Individual knobs (override the preset; empty = preset value):
#  HINT_MODE HINT_RANGE_MIN HINT_RANGE_MAX HINT_LIMIT HINT_XHEIGHT
#  HINT_XSNAP_EXC HINT_DEFAULT_SCRIPT HINT_FALLBACK_SCRIPT HINT_WINCOMPAT
#  HINT_TTFA_TABLE HINT_FAMILY_SUFFIX HINT_INTEGER_PPEM (off: it grows text on
#  Linux, +16-19% ink at small sizes) GASP_MODE keep|sized|smooth|gridfit
#
#  FEATURE_DEFAULTS "tag,tag,..."  (default: empty = leave the fonts alone)
#                 Bake these GSUB features into calt so EVERY renderer applies
#                 them (fontconfig fontfeatures only reaches pango). Geom's
#                 candidates: frac, sups, case (see FEATURES.md); liga is
#                 already on in every shaper. make_features.py refuses
#                 aalt/ordn/dlig. None is right for running text: frac and
#                 sups fire inside ordinary words.
#  FEATURE_FAMILY   "Name"  Install the result under this family instead.
#
#  Examples:
#    makepkg -si                          (asks, when run from a terminal)
#    makepkg -si </dev/null               (never asks: defaults only)
#    GM_VARIANT=static makepkg -si
#    HINT_PRESET=balanced makepkg -si
#    NERD_PATCH=true STATIC_WEIGHTS="400 700" makepkg -si
# ────────────────────────────────────────────────────────────────────────────

_opt_keys=(GM_VARIANT FEATURE_DEFAULTS FEATURE_FAMILY
           STATIC_WEIGHTS STATIC_ITALIC NERD_PATCH
           HINTING HINT_PRESET HINT_MODE HINT_RANGE_MIN HINT_RANGE_MAX
           HINT_LIMIT HINT_XHEIGHT HINT_XSNAP_EXC HINT_DEFAULT_SCRIPT
           HINT_FALLBACK_SCRIPT HINT_WINCOMPAT HINT_TTFA_TABLE
           HINT_FAMILY_SUFFIX HINT_INTEGER_PPEM GASP_MODE)

_ask_yn() {
  local _ans
  read -r -p "  $1? [$2] " _ans || _ans=""
  [[ "${_ans:-$2}" =~ ^[yY] ]] && _yn=true || _yn=false
}

# _ask_choice TITLE DEFAULT KEY:description ... -> sets _choice to a KEY.
_ask_choice() {
  local _title="$1" _default="$2"; shift 2
  local -a _items=("$@")
  local _i _ans
  echo "  $_title:"
  for _i in "${!_items[@]}"; do
    printf "    %d) %-12s %s%s\n" "$((_i + 1))" "${_items[$_i]%%:*}" "${_items[$_i]#*:}" \
      "$([[ "${_items[$_i]%%:*}" == "$_default" ]] && echo "  (default)")"
  done
  while :; do
    read -r -p "  > " _ans || _ans=""
    if [[ -z "$_ans" ]]; then _choice="$_default"; return; fi
    if [[ "$_ans" =~ ^[0-9]+$ ]] && (( _ans >= 1 && _ans <= ${#_items[@]} )); then
      _choice="${_items[$((_ans - 1))]%%:*}"; return
    fi
    echo "  Enter 1-${#_items[@]}, or press Enter for $_default."
  done
}

_prompt_options() {
  if [[ -t 0 ]]; then
    echo ""
    echo "  $pkgname: build options (Enter = default)"
    echo ""
    if [[ -z "${NERD_PATCH:-}" ]]; then
      _ask_yn "Patch with Nerd Fonts glyphs (forces static fonts)" n; NERD_PATCH=$_yn
    fi
    if [[ "$NERD_PATCH" != true && -z "${GM_VARIANT:-}" ]]; then
      _ask_choice "Font set" variable \
        "variable:two wght-axis fonts, upright + italic (recommended)" \
        "static:one file per weight/italic, hinted per weight"
      GM_VARIANT=$_choice
    fi
    if [[ "${FEATURE_DEFAULTS+set}" != set ]]; then
      echo ""
      echo "  A font cannot declare a feature \"on by default\"; baking moves its lookups"
      echo "  into calt, which every program applies (see the header of this PKGBUILD)."
      _ask_choice "Bake features into calt" none \
        "none:leave the fonts as upstream ships them (default)" \
        "custom:type the tag list yourself"
      case $_choice in
        none)   FEATURE_DEFAULTS="" ;;
        custom)
          echo "  Tags, comma or space separated (e.g. \"case,frac\"):"
          read -r -p "  > " _tags || _tags=""
          _tags="${_tags//[[:space:]]/,}"
          while [[ "$_tags" == *,,* ]]; do _tags="${_tags//,,/,}"; done
          _tags="${_tags#,}"; _tags="${_tags%,}"
          FEATURE_DEFAULTS="$_tags" ;;
      esac
    fi
    if [[ -z "${HINTING:-}" ]]; then
      _ask_yn "Hint with ttfautohint (n = unhinted, as upstream)" y; HINTING=$_yn
    fi
    if [[ "$HINTING" == true && -z "${HINT_PRESET:-}" ]]; then
      _ask_choice "Hinting preset" natural \
        "natural:stem n, 8-48px, no x-height boost (closest to the design)" \
        "balanced:stem q, 8-48px (opens the dots, a few more dots open)" \
        "sharp:stem s, 6-48px (highest contrast, higher dev)" \
        "light:stem n, 12-48px, no x-height boost (HiDPI)" \
        "custom:use the HINT_* environment variables"
      HINT_PRESET=$_choice
    fi
    echo ""
  else
    echo "==> Non-interactive build (no TTY): using environment variables / defaults."
  fi

  local _k
  : > "$srcdir/.build_opts"
  for _k in "${_opt_keys[@]}"; do
    # "set" rather than non-empty: HINT_XSNAP_EXC="" differs from unset.
    if [[ "${!_k+set}" == set ]]; then
      printf '%s=%s\n' "$_k" "${!_k}" >> "$srcdir/.build_opts"
    fi
  done
}

# makepkg runs build() and package() in separate shells, so both call this.
_resolve_options() {
  local _k _v
  if [[ ! -f "$srcdir/.build_opts" ]]; then
    echo "Error: $srcdir/.build_opts missing; run a full makepkg (prepare() writes it)." >&2
    exit 1
  fi
  while IFS='=' read -r _k _v; do
    if [[ " ${_opt_keys[*]} " == *" $_k "* ]]; then
      printf -v "$_k" '%s' "$_v"
    fi
  done < "$srcdir/.build_opts"

  GM_VARIANT="${GM_VARIANT:-variable}"
  FEATURE_DEFAULTS="${FEATURE_DEFAULTS:-}"
  FEATURE_FAMILY="${FEATURE_FAMILY:-}"
  STATIC_WEIGHTS="${STATIC_WEIGHTS:-300 400 500 600 700 800 900}"
  STATIC_ITALIC="${STATIC_ITALIC:-true}"
  NERD_PATCH="${NERD_PATCH:-false}"
  HINTING="${HINTING:-true}"
  HINT_PRESET="${HINT_PRESET:-natural}"
  GASP_MODE="${GASP_MODE:-keep}"
  HINT_WINCOMPAT="${HINT_WINCOMPAT:-false}"
  HINT_TTFA_TABLE="${HINT_TTFA_TABLE:-false}"
  HINT_INTEGER_PPEM="${HINT_INTEGER_PPEM:-false}"
  HINT_DEFAULT_SCRIPT="${HINT_DEFAULT_SCRIPT:-latn}"
  HINT_FALLBACK_SCRIPT="${HINT_FALLBACK_SCRIPT:-latn}"

  case "$GM_VARIANT" in
    variable|static) ;;
    *) echo "Error: GM_VARIANT='$GM_VARIANT' invalid (variable|static)." >&2; exit 1 ;;
  esac
  for _v in STATIC_ITALIC NERD_PATCH HINTING HINT_WINCOMPAT HINT_TTFA_TABLE HINT_INTEGER_PPEM; do
    case "${!_v}" in
      true|false) ;;
      *) echo "Error: $_v='${!_v}' must be true or false." >&2; exit 1 ;;
    esac
  done
  # font-patcher drops fvar/gvar, so patching always works on statics.
  if [[ "$NERD_PATCH" == true && "$GM_VARIANT" == variable ]]; then
    echo "==> Note: the variable font cannot be Nerd-patched; using GM_VARIANT=static."
    GM_VARIANT=static
  fi
  for _v in ${FEATURE_DEFAULTS//,/ }; do
    if [[ ! "$_v" =~ ^[A-Za-z0-9]{4}$ ]]; then
      echo "Error: FEATURE_DEFAULTS: '$_v' is not a feature tag (e.g. case)." >&2
      exit 1
    fi
  done
  for _v in $STATIC_WEIGHTS; do
    case "$_v" in
      300|400|500|600|700|800|900) ;;
      *) echo "Error: STATIC_WEIGHTS: '$_v' is not 300, 400, ... 900." >&2; exit 1 ;;
    esac
  done

  local _m _lo _hi _xh
  case "$HINT_PRESET" in
    natural)  _m=nnn; _lo=8;  _hi=48; _xh=0  ;;
    balanced) _m=qsq; _lo=8;  _hi=48; _xh=14 ;;
    sharp)    _m=sss; _lo=6;  _hi=48; _xh=14 ;;
    light)    _m=nnn; _lo=12; _hi=48; _xh=0  ;;
    custom)   _m=nnn; _lo=8;  _hi=48; _xh=0  ;;
    *)
      echo "Error: unknown HINT_PRESET='$HINT_PRESET'." >&2
      echo "  Valid: natural balanced sharp light custom" >&2
      exit 1 ;;
  esac
  HINT_MODE="${HINT_MODE:-$_m}"
  HINT_RANGE_MIN="${HINT_RANGE_MIN:-$_lo}"
  HINT_RANGE_MAX="${HINT_RANGE_MAX:-$_hi}"
  HINT_LIMIT="${HINT_LIMIT:-$HINT_RANGE_MAX}"
  HINT_XHEIGHT="${HINT_XHEIGHT:-$_xh}"

  if [[ ! "$HINT_MODE" =~ ^[nqs]{3}$ ]]; then
    echo "Error: HINT_MODE='$HINT_MODE' must be 3 chars from n/q/s (e.g. nnn)." >&2
    exit 1
  fi
  for _v in HINT_RANGE_MIN HINT_RANGE_MAX HINT_LIMIT HINT_XHEIGHT; do
    if [[ ! "${!_v}" =~ ^[0-9]+$ ]]; then
      echo "Error: $_v='${!_v}' must be a non-negative integer." >&2; exit 1
    fi
  done
  if (( HINT_RANGE_MIN > HINT_RANGE_MAX )); then
    echo "Error: HINT_RANGE_MIN ($HINT_RANGE_MIN) > HINT_RANGE_MAX ($HINT_RANGE_MAX)." >&2
    exit 1
  fi
  for _v in HINT_DEFAULT_SCRIPT HINT_FALLBACK_SCRIPT; do
    if [[ ! "${!_v}" =~ ^[a-z0-9]{3,4}$ ]]; then
      echo "Error: $_v='${!_v}' must be a script tag (e.g. latn, none)." >&2; exit 1
    fi
  done
  case "$GASP_MODE" in
    keep|sized|smooth|gridfit) ;;
    *) echo "Error: GASP_MODE='$GASP_MODE' invalid (keep|sized|smooth|gridfit)." >&2; exit 1 ;;
  esac
}

prepare() {
  _prompt_options
  _resolve_options   # validate now, so a typo fails before the long steps

  rm -rf "$srcdir/font-patcher"
  if [[ "$NERD_PATCH" == true ]]; then
    mkdir -p "$srcdir/font-patcher"
    bsdtar xf "$srcdir/font-patcher-${_nfver}.zip" -C "$srcdir/font-patcher"
  fi
}

# _bake_features SRCDIR: move the lookups of FEATURE_DEFAULTS into calt into
# $srcdir/featured. Last step on purpose: ttfautohint never sees them.
_bake_features() {
  local _src="$1" _fam=()
  [[ -n "$FEATURE_DEFAULTS" ]] || return 0
  [[ -n "$FEATURE_FAMILY" ]] && _fam=(--family "$FEATURE_FAMILY")
  echo "==> Baking $FEATURE_DEFAULTS into calt" \
       "${FEATURE_FAMILY:+(installed as '$FEATURE_FAMILY')}..."
  python "$srcdir/make_features.py" --features "$FEATURE_DEFAULTS" \
    "${_fam[@]+"${_fam[@]}"}" -o "$srcdir/featured" "$_src"/*.ttf
}

build() {
  _resolve_options

  echo "==> Options: variant=$GM_VARIANT nerd=$NERD_PATCH hinting=$HINTING"
  if [[ "$GM_VARIANT" == static ]]; then
    echo "==> Statics: weights='$STATIC_WEIGHTS' italic=$STATIC_ITALIC"
  fi
  if [[ "$HINTING" == true ]]; then
    echo "==> ttfautohint: preset=$HINT_PRESET stem=$HINT_MODE" \
         "range=$HINT_RANGE_MIN-$HINT_RANGE_MAX limit=$HINT_LIMIT x-height=$HINT_XHEIGHT" \
         "x-snap-exc='${HINT_XSNAP_EXC-<default>}' gasp=$GASP_MODE integer-ppem=$HINT_INTEGER_PPEM" \
         "ttfa-table=$HINT_TTFA_TABLE${HINT_FAMILY_SUFFIX:+ suffix='$HINT_FAMILY_SUFFIX'}"
  fi

  rm -rf "$srcdir/selected" "$srcdir/patched" "$srcdir/hinted" "$srcdir/featured"
  mkdir -p "$srcdir/selected" "$srcdir/patched" "$srcdir/hinted"

  # ── Step 1: select ──────────────────────────────────────────────────────────
  if [[ "$GM_VARIANT" == variable ]]; then
    install -m644 "$srcdir/GeomVF.ttf" "$srcdir/selected/GeomVariable.ttf"
    install -m644 "$srcdir/GeomItalicVF.ttf" "$srcdir/selected/GeomItalicVariable.ttf"
  else
    echo "==> Cutting static instances..."
    local _w
    for _w in $STATIC_WEIGHTS; do
      python "$srcdir/make_statics.py" --wght "$_w" -o "$srcdir/selected" "$srcdir/GeomVF.ttf"
      if [[ "$STATIC_ITALIC" == true ]]; then
        python "$srcdir/make_statics.py" --wght "$_w" --italic -o "$srcdir/selected" "$srcdir/GeomItalicVF.ttf"
      fi
    done
  fi
  local _count
  _count=$(find "$srcdir/selected" -name '*.ttf' | wc -l)
  echo "==> Selected $_count font file(s)."
  if (( _count == 0 )); then
    echo "Error: no fonts produced." >&2; exit 1
  fi

  local _hintsrc="$srcdir/selected"

  # ── Step 2: Nerd Fonts patching ─────────────────────────────────────────────
  # Patch first, hint afterwards: font-patcher does not keep hint bytecode.
  if [[ "$NERD_PATCH" == true ]]; then
    echo "==> Patching with Nerd Fonts glyphs (this takes a while)..."
    find "$srcdir/selected" -type f | sort | \
      parallel --will-cite -j"$(nproc)" python "$srcdir/font-patcher/font-patcher" \
        --variable-width-glyphs -q -c {} -out "$srcdir/patched" '>/dev/null'
    _count=$(find "$srcdir/patched" -maxdepth 1 -name '*.ttf' | wc -l)
    if (( _count == 0 )); then
      echo "Error: font-patcher produced no output. See messages above." >&2; exit 1
    fi
    echo "==> Patched $_count font(s)."
    _hintsrc="$srcdir/patched"
  fi

  if [[ "$HINTING" != true ]]; then
    _bake_features "$_hintsrc"
    return 0
  fi

  # ── Step 3: ttfautohint ─────────────────────────────────────────────────────
  local -a _ta_opts=(
    --hinting-range-min="$HINT_RANGE_MIN"
    --hinting-range-max="$HINT_RANGE_MAX"
    --hinting-limit="$HINT_LIMIT"
    --increase-x-height="$HINT_XHEIGHT"
    --stem-width-mode="$HINT_MODE"
    --default-script="$HINT_DEFAULT_SCRIPT"
    --ignore-restrictions
  )
  if [[ "$NERD_PATCH" == true ]]; then
    _ta_opts+=(--fallback-script=none --fallback-scaling)
  else
    _ta_opts+=(--fallback-script="$HINT_FALLBACK_SCRIPT")
  fi
  if [[ "${HINT_XSNAP_EXC+set}" == set ]]; then
    _ta_opts+=(--x-height-snapping-exceptions="$HINT_XSNAP_EXC")
  fi
  if [[ "$HINT_WINCOMPAT" == true ]]; then _ta_opts+=(--windows-compatibility); fi
  if [[ -n "${HINT_FAMILY_SUFFIX:-}" ]]; then _ta_opts+=(--family-suffix="$HINT_FAMILY_SUFFIX"); fi
  if [[ "$HINT_TTFA_TABLE" == true ]]; then _ta_opts+=(--ttfa-table); else _ta_opts+=(--no-info); fi

  # Serial on purpose: GNU parallel splits arguments that contain spaces.
  echo "==> Hinting with ttfautohint..."
  local _f
  for _f in "$_hintsrc"/*.ttf; do
    ttfautohint "${_ta_opts[@]}" "$_f" "$srcdir/hinted/${_f##*/}"
  done

  if [[ "$HINT_INTEGER_PPEM" == true ]]; then
    echo "==> Setting head.flags bit 3 (integer ppem)..."
    python - "$srcdir/hinted/"*.ttf <<'PY'
import sys
from fontTools.ttLib import TTFont
for path in sys.argv[1:]:
    font = TTFont(path)
    font["head"].flags |= 1 << 3
    font.save(path)
PY
  fi

  if [[ "$GASP_MODE" != keep ]]; then
    echo "==> Applying gasp mode '$GASP_MODE'..."
    python "$srcdir/set_gasp.py" "$GASP_MODE" "$srcdir/hinted/"*.ttf
  fi

  _bake_features "$srcdir/hinted"
}

package() {
  _resolve_options

  local _out="$srcdir/selected"
  if [[ "$HINTING" == true ]]; then
    _out="$srcdir/hinted"
  elif [[ "$NERD_PATCH" == true ]]; then
    _out="$srcdir/patched"
  fi
  if [[ -n "$FEATURE_DEFAULTS" ]]; then _out="$srcdir/featured"; fi
  if ! compgen -G "$_out/*.ttf" >/dev/null; then
    echo "Error: no fonts to install in $_out." >&2; exit 1
  fi
  local _fontdir="$pkgdir/usr/share/fonts/geom"
  install -Dm644 -t "$_fontdir" "$_out/"*.ttf
  install -Dm644 "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"

  # Opt-in rendering tweak: bytecode hinting for the families this build
  # installed. Shipped in conf.avail and deliberately not enabled.
  if [[ "$HINTING" == true ]]; then
    local _avail="$pkgdir/usr/share/fontconfig/conf.avail"
    install -d "$_avail"
    local _fam _conf="$_avail/80-$pkgname.conf"
    local _chromium_prgnames=(chrome chromium brave helium electron code slack signal-desktop vesktop)
    local _prg _prgtests=""
    for _prg in "${_chromium_prgnames[@]}"; do
      _prgtests+="    <test qual=\"all\" name=\"prgname\" compare=\"not_eq\"><string>$_prg</string></test>"$'\n'
    done
    {
      echo '<?xml version="1.0" encoding="UTF-8"?>'
      echo '<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">'
      echo "<!-- Installed by $pkgname. NOT enabled by default. Enable with:"
      echo ""
      echo "       sudo ln -s /usr/share/fontconfig/conf.avail/80-$pkgname.conf /etc/fonts/conf.d/"
      echo ""
      echo "     Use the ttfautohint bytecode hints in these fonts rather than"
      echo "     FreeType's light autohinter. hintmedium, not hintfull: same rendering"
      echo "     in cairo/pango, and Blink keeps subpixel positioning at hintmedium."
      echo "     Chromium and Electron apps are excluded: at device scale 1 they use"
      echo "     linear advances only for hintslight/none, so hintmedium would round"
      echo "     every glyph advance to a whole pixel (uneven letter gaps)."
      echo "     Firefox also rounds advances at hintmedium unless"
      echo "     gfx.text.subpixel-position.force-enabled is true. See README.md. -->"
      echo '<fontconfig>'
      while IFS= read -r _fam; do
        _fam="${_fam//&/&amp;}"; _fam="${_fam//</&lt;}"
        cat <<EOF
  <match target="font">
    <test name="family" compare="eq"><string>$_fam</string></test>
${_prgtests%$'\n'}
    <edit name="hinting" mode="assign"><bool>true</bool></edit>
    <edit name="autohint" mode="assign"><bool>false</bool></edit>
    <edit name="hintstyle" mode="assign"><const>hintmedium</const></edit>
  </match>
EOF
      done < <(python - "$_fontdir/"*.ttf <<'PY' | sort -u
import sys
from fontTools.ttLib import TTFont
for path in sys.argv[1:]:
    name = TTFont(path, lazy=True)["name"]
    print(name.getDebugName(16) or name.getDebugName(1))
PY
)
      echo '</fontconfig>'
    } > "$_conf"
    chmod 644 "$_conf"
  fi

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/README.md" "$srcdir/FEATURES.md"
}
