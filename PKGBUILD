# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-akt-hinted
_gmver=1.100
_gfcommit=d36f78e60bb8424f6c2a2eb9b4bd717cd4d77651
_nfver=3.5.1
pkgver="${_gmver}"
pkgrel=2
pkgdesc='Akt (Google Fonts), a grotesque sans with a wght axis (100-900), Greek and Cyrillic, re-hinted with ttfautohint for FreeType (optionally static / Nerd Fonts patched)'
arch=('any')
url='https://fonts.google.com/specimen/Akt'
license=('OFL-1.1')
makedepends=('python' 'python-fonttools' 'fontforge' 'parallel' 'ttfautohint')
options=(!strip)
provides=('ttf-akt')
conflicts=('ttf-akt')
source=(
  "AktVF.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/akt/Akt%5Bwght%5D.ttf"
  "OFL.txt::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/akt/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "make_statics.py"
  "make_features.py"
  "set_gasp.py"
  "measure.py"
  "fit_weight.py"
  "even_spacing.py"
  "README.md"
  "FEATURES.md"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('3da5013ec56bf5a83cccd1d5601b89fa58a6cda5b3fd0e5f8d18ee3690272c05'
            'a27d7054c92711c58325a652f1968c92d1825a48bf745d50df802ec3d0ebb642'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '63a9168f053caf0e942a0b78e61d99655dc85247636b94f54e72ebcca3dc1df8'
            '200fc13d7cf288ebd10c2832a0c9e1cf5a8b7c7e4e6283311778a2df7057581e'
            '0b0464b268525569b5fa28b4735791efb22f22829ad178629776ae3ea82d7f99'
            '3ad4eb1296ca40b68d32fe5220fe03cb0c8b0d7725b1f179d3df2176430b0ff8'
            '966cc105db5f0f50c2015227baab9f24fe2e77054f8251b51ebb7e10ab412000'
            'd286a94b46119d537f1845895b97d0ef91629d10187f0f2afea88658bd3d9d5b'
            'be40b0414f99e8bf007a60b0bf6cb31adb0ffd6af25014ff56fc7fea250ec668'
            '53f95d81331096d439ec7235e59b830d42c0016c1e8a57231134afe280edbcb9')

# ── What this package does ──────────────────────────────────────────────────
#
# Akt (Gökçe Özkan / Mehmet Ozdenir, Google Fonts) is a grotesque sans shipped
# as ONE one-axis variable font, Akt[wght].ttf, wght 100-900, default 400; there
# is no italic. It covers Latin (incl. Vietnamese), Cyrillic and modern
# monotonic Greek (no polytonic). The source is pinned to the google/fonts
# commit above.
#
# Upstream ships NO hinting (no fpgm/cvt, glyphs without instructions, a tiny
# prep). At hintstyle hintmedium/hintfull FreeType then treats the face as
# hinted and does not run its autohinter: Akt renders completely unhinted and
# the i/j/ï/ϊ dots touch the letters at small sizes (README.md section 3).
# This package runs ttfautohint over it. See README.md for the measurements
# and FEATURES.md for what the font can do.
#
# ttfautohint takes its blue zones from the default master (Regular). A static,
# hinted on its own, follows the outline of its weight; in the measurements the
# static is never worse than the variable font and is clearly closer at 100 and
# 700-900 (balanced/sharp presets). The variable font stays the default because
# one file keeps every weight; AK_VARIANT=static is the better choice for the
# extreme weights.
#
# FreeType only runs TrueType bytecode at hintstyle hintmedium/hintfull. The
# package ships (not enabled) /usr/share/fontconfig/conf.avail/80-$pkgname.conf
# that turns it on for the installed families, excluding Chromium/Electron by
# prgname (at device scale 1 they round every advance at hintmedium).
#
# ── Build-time options ───────────────────────────────────────────────────────
#
# Run from a terminal, prepare() asks for NERD_PATCH, AK_VARIANT, FEATURE_DEFAULTS,
# HINTING and HINT_PRESET (Enter keeps the default). Anything already set in the
# environment is not asked. Without a TTY the environment / defaults apply.
# Answers are saved to $srcdir/.build_opts.
#
#  AK_VARIANT   variable|static  (default: variable)
#                 variable  the variable font
#                 static    one TTF per weight, cut with the
#                           fontTools instancer and hinted on its own
#  STATIC_WEIGHTS "100 ... 900"  wght values to cut (default: all nine)
#
#  REGULAR_WGHT 100-900  Cut the "Regular" static at this wght instead of 400
#               (e.g. 330). Forces AK_VARIANT=static. Why: at 16 ppem the design's
#               horizontal bars are 1.33px (1 solid + 1 faint row = blurry); at
#               wght ~300-340 they are ~1.1-1.2px, so the nnn hinting leaves them
#               nearly a single clean row, with the design's stroke ratio kept.
#               Costs ~15% ink (lighter text). Bold (700) stays as designed.
#               REGULAR_WGHT=auto runs fit_weight.py: it measures the bars of the
#               font's own outlines and picks the wght closest to 400 whose bars
#               are within FIT_TOLERANCE px (default 0.25) of a whole pixel at
#               FIT_PPEM (default 16 = 12pt on a 1x screen). Akt: 335 at 16 ppem.
#               Nothing fits (or the font is already clean) -> stays at 400.
#  FIT_PPEM / FIT_TOLERANCE  see REGULAR_WGHT=auto.
#  SCALE_WEIGHTS true/false  With REGULAR_WGHT: also re-space the other weights so
#               the family stays evenly stepped (default: true). Bold (700) and
#               above stay as designed (at 16 ppem Bold's bars are already
#               1.93px = a clean 2px row). 100-400 and 400-700 are each remapped
#               linearly: REGULAR_WGHT=330 cuts Light at 253, Regular 330,
#               Medium 453, SemiBold 577. false = only Regular moves (then Light
#               300 and Regular 330 are almost the same weight).
#
#  NERD_PATCH   true/false  Patch with Nerd Fonts glyphs (default: false).
#                           font-patcher drops fvar/gvar, so this forces
#                           AK_VARIANT=static. Family "Akt Nerd Font (Mono|Propo)".
#
#  EVEN_SPACING  ""|all|latin,greek,cyrillic (comma list)  (default: none)
#               Evens out the optical gap between letter pairs of the whole font.
#               For every lowercase and every uppercase pair it measures the area
#               between the outlines up to x-height / cap height (profiles clamped at
#               a depth so open shapes like c, e, ς are not over-credited) and adds a
#               GPOS kern lookup that moves each pair towards the median gap. Accented
#               letters follow their base letter; pairs the designer already kerned
#               are left alone. Why: Akt's sidebearings give uneven pairs, e.g.
#               Greek "λώ" vs "ει" differ by ~1px at 16 ppem. Works on variable and
#               static fonts. Numbers: python even_spacing.py --stats --report ει,ab FONT
#               Calibrated per font by even_spacing.py: depth and strength are fitted
#               to the pairs the designer kerned by hand, and the size limits follow
#               FIT_PPEM (max kern ~1 px, skip < 0.1 px). Override any of them:
#  EVEN_STRENGTH  0-1.5 (default auto)   EVEN_DEPTH  0.05-0.6 (default auto)
#  EVEN_MAX       max |kern|, units/1000 em (default auto = 1000/FIT_PPEM)
#  EVEN_MIN       skip corrections below this (default auto = 100/FIT_PPEM)
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
#                 them (fontconfig fontfeatures only reaches pango). Akt's
#                 candidates: case, frac, onum, ss01-ss06 (see FEATURES.md);
#                 liga is already on in every shaper. make_features.py refuses
#                 aalt/ordn/dlig. Only a few are right for running text
#                 (e.g. ss01 or onum); frac and sups fire inside ordinary words.
#                 FEATURE_DEFAULTS=fonts.conf takes the features that are ACTIVE
#                 (uncommented) in the <match> for family "Akt" of
#                 ${AK_FONTS_CONF:-~/.config/fontconfig/fonts.conf}. Dropped with
#                 a note: negated tags (-liga), tags the font lacks in GSUB, tags
#                 HarfBuzz always applies (kern liga ccmp locl mark mkmk calt) and
#                 the ones make_features.py refuses (aalt ordn dlig ...).
#  FEATURE_FAMILY   "Name"  Install the result under this family instead.
#
#  Examples:
#    makepkg -si                          (asks, when run from a terminal)
#    makepkg -si </dev/null               (never asks: defaults only)
#    AK_VARIANT=static makepkg -si
#    HINT_PRESET=balanced makepkg -si
#    NERD_PATCH=true STATIC_WEIGHTS="400 700" makepkg -si
# ────────────────────────────────────────────────────────────────────────────

_opt_keys=(AK_VARIANT FEATURE_DEFAULTS FEATURE_FAMILY
           STATIC_WEIGHTS NERD_PATCH
           HINTING HINT_PRESET HINT_MODE HINT_RANGE_MIN HINT_RANGE_MAX
           HINT_LIMIT HINT_XHEIGHT HINT_XSNAP_EXC HINT_DEFAULT_SCRIPT
           HINT_FALLBACK_SCRIPT HINT_WINCOMPAT HINT_TTFA_TABLE
           HINT_FAMILY_SUFFIX HINT_INTEGER_PPEM GASP_MODE REGULAR_WGHT FIT_PPEM FIT_TOLERANCE SCALE_WEIGHTS EVEN_SPACING EVEN_STRENGTH EVEN_DEPTH EVEN_MAX EVEN_MIN)

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

# Prints the bakeable tags active for family "Akt" in the user's fonts.conf.
_features_from_fontsconf() {
  local _conf="${AK_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}"
  if [[ ! -f "$_conf" ]]; then
    echo "Error: $_conf not found (set AK_FONTS_CONF)." >&2; return 1
  fi
  python - "$_conf" "$srcdir/AktVF.ttf" <<'PY'
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
    if not any(t.get("name") == "family" and (t.findtext("string") or "").strip() == "Akt"
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
    if [[ "$NERD_PATCH" != true && -z "${AK_VARIANT:-}" ]]; then
      _ask_choice "Font set" variable \
        "variable:one wght-axis font (recommended)" \
        "static:one file per weight, hinted per weight"
      AK_VARIANT=$_choice
    fi
    if [[ "${REGULAR_WGHT+set}" != set ]]; then
      echo ""
      echo "  At 16 ppem Regular's horizontal bars are 1.33px (1 solid + 1 faint row)."
      echo "  A lighter Regular makes them nearly one clean row (needs static fonts)."
      _ask_choice "Regular weight" auto \
        "auto:measure the font and pick the wght whose bars fit whole pixels (default)" \
        "400:as designed" \
        "custom:type a wght, 100-900"
      case $_choice in
        400)    REGULAR_WGHT="" ;;
        auto)   REGULAR_WGHT=auto ;;
        custom) read -r -p "  wght (100-900): " REGULAR_WGHT || REGULAR_WGHT="" ;;
        *)      REGULAR_WGHT=$_choice ;;
      esac
    fi
    if [[ "${EVEN_SPACING+set}" != set ]]; then
      echo ""
      echo "  Some letter pairs are spaced unevenly (e.g. Greek \"λώ\" tight, \"ει\" loose)."
      _ask_choice "Even out spacing with kern pairs" none \
        "none:as designed (default)" \
        "all:Latin, Greek and Cyrillic" \
        "greek:Greek only" \
        "latin:Latin only" \
        "custom:type a list, e.g. latin,greek"
      case $_choice in
        none)   EVEN_SPACING="" ;;
        custom) read -r -p "  scripts: " EVEN_SPACING || EVEN_SPACING="" ;;
        *)      EVEN_SPACING=$_choice ;;
      esac
    fi
    if [[ "${FEATURE_DEFAULTS+set}" != set ]]; then
      echo ""
      echo "  A font cannot declare a feature \"on by default\"; baking moves its lookups"
      echo "  into calt, which every program applies (see the header of this PKGBUILD)."
      _ask_choice "Bake features into calt" none \
        "none:leave the fonts as upstream ships them (default)" \
        "fonts.conf:the features active for \"Akt\" in ~/.config/fontconfig/fonts.conf" \
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

  AK_VARIANT="${AK_VARIANT:-variable}"
  FEATURE_DEFAULTS="${FEATURE_DEFAULTS:-}"
  FEATURE_FAMILY="${FEATURE_FAMILY:-}"
  STATIC_WEIGHTS="${STATIC_WEIGHTS:-100 200 300 400 500 600 700 800 900}"
  NERD_PATCH="${NERD_PATCH:-false}"
  HINTING="${HINTING:-true}"
  HINT_PRESET="${HINT_PRESET:-natural}"
  GASP_MODE="${GASP_MODE:-keep}"
  HINT_WINCOMPAT="${HINT_WINCOMPAT:-false}"
  HINT_TTFA_TABLE="${HINT_TTFA_TABLE:-false}"
  HINT_INTEGER_PPEM="${HINT_INTEGER_PPEM:-false}"
  HINT_DEFAULT_SCRIPT="${HINT_DEFAULT_SCRIPT:-latn}"
  HINT_FALLBACK_SCRIPT="${HINT_FALLBACK_SCRIPT:-latn}"

  case "$AK_VARIANT" in
    variable|static) ;;
    *) echo "Error: AK_VARIANT='$AK_VARIANT' invalid (variable|static)." >&2; exit 1 ;;
  esac
  for _v in NERD_PATCH HINTING HINT_WINCOMPAT HINT_TTFA_TABLE HINT_INTEGER_PPEM; do
    case "${!_v}" in
      true|false) ;;
      *) echo "Error: $_v='${!_v}' must be true or false." >&2; exit 1 ;;
    esac
  done
  EVEN_SPACING="${EVEN_SPACING:-}"
  EVEN_STRENGTH="${EVEN_STRENGTH:-auto}"; EVEN_DEPTH="${EVEN_DEPTH:-auto}"
  EVEN_MAX="${EVEN_MAX:-auto}"; EVEN_MIN="${EVEN_MIN:-auto}"
  if [[ ! "$EVEN_SPACING" =~ ^(|all|(latin|greek|cyrillic)(,(latin|greek|cyrillic))*)$ ]]; then
    echo "Error: EVEN_SPACING must be empty, all, or a comma list of latin,greek,cyrillic." >&2; exit 1
  fi
  for _v in EVEN_STRENGTH EVEN_DEPTH EVEN_MAX EVEN_MIN; do
    [[ "${!_v}" == auto || "${!_v}" =~ ^[0-9]+(\.[0-9]+)?$ ]] || { echo "Error: $_v='${!_v}' must be a number." >&2; exit 1; }
  done
  REGULAR_WGHT="${REGULAR_WGHT:-}"
  SCALE_WEIGHTS="${SCALE_WEIGHTS:-true}"
  case "$SCALE_WEIGHTS" in true|false) ;;
    *) echo "Error: SCALE_WEIGHTS must be true or false." >&2; exit 1 ;; esac
  if [[ "$REGULAR_WGHT" == auto ]]; then
    FIT_PPEM="${FIT_PPEM:-16}"; FIT_TOLERANCE="${FIT_TOLERANCE:-0.25}"
    if REGULAR_WGHT=$(python "$srcdir/fit_weight.py" --ppem "$FIT_PPEM" \
         --tolerance "$FIT_TOLERANCE" --quiet "$srcdir/AktVF.ttf") \
       && [[ "$REGULAR_WGHT" != 400 ]]; then
      echo "==> REGULAR_WGHT=auto: bars fit at wght $REGULAR_WGHT ($FIT_PPEM ppem)."
    else
      echo "==> REGULAR_WGHT=auto: wght 400 already fits (or nothing does); unchanged."
      REGULAR_WGHT=""
    fi
  fi
  if [[ -n "$REGULAR_WGHT" ]]; then
    if [[ ! "$REGULAR_WGHT" =~ ^[1-9][0-9]{2}$ || "$REGULAR_WGHT" -gt 900 ]]; then
      echo "Error: REGULAR_WGHT='$REGULAR_WGHT' must be 100-900." >&2; exit 1
    fi
    if [[ "$AK_VARIANT" == variable ]]; then
      echo "==> Note: REGULAR_WGHT needs a static cut; using AK_VARIANT=static."
      AK_VARIANT=static
    fi
    [[ " $STATIC_WEIGHTS " == *" 400 "* ]] || STATIC_WEIGHTS="400 $STATIC_WEIGHTS"
  fi
  # font-patcher drops fvar/gvar, so patching always works on statics.
  if [[ "$NERD_PATCH" == true && "$AK_VARIANT" == variable ]]; then
    echo "==> Note: the variable font cannot be Nerd-patched; using AK_VARIANT=static."
    AK_VARIANT=static
  fi
  for _v in ${FEATURE_DEFAULTS//,/ }; do
    if [[ ! "$_v" =~ ^[A-Za-z0-9]{4}$ ]]; then
      echo "Error: FEATURE_DEFAULTS: '$_v' is not a feature tag (e.g. case)." >&2
      exit 1
    fi
  done
  for _v in $STATIC_WEIGHTS; do
    case "$_v" in
      100|200|300|400|500|600|700|800|900) ;;
      *) echo "Error: STATIC_WEIGHTS: '$_v' is not 100, 200, ... 900." >&2; exit 1 ;;
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

  echo "==> Options: variant=$AK_VARIANT nerd=$NERD_PATCH hinting=$HINTING"
  if [[ "$AK_VARIANT" == static ]]; then
    echo "==> Statics: weights='$STATIC_WEIGHTS'"
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
  if [[ "$AK_VARIANT" == variable ]]; then
    install -m644 "$srcdir/AktVF.ttf" "$srcdir/selected/AktVariable.ttf"
  else
    echo "==> Cutting static instances..."
    local _w
    for _w in $STATIC_WEIGHTS; do
      if [[ -n "$REGULAR_WGHT" ]] && { [[ "$_w" == 400 ]] || [[ "$SCALE_WEIGHTS" == true && "$_w" -lt 700 ]]; }; then
        local _cut=$REGULAR_WGHT
        if (( _w < 400 )); then
          _cut=$(( 100 + (_w - 100) * (REGULAR_WGHT - 100) / 300 ))
        elif (( _w > 400 )); then
          _cut=$(( REGULAR_WGHT + (_w - 400) * (700 - REGULAR_WGHT) / 300 ))
        fi
        python "$srcdir/make_statics.py" --wght "$_cut" --name-as "$_w" \
          -o "$srcdir/selected" "$srcdir/AktVF.ttf"
      else
        python "$srcdir/make_statics.py" --wght "$_w" -o "$srcdir/selected" "$srcdir/AktVF.ttf"
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

  # ── Step 2b: optical spacing ────────────────────────────────────────────────
  # After patching, before hinting: only GPOS changes, ttfautohint keeps it.
  if [[ -n "$EVEN_SPACING" ]]; then
    echo "==> Evening out $EVEN_SPACING spacing with kern pairs..."
    rm -rf "$srcdir/spaced"; mkdir -p "$srcdir/spaced"
    local -a _es=(--script "$EVEN_SPACING" --ppem "${FIT_PPEM:-16}")
    local _o _n
    for _o in strength:EVEN_STRENGTH depth:EVEN_DEPTH max:EVEN_MAX min:EVEN_MIN; do
      _n=${_o#*:}
      [[ "${!_n}" == auto ]] || _es+=("--${_o%%:*}" "${!_n}")
    done
    python "$srcdir/even_spacing.py" "${_es[@]}" -o "$srcdir/spaced" "$_hintsrc"/*.ttf
    _hintsrc="$srcdir/spaced"
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
  elif [[ -n "$EVEN_SPACING" ]]; then
    _out="$srcdir/spaced"     # patched (if Nerd) and spaced
  elif [[ "$NERD_PATCH" == true ]]; then
    _out="$srcdir/patched"
  fi
  if [[ -n "$FEATURE_DEFAULTS" ]]; then _out="$srcdir/featured"; fi
  if ! compgen -G "$_out/*.ttf" >/dev/null; then
    echo "Error: no fonts to install in $_out." >&2; exit 1
  fi
  local _fontdir="$pkgdir/usr/share/fonts/akt"
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
