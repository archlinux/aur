# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-didact-gothic-hinted
_gmver=2.101
_gfcommit=c741144416d5635d5de832dff8ba09292c112036
_nfver=3.5.1
pkgver="${_gmver}"
pkgrel=1
pkgdesc='Didact Gothic (Google Fonts), a single-weight geometric sans with Greek (incl. polytonic) and Cyrillic, optionally re-hinted with ttfautohint for FreeType / Nerd Fonts patched'
arch=('any')
url='https://fonts.google.com/specimen/Didact+Gothic'
license=('OFL-1.1')
makedepends=('python' 'python-fonttools' 'fontforge' 'parallel' 'ttfautohint')
options=(!strip)
provides=('ttf-didact-gothic')
conflicts=('ttf-didact-gothic')
source=(
  "DidactGothic-Regular.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/didactgothic/DidactGothic-Regular.ttf"
  "OFL.txt::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/didactgothic/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "make_features.py"
  "set_gasp.py"
  "measure.py"
  "README.md"
  "FEATURES.md"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('b98f9e091b6337a86f4e0f69c94c31905e1e287782853f472e176b4e28d3f81f'
            '36e2f1debc9778bac79fac1a0cb5a5ef51c102f00b58ef7d8a05324144b68166'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '200fc13d7cf288ebd10c2832a0c9e1cf5a8b7c7e4e6283311778a2df7057581e'
            '0b0464b268525569b5fa28b4735791efb22f22829ad178629776ae3ea82d7f99'
            '3ad4eb1296ca40b68d32fe5220fe03cb0c8b0d7725b1f179d3df2176430b0ff8'
            '1de31dc6b0d3f5d8c81754cfa0852b1e54137ef13fb2497ebecec00b16c98f2c'
            '0c913d31f504a3d28c2749411f03cbdba9f17b6b1181bacbcef1f2928e8479f7')

# ── What this package does ──────────────────────────────────────────────────
#
# Didact Gothic (Daniel Johnson, Cyreal; Google Fonts) is a single-weight
# (Regular) geometric sans with Latin, Greek (monotonic and polytonic) and
# Cyrillic, version 2.101. The source is pinned to the google/fonts commit above.
#
# Unlike most families in this series, upstream ALREADY ships hinting (fpgm/cvt,
# ttfautohint-style bytecode). Measured at hintmedium (README.md section 3) a
# re-hint with ttfautohint gives the same result as the upstream bytecode
# (natural: dev 12.2 vs 11.9, 0 glued dots, 0 height errors in both), so
# HINTING defaults to false and the upstream file is installed untouched.
# HINTING=true re-hints with your preset. A Nerd Fonts patch drops the bytecode,
# so NERD_PATCH=true defaults HINTING to true.
#
# FreeType only runs TrueType bytecode at hintstyle hintmedium/hintfull. The
# package ships (not enabled) /usr/share/fontconfig/conf.avail/80-$pkgname.conf
# that turns it on for the installed family, excluding Chromium/Electron by
# prgname (at device scale 1 they round every advance at hintmedium).
#
# ── Build-time options ───────────────────────────────────────────────────────
#
# Run from a terminal, prepare() asks for NERD_PATCH, FEATURE_DEFAULTS,
# HINTING and HINT_PRESET (Enter keeps the default). Anything already set in the
# environment is not asked. Without a TTY the environment / defaults apply.
# Answers are saved to $srcdir/.build_opts.
#
#  NERD_PATCH   true/false  Patch with Nerd Fonts glyphs (default: false).
#                           Patching drops the upstream bytecode, so HINTING
#                           then defaults to true. Family "Didact Gothic Nerd Font
#                           (Mono|Propo)".
#
#  HINTING      true/false  Re-hint with ttfautohint. Default: false (keep the
#                           upstream bytecode), true with NERD_PATCH=true.
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
#                 them (fontconfig fontfeatures only reaches pango). Didact
#                 Gothic's candidates: case, frac, lnum, onum, sups, ss01 (see
#                 FEATURES.md); liga is already on in every shaper.
#                 make_features.py refuses aalt/ordn/dlig/salt. Few are right for
#                 running text; frac and sups fire inside ordinary words.
#                 FEATURE_DEFAULTS=fonts.conf takes the features that are ACTIVE
#                 (uncommented) in the <match> for family "Didact Gothic" of
#                 ${DG_FONTS_CONF:-~/.config/fontconfig/fonts.conf}. Dropped with
#                 a note: negated tags (-liga), tags the font lacks in GSUB, tags
#                 HarfBuzz always applies (kern liga ccmp locl mark mkmk calt) and
#                 the ones make_features.py refuses (aalt ordn dlig ...).
#  FEATURE_FAMILY   "Name"  Install the result under this family instead.
#
#  Examples:
#    makepkg -si                          (asks, when run from a terminal)
#    makepkg -si </dev/null               (never asks: defaults only)
#    HINTING=true makepkg -si
#    HINT_PRESET=balanced makepkg -si
#    NERD_PATCH=true makepkg -si
# ────────────────────────────────────────────────────────────────────────────

_opt_keys=(FEATURE_DEFAULTS FEATURE_FAMILY
           NERD_PATCH
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

# Prints the bakeable tags active for family "Didact Gothic" in the user's fonts.conf.
_features_from_fontsconf() {
  local _conf="${DG_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}"
  if [[ ! -f "$_conf" ]]; then
    echo "Error: $_conf not found (set DG_FONTS_CONF)." >&2; return 1
  fi
  python - "$_conf" "$srcdir/DidactGothic-Regular.ttf" <<'PY'
import sys
import xml.etree.ElementTree as ET
from fontTools.ttLib import TTFont
conf, font = sys.argv[1:3]
always = {"kern", "liga", "ccmp", "locl", "mark", "mkmk", "calt", "clig", "rlig", "rvrn"}
refused = {"aalt", "ordn", "dlig", "salt", "hlig", "hist"}
gsub = {r.FeatureTag for r in TTFont(font, lazy=True)["GSUB"].table.FeatureList.FeatureRecord}
tags = []
for m in ET.parse(conf).getroot().iter("match"):
    if m.get("target") != "font":
        continue
    if not any(t.get("name") == "family" and (t.findtext("string") or "").strip() == "Didact Gothic"
               for t in m.findall("test")):
        continue
    for e in m.findall("edit"):
        if e.get("name") != "fontfeatures":
            continue
        for st in e.findall("string"):
            tag = (st.text or "").strip()
            why = None
            if tag.startswith("-"): why = "negated"
            elif tag in always: why = "already applied by every shaper"
            elif tag in refused: why = "refused by make_features.py"
            elif tag not in gsub: why = "not a GSUB feature of the font"
            if why:
                print(f"  note: fonts.conf: '{tag}' skipped ({why})", file=sys.stderr)
            elif tag not in tags:
                tags.append(tag)
print(",".join(tags))
PY
}

_prompt_options() {
  if [[ -t 0 ]]; then
    echo ""
    echo "  $pkgname: build options (Enter = default)"
    echo ""
    if [[ -z "${NERD_PATCH:-}" ]]; then
      _ask_yn "Patch with Nerd Fonts glyphs (forces static fonts)" n; NERD_PATCH=$_yn
    fi
    if [[ "${FEATURE_DEFAULTS+set}" != set ]]; then
      echo ""
      echo "  A font cannot declare a feature \"on by default\"; baking moves its lookups"
      echo "  into calt, which every program applies (see the header of this PKGBUILD)."
      _ask_choice "Bake features into calt" none \
        "none:leave the fonts as upstream ships them (default)" \
        "fonts.conf:the features active for \"Didact Gothic\" in ~/.config/fontconfig/fonts.conf" \
        "custom:type the tag list yourself"
      case $_choice in
        none)   FEATURE_DEFAULTS="" ;;
        fonts.conf) FEATURE_DEFAULTS="fonts.conf" ;;
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
      echo "  Upstream already ships hinting; re-hinting measured the same (README.md)."
      if [[ "$NERD_PATCH" == true ]]; then
        _ask_yn "Hint with ttfautohint (n = unhinted; patching removed upstream hints)" y
      else
        _ask_yn "Re-hint with ttfautohint (n = keep upstream hints)" n
      fi
      HINTING=$_yn
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

  if [[ "${FEATURE_DEFAULTS:-}" == fonts.conf ]]; then
    FEATURE_DEFAULTS="$(_features_from_fontsconf)" || exit 1
    echo "==> FEATURE_DEFAULTS from fonts.conf: ${FEATURE_DEFAULTS:-<none>}"
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

  FEATURE_DEFAULTS="${FEATURE_DEFAULTS:-}"
  FEATURE_FAMILY="${FEATURE_FAMILY:-}"
  NERD_PATCH="${NERD_PATCH:-false}"
  if [[ "$NERD_PATCH" == true ]]; then HINTING="${HINTING:-true}"; else HINTING="${HINTING:-false}"; fi
  HINT_PRESET="${HINT_PRESET:-natural}"
  GASP_MODE="${GASP_MODE:-keep}"
  HINT_WINCOMPAT="${HINT_WINCOMPAT:-false}"
  HINT_TTFA_TABLE="${HINT_TTFA_TABLE:-false}"
  HINT_INTEGER_PPEM="${HINT_INTEGER_PPEM:-false}"
  HINT_DEFAULT_SCRIPT="${HINT_DEFAULT_SCRIPT:-latn}"
  HINT_FALLBACK_SCRIPT="${HINT_FALLBACK_SCRIPT:-latn}"

  for _v in NERD_PATCH HINTING HINT_WINCOMPAT HINT_TTFA_TABLE HINT_INTEGER_PPEM; do
    case "${!_v}" in
      true|false) ;;
      *) echo "Error: $_v='${!_v}' must be true or false." >&2; exit 1 ;;
    esac
  done
  for _v in ${FEATURE_DEFAULTS//,/ }; do
    if [[ ! "$_v" =~ ^[A-Za-z0-9]{4}$ ]]; then
      echo "Error: FEATURE_DEFAULTS: '$_v' is not a feature tag (e.g. case)." >&2
      exit 1
    fi
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

  echo "==> Options: nerd=$NERD_PATCH hinting=$HINTING"
  if [[ "$HINTING" == true ]]; then
    echo "==> ttfautohint: preset=$HINT_PRESET stem=$HINT_MODE" \
         "range=$HINT_RANGE_MIN-$HINT_RANGE_MAX limit=$HINT_LIMIT x-height=$HINT_XHEIGHT" \
         "x-snap-exc='${HINT_XSNAP_EXC-<default>}' gasp=$GASP_MODE integer-ppem=$HINT_INTEGER_PPEM" \
         "ttfa-table=$HINT_TTFA_TABLE${HINT_FAMILY_SUFFIX:+ suffix='$HINT_FAMILY_SUFFIX'}"
  fi

  rm -rf "$srcdir/selected" "$srcdir/patched" "$srcdir/hinted" "$srcdir/featured"
  mkdir -p "$srcdir/selected" "$srcdir/patched" "$srcdir/hinted"

  # ── Step 1: select ──────────────────────────────────────────────────────────
  install -m644 "$srcdir/DidactGothic-Regular.ttf" "$srcdir/selected/DidactGothic-Regular.ttf"
  local _count
  _count=$(find "$srcdir/selected" -name '*.ttf' | wc -l)
  echo "==> Selected $_count font file(s)."

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
  local _fontdir="$pkgdir/usr/share/fonts/didact-gothic"
  install -Dm644 -t "$_fontdir" "$_out/"*.ttf
  install -Dm644 "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"

  # Opt-in rendering tweak: bytecode hinting for the families this build
  # installed. Shipped in conf.avail and deliberately not enabled.
  if [[ "$HINTING" == true || "$NERD_PATCH" != true ]]; then
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
