# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-geologica-hinted
_geover=1.010
_geocommit=685f38d7c9e86b0c8530204c97ddcaf6558dd17b
_nfver=3.5.1
pkgver="${_geover}"
pkgrel=7
pkgdesc='Geologica, a humanist-geometric sans with Sharp/Cursive/Slant/Weight axes, re-hinted with ttfautohint for FreeType (optionally static / Nerd Fonts patched)'
arch=('any')
url='https://github.com/googlefonts/geologica'
license=('OFL-1.1')
makedepends=('python' 'python-fonttools' 'fontforge' 'parallel' 'ttfautohint')
options=(!strip)
provides=('ttf-geologica')
conflicts=('ttf-geologica')
source=(
  "GeologicaVariable.ttf::https://raw.githubusercontent.com/googlefonts/geologica/${_geocommit}/fonts/variable/Geologica%5BCRSV%2CSHRP%2Cslnt%2Cwght%5D.ttf"
  "OFL.txt::https://raw.githubusercontent.com/googlefonts/geologica/${_geocommit}/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "make_statics.py"
  "make_ui.py"
  "make_features.py"
  "set_gasp.py"
  "measure.py"
  "79-geologica-families.conf"
  "README.md"
  "FEATURES.md"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('9124d9e88ac6c11d761f35241713a51d68e2c4ebedce0edaca834717a00959ec'
            '778186245840aea0e60bec6a46e7fb1442e0cd78e41afeadffcd3e8824b379e0'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '53d9a3969632b52c7afc5b1968aab4b583c7933641ce3394735705a0cb8e450b'
            '5844c645e7d4f9a445be4ec9c049d2b84fa450efbf0179b47add06533561c478'
            '200fc13d7cf288ebd10c2832a0c9e1cf5a8b7c7e4e6283311778a2df7057581e'
            '0b0464b268525569b5fa28b4735791efb22f22829ad178629776ae3ea82d7f99'
            'cfc6aa1b72cd6649d102a0a97ad1be0fcfc12476fc75a9d8251b6afd2a724fe1'
            'be02c70c77195b258b9333d32c7eabfbc3e19d74232bd4f31e2b1a02d8424f0c'
            '64de6e9f4d9d8c52aaa01a9064b9d26886e85324e30d8b406b8d5d7440338b59'
            '1acf0491c2a831a87e1cb09e1a8151dabc02bdf80e33807c7b52ed07be2e5028')

# ── What this package does ──────────────────────────────────────────────────
#
# Geologica (Monokrom, 2023) ships as ONE variable font with four axes:
# wght 100-900 (default 100!), SHRP 0-100 (sharpness), CRSV 0-1 (cursive
# a/g), slnt 0..-12 (oblique). Upstream is ARCHIVED and has no releases: this
# package pins the variable font to the commit Google Fonts took it from, so
# the source never changes underneath us.
#
# Upstream ships NO hinting: no fpgm, no cvt, 0 glyph instructions, a 7-byte
# prep. At hintstyle hintmedium FreeType then treats the face as hinted and
# does not run its autohinter, i.e. GTK (manual mode, font-hinting medium)
# shows Geologica completely unhinted. Measured on FreeType 2.15.0, word
# "Hamburgefonstiv Αλφάβητο 0123", Regular/Medium/SemiBold, 10-20 px, the
# i/j/ï/ä/ö/ü/ë/ё/ϊ/ϋ/ΐ/ΰ dots and diaereses touching the letter body:
#
#   unhinted (hintmedium)      8/ 25/ 44/ 74 glued  at wght 100/400/700/900
#   hintslight (autohinter)    0/  2/  7/  0 glued
#   bytecode "natural" (n)     0/  5/ 18/ 22 glued
#   bytecode "balanced" (q)    0/  5/ 14/ 10 glued
#   bytecode "sharp" (s)       0/  0/ 18/ 22 glued
#
# and the deviation from the designed outline (summed coverage difference to
# an 8x supersampled unhinted render, % of its ink, best 1/8 px alignment,
# 12/13/14/16 px; lower is closer to the design):
#
#   unhinted                    3.5/ 0.8/   /   (≈0: nothing is snapped)
#   hintslight (autohinter)    12.3/12.1/10.7/ 7.5
#   bytecode natural           12.5/11.6/10.7/10.6   <- default
#   bytecode balanced          13.6/14.7/11.2/11.0
#   bytecode sharp             21.9/12.7/11.6/11.4
#   static, hinted per weight  11.7/11.5/10.2/ 7.5
#
# Two things make Geologica different from the sibling font packages:
#
# 1. Its default master is Thin, not Regular (fvar wght default 100, so the
#    fonts are even named "Geologica Thin"). ttfautohint takes its blue zones
#    from that default master, but Geologica's x-height grows with weight:
#    960 (Thin) 990 (Regular) 1020 (Bold) 1040 (Black) font units at 2000 upem,
#    and SHRP=100 pushes ascenders/descenders 40 units further. The bytecode
#    therefore snaps every weight to Thin's zones: fine at 100-400 px, up to
#    0.4 px off at 700-900, which is why "sharp"/"balanced" measure worse and
#    why the static build (one hint pass per weight) beats the VF at 700-900.
#    FreeType's own light autohinter recomputes its zones from the outline it
#    is given, so it tracks every weight and axis value - it is the best
#    renderer for Geologica, and it needs no package at all: it is what
#    hintstyle hintslight (the Arch default) already does. The bytecode this
#    package adds is for the many desktops that run hintmedium/hintfull, where
#    the unhinted upstream font renders with no hinting whatsoever.
#
# 2. pango maps the italic style to the FULL named instance (slnt=-12 AND
#    CRSV=1, the cursive a/g), and does not double-slant it: "Geologica
#    Italic 72" measures 11.96 degrees and is pixel-identical to
#    "@slnt=-12,CRSV=1". No fontconfig rule is needed, unlike Roboto Flex.
#    fontconfig exposes all 18 named instances as styles of "Geologica", and
#    pango takes wght from the requested weight: "Geologica 12" is
#    pixel-identical to "@wght=400", "Geologica Bold" to "@wght=700". The
#    Thin default therefore does not leak into applications. Browsers are the
#    exception: they map italic to slnt only (CSS has no CRSV), so add
#    font-feature-settings: "ss01" for the cursive forms - ss01 is
#    pixel-identical to CRSV=1 (verified with pango 1.58).
#
# FreeType only runs TrueType bytecode at hintstyle hintmedium/hintfull. This
# package ships (not enabled) /usr/share/fontconfig/conf.avail/80-$pkgname.conf
# which turns bytecode hinting on for the installed families only, and
# excludes Chromium/Electron by prgname (at device scale 1 they round every
# advance at hintmedium). It only affects clients that read hinting from
# fontconfig (Firefox, Chromium, Qt, kitty/foot): GTK3/GTK4 in manual mode take
# the hint style from gsettings and ignore fontconfig's hintstyle. See
# README.md for the recommended desktop settings, which for Geologica are
# hintslight + stem darkening, not hintmedium.
#
# ── Build-time options ───────────────────────────────────────────────────────
#
# Run from a terminal, prepare() asks for GEO_VARIANT, NERD_PATCH, HINTING and
# HINT_PRESET (Enter keeps the default). Any of them already set in the
# environment is not asked. Without a TTY nothing is asked and the
# environment / defaults below apply. Answers are saved to $srcdir/.build_opts.
#
#  GEO_VARIANT  variable|static  (default: variable)
#                 variable  the single 4-axis font: every axis stays usable
#                 static    one TTF per weight (and italic), cut with the
#                           fontTools instancer; each one is hinted on its own,
#                           so its blue zones match that exact weight
#
#  STATIC_WEIGHTS "100 ... 900"  wght values to cut (default: all nine:
#                 100 200 300 400 500 600 700 800 900)
#  STATIC_ITALIC  true/false     also cut the italic (CRSV=1, slnt=-12),
#                                default true
#  STATIC_SHRP    0|100          cut the normal or the Sharp (SHRP=100) design;
#                                Sharp statics become the family
#                                "Geologica Sharp", as in the Monokrom release
#
#  GEO_UI_WEIGHT  none|100|200|300  (default: none)
#                 Also install "Geologica UI": a second copy of the variable
#                 font whose Regular draws this weight (an avar table shifts
#                 the wght scale: 400 -> N, Bold 700 and the ends unchanged).
#                 For a light desktop font: GTK3/GTK4 drop the weight from
#                 gsettings font-name, so 'Geologica Thin 11' renders at 400;
#                 'Geologica UI 11' renders Thin, in every program, with no
#                 fontconfig rule, while "Geologica" keeps all its weights.
#                 Variable build only. See README.md section 1.4.
#
#  GEO_UI_FEATURES  "ss01" or empty  (default: empty)
#                 GSUB features Geologica UI applies by default. ss01 = the
#                 cursive a/g. fontconfig fontfeatures reach pango only;
#                 Chromium/Electron/Qt ignore them, so the feature is built
#                 into the font (its lookups join calt). README section 1.5.
#
#  NERD_PATCH  true/false  Patch with Nerd Fonts glyphs (default: false).
#                          font-patcher drops variable axes, so this forces
#                          GEO_VARIANT=static. Family becomes
#                          "Geologica Nerd Font (Mono|Propo)".
#
#  HINTING     true/false  Hint with ttfautohint (default: true). false installs
#                          the fonts as upstream ships them: no hinting at all
#                          at hintmedium, the autohinter at hintslight.
#
#  HINT_PRESET  name       Named bundle of ttfautohint flags (default: natural)
#                          ("Linux" = the stem letter FreeType v40 actually uses)
#               natural    stem=nnn (Linux: n)  range 8-48   x-height 0   (closest to
#                                                                       the outline; best
#                                                                       measured preset)
#               balanced   stem=qsq (Linux: q)  range 8-48   x-height 14  (ttfautohint
#                                                                       defaults; opens the
#                                                                       dots at 700-900)
#               sharp      stem=sss (Linux: s)  range 6-48   x-height 14  (highest
#                                                                       contrast, distorts
#                                                                       Thin badly: 21.9)
#               light      stem=nnn (Linux: n)  range 12-48  x-height 0   (HiDPI; <12px
#                                                                       left alone)
#               custom     use the individual HINT_* vars below verbatim
#
#  Individual ttfautohint knobs (override the preset; empty = use preset value):
#  HINT_MODE       nnn|qqq|qsq|sss   3-char --stem-width-mode (grayscale/GDI/DW)
#                        On Linux only the 3rd letter has an effect.
#  HINT_RANGE_MIN  N    --hinting-range-min
#  HINT_RANGE_MAX  N    --hinting-range-max
#  HINT_LIMIT      N    --hinting-limit (default: HINT_RANGE_MAX; 0 = no limit)
#  HINT_XHEIGHT    N    --increase-x-height (0 = disable)
#  HINT_XSNAP_EXC  STR  --x-height-snapping-exceptions (unset = none)
#  HINT_DEFAULT_SCRIPT  STR  --default-script (default: latn)
#  HINT_FALLBACK_SCRIPT STR  --fallback-script (default: latn; Nerd-patched
#                        builds always use none plus --fallback-scaling)
#  HINT_WINCOMPAT  true/false  --windows-compatibility (two extra blue zones
#                        for GDI ClearType; Windows/Wine only)
#  HINT_TTFA_TABLE true/false  --ttfa-table (default: false)
#  HINT_FAMILY_SUFFIX  STR     -F/--family-suffix, e.g. " Hinted"
#
#  HINT_INTEGER_PPEM  true/false  Set head.flags bit 3 ("ppem is always an
#                        integer"), which ttfautohint leaves clear and fontbakery
#                        wants set for hinted fonts (default: false). On Linux
#                        it is not cosmetic: FreeType then rounds fractional
#                        sizes up to whole pixels, measured +19% ink at 8 pt
#                        and +16% at 11 pt (96 dpi) on this font, so text is
#                        bigger and line breaks shift. Enable it only to match
#                        Windows GDI, not for Unix desktops.
#
#  GASP_MODE  keep|sized|smooth|gridfit  (default: keep; FreeType ignores gasp,
#             Windows uses it)
#               keep     leave the gasp table as ttfautohint wrote it
#               sized    MS strategy: <=8 grayscale, 9-16 gridfit, 17+ both
#               smooth   all sizes anti-aliased ({0xFFFF: 15})
#               gridfit  all sizes gridfit+grayscale ({0xFFFF: 3})
#
#  ── Features every app can see (not just pango) ───────────────────────────
#
#  FEATURE_DEFAULTS  "tag,tag,..."  (default: empty = leave the fonts alone)
#                 Bake these GSUB features into the font's 'calt' feature, so
#                 that EVERY renderer applies them, not only pango. For the
#                 reason, see the note at the bottom of this block.
#                 Asked during the build as well (none / the recommended set /
#                 a list of your own); the variables below are what an
#                 unattended build uses. FEATURE_FAMILY stays environment-only
#                 on purpose: it renames every file to one family, which would
#                 merge the cuts a multi-family build installs.
#
#                 The one that matters here is
#                     FEATURE_DEFAULTS="ss01"
#                 ss01 = the cursive a and g, the same 42 glyphs the CRSV axis
#                 produces. fontconfig already turns it on for pango (see the
#                 Geologica block in ~/.config/fontconfig/fonts.conf); baking
#                 it makes Chromium, Electron, Qt and LibreOffice show the
#                 same thing with no CSS and no config. This is what
#                 GEO_UI_FEATURES does to the "Geologica UI" copy, except that
#                 FEATURE_DEFAULTS applies to whatever this build installs:
#                 the variable font, the statics, or the Nerd Fonts build.
#                 tnum and case are the only other candidates (proportional
#                 figures are the default, so tnum is a per-context request);
#                 never aalt or ordn, which make_features.py refuses.
#
#  FEATURE_FAMILY  "Name"  (default: empty = edit the fonts in place)
#                 Install the result as this family instead, so the stock
#                 Geologica stays available. The name must not end in a pango
#                 style word (Thin, Bold, Italic, ...). It cannot be combined
#                 with GEO_UI_WEIGHT: both would rename the same file.
#                 With a rename, the shipped 79-geologica-families.conf stops
#                 matching (its <test family="Geologica">), so the "Geologica
#                 Sharp"/"Geologica Cursive" names are not applied to it; the
#                 axes are still there, under the new name.
#
#  Why calt: fontconfig's fontfeatures is read by pango/GTK only. Chromium,
#  Electron, Qt, LibreOffice, kitty and Firefox ignore it, and a browser can
#  only ask from page CSS. A shaper applies a fixed list of features whatever
#  the font declares (ccmp locl mark mkmk kern calt liga clig rlig), so
#  moving a feature's lookups into calt is the only way to make it the
#  default in every program. Verified in Chromium: the baked font with no CSS
#  at all is pixel-identical to the stock one with font-feature-settings
#  listing the same tags. CSS can still say "calt" 0, which also drops
#  Geologica's own calt rules (Greek caps setting, ano teleia, f.calt/j.calt).
#
#  Examples:
#    makepkg -si                              (asks, when run from a terminal)
#    makepkg -si </dev/null                   (never asks: defaults only)
#    GEO_VARIANT=static makepkg -si
#    GEO_VARIANT=static STATIC_SHRP=100 STATIC_ITALIC=false makepkg -si
#    HINT_PRESET=balanced makepkg -si
#    GEO_UI_WEIGHT=100 makepkg -si           (Thin as the desktop font)
#    GEO_UI_WEIGHT=300 GEO_UI_FEATURES=ss01 makepkg -si
#    FEATURE_DEFAULTS=ss01 makepkg -si        (cursive a/g in every app)
#    NERD_PATCH=true STATIC_WEIGHTS="400 500 700" makepkg -si
# ────────────────────────────────────────────────────────────────────────────

_opt_keys=(GEO_VARIANT GEO_UI_WEIGHT GEO_UI_FEATURES FEATURE_DEFAULTS FEATURE_FAMILY
           STATIC_WEIGHTS STATIC_ITALIC STATIC_SHRP NERD_PATCH
           HINTING HINT_PRESET HINT_MODE HINT_RANGE_MIN HINT_RANGE_MAX
           HINT_LIMIT HINT_XHEIGHT HINT_XSNAP_EXC HINT_DEFAULT_SCRIPT
           HINT_FALLBACK_SCRIPT HINT_WINCOMPAT HINT_TTFA_TABLE
           HINT_FAMILY_SUFFIX HINT_INTEGER_PPEM GASP_MODE)

# _ask_yn QUESTION DEFAULT(y|n) -> sets _yn to true/false
_ask_yn() {
  local _ans
  read -r -p "  $1? [$2] " _ans || _ans=""
  [[ "${_ans:-$2}" =~ ^[yY] ]] && _yn=true || _yn=false
}

# _ask_choice TITLE DEFAULT KEY:description ... -> sets _choice to a KEY.
# Enter (or EOF) keeps DEFAULT; anything else must be a listed number.
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

# Called once, from prepare(): ask for whatever the environment has not set,
# but only on a terminal, then save every set option to .build_opts.
_prompt_options() {
  if [[ -t 0 ]]; then
    echo ""
    echo "  $pkgname: build options (Enter = default)"
    echo ""
    if [[ -z "${NERD_PATCH:-}" ]]; then
      _ask_yn "Patch with Nerd Fonts glyphs (forces static fonts)" n; NERD_PATCH=$_yn
    fi
    if [[ "$NERD_PATCH" != true && -z "${GEO_VARIANT:-}" ]]; then
      _ask_choice "Font set" variable \
        "variable:one 4-axis font (recommended)" \
        "static:one file per weight/italic, hinted per weight"
      GEO_VARIANT=$_choice
    fi
    if [[ "${GEO_VARIANT:-variable}" == variable && -z "${GEO_UI_WEIGHT:-}" ]]; then
      _ask_choice "Also install \"Geologica UI\" (Regular drawn lighter, for font-name)" none \
        "none:no" \
        "100:Regular draws Thin" \
        "200:Regular draws ExtraLight" \
        "300:Regular draws Light"
      GEO_UI_WEIGHT=$_choice
    fi
    if [[ "${GEO_UI_WEIGHT:-none}" != none && "${GEO_UI_FEATURES+set}" != set ]]; then
      _ask_yn "Cursive a/g (ss01) by default in Geologica UI, also in browsers" n
      [[ "$_yn" == true ]] && GEO_UI_FEATURES=ss01 || GEO_UI_FEATURES=""
    fi
    echo ""
    echo "  ── OpenType features ────────────────────────────────────"
    echo "  A font cannot declare a feature \"on by default\": programs apply a fixed"
    echo "  list (kern calt liga ...) and ignore the rest. Baking moves a feature's"
    echo "  lookups into calt, which every program applies - the only way Chromium,"
    echo "  Electron, Qt and LibreOffice honour one, since they never read"
    echo "  fontconfig's fontfeatures. GTK is covered either way by fonts.conf."
    _ask_choice "Bake features into calt" none \
      "none:leave the fonts as upstream ships them (default)" \
      "cursive:ss01 - cursive a and g, the shape the CRSV axis draws" \
      "custom:type the tag list yourself"
    case $_choice in
      none)    FEATURE_DEFAULTS="" ;;
      cursive) FEATURE_DEFAULTS="ss01" ;;
      custom)
        echo "  Tags, comma or space separated (e.g. \"ss01\"):"
        read -r -p "  > " _tags || _tags=""
                _tags="${_tags//[[:space:]]/,}"          # "a b" == "a,b"
        while [[ "$_tags" == *,,* ]]; do _tags="${_tags//,,/,}"; done
        _tags="${_tags#,}"; _tags="${_tags%,}"
        FEATURE_DEFAULTS="$_tags"
        [[ -n "$FEATURE_DEFAULTS" ]] || echo "  Nothing entered - baking nothing."
        ;;
    esac
    if [[ -n "$FEATURE_DEFAULTS" ]]; then
      echo ""
      echo "A copy under another family name keeps the stock look available; set"
      echo "FEATURE_FAMILY to the name for it (e.g. FEATURE_FAMILY=\"Geologica Alt\") and"
      echo "build again. Without it the packaged files keep their names and the"
      echo "features apply everywhere, with no way back except CSS \"calt\" 0."
    fi
    if [[ -z "${HINTING:-}" ]]; then
      _ask_yn "Hint with ttfautohint (n = unhinted, as upstream)" y; HINTING=$_yn
    fi
    if [[ "$HINTING" == true && -z "${HINT_PRESET:-}" ]]; then
      _ask_choice "Hinting preset" natural \
        "natural:stem n, 8-48px, no x-height boost (measured best)" \
        "balanced:stem q, 8-48px (ttfautohint defaults, opens the dots)" \
        "sharp:stem s, 6-48px (highest contrast, distorts Thin)" \
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
    # "set" rather than non-empty: HINT_XSNAP_EXC="" (no exceptions) differs
    # from HINT_XSNAP_EXC unset (ttfautohint's default).
    if [[ "${!_k+set}" == set ]]; then
      printf '%s=%s\n' "$_k" "${!_k}" >> "$srcdir/.build_opts"
    fi
  done
}

# Load .build_opts (whitelisted keys only), then apply defaults and validate.
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

  GEO_VARIANT="${GEO_VARIANT:-variable}"
  GEO_UI_WEIGHT="${GEO_UI_WEIGHT:-none}"
  GEO_UI_FEATURES="${GEO_UI_FEATURES:-}"
  FEATURE_DEFAULTS="${FEATURE_DEFAULTS:-}"
  FEATURE_FAMILY="${FEATURE_FAMILY:-}"
  STATIC_WEIGHTS="${STATIC_WEIGHTS:-100 200 300 400 500 600 700 800 900}"
  STATIC_ITALIC="${STATIC_ITALIC:-true}"
  STATIC_SHRP="${STATIC_SHRP:-0}"
  NERD_PATCH="${NERD_PATCH:-false}"
  HINTING="${HINTING:-true}"
  HINT_PRESET="${HINT_PRESET:-natural}"
  GASP_MODE="${GASP_MODE:-keep}"
  HINT_WINCOMPAT="${HINT_WINCOMPAT:-false}"
  HINT_TTFA_TABLE="${HINT_TTFA_TABLE:-false}"
  HINT_INTEGER_PPEM="${HINT_INTEGER_PPEM:-false}"
  HINT_DEFAULT_SCRIPT="${HINT_DEFAULT_SCRIPT:-latn}"
  HINT_FALLBACK_SCRIPT="${HINT_FALLBACK_SCRIPT:-latn}"

  case "$GEO_VARIANT" in
    variable|static) ;;
    *) echo "Error: GEO_VARIANT='$GEO_VARIANT' invalid (variable|static)." >&2; exit 1 ;;
  esac
  for _v in STATIC_ITALIC NERD_PATCH HINTING HINT_WINCOMPAT HINT_TTFA_TABLE HINT_INTEGER_PPEM; do
    case "${!_v}" in
      true|false) ;;
      *) echo "Error: $_v='${!_v}' must be true or false." >&2; exit 1 ;;
    esac
  done
  # font-patcher drops fvar/gvar, so patching always works on statics.
  if [[ "$NERD_PATCH" == true && "$GEO_VARIANT" == variable ]]; then
    echo "==> Note: the variable font cannot be Nerd-patched; using GEO_VARIANT=static."
    GEO_VARIANT=static
  fi
  case "$GEO_UI_WEIGHT" in
    none|100|200|300) ;;
    *) echo "Error: GEO_UI_WEIGHT='$GEO_UI_WEIGHT' invalid (none|100|200|300)." >&2; exit 1 ;;
  esac
  for _v in ${GEO_UI_FEATURES//,/ }; do
    if [[ ! "$_v" =~ ^[a-z0-9]{4}$ ]]; then
      echo "Error: GEO_UI_FEATURES: '$_v' is not a feature tag (e.g. ss01)." >&2; exit 1
    fi
  done
  if [[ "$GEO_UI_WEIGHT" != none && "$GEO_VARIANT" != variable ]]; then
    echo "==> Note: \"Geologica UI\" needs the variable font; GEO_UI_WEIGHT ignored."
    GEO_UI_WEIGHT=none
  fi
  for _v in ${FEATURE_DEFAULTS//,/ }; do
    if [[ ! "$_v" =~ ^[A-Za-z0-9]{4}$ ]]; then
      echo "Error: FEATURE_DEFAULTS: '$_v' is not a feature tag (e.g. ss01)." >&2
      exit 1
    fi
  done
  if [[ -n "$FEATURE_FAMILY" && "$GEO_UI_WEIGHT" != none ]]; then
    echo "Error: FEATURE_FAMILY=\"$FEATURE_FAMILY\" would rename both the main font and" >&2
    echo "  the Geologica UI copy to the same family. Use one or the other." >&2
    exit 1
  fi
  for _v in $STATIC_WEIGHTS; do
    case "$_v" in
      100|200|300|400|500|600|700|800|900) ;;
      *) echo "Error: STATIC_WEIGHTS: '$_v' is not 100, 200, ... 900." >&2; exit 1 ;;
    esac
  done
  case "$STATIC_SHRP" in
    0|100) ;;
    *) echo "Error: STATIC_SHRP='$STATIC_SHRP' must be 0 or 100." >&2; exit 1 ;;
  esac

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
  # A preset never overrides a value the user set explicitly.
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

# _bake_features SRCDIR: move the lookups of FEATURE_DEFAULTS into calt, on the
# files this build ended up with, into $srcdir/featured. Last step on purpose:
# ttfautohint never sees the extra lookups. Note that the Geologica UI copy is
# already baked by make_ui.py when GEO_UI_FEATURES is set; merging the same
# lookups twice is a no-op.
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

  echo "==> Options: variant=$GEO_VARIANT ui=$GEO_UI_WEIGHT${GEO_UI_FEATURES:+ ui-features=$GEO_UI_FEATURES} nerd=$NERD_PATCH hinting=$HINTING"
  if [[ "$GEO_VARIANT" == static ]]; then
    echo "==> Statics: weights='$STATIC_WEIGHTS' italic=$STATIC_ITALIC shrp=$STATIC_SHRP"
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
  if [[ "$GEO_VARIANT" == variable ]]; then
    # A plain filename: brackets in file names upset some tools and globs.
    install -m644 "$srcdir/GeologicaVariable.ttf" "$srcdir/selected/GeologicaVariable.ttf"
    if [[ "$GEO_UI_WEIGHT" != none ]]; then
      echo "==> Deriving Geologica UI..."
      python "$srcdir/make_ui.py" --regular "$GEO_UI_WEIGHT" --features "$GEO_UI_FEATURES" \
        -o "$srcdir/selected/GeologicaUIVariable.ttf" "$srcdir/GeologicaVariable.ttf"
    fi
  else
    echo "==> Cutting static instances..."
    local -a _italics=("0 0")
    [[ "$STATIC_ITALIC" == true ]] && _italics+=("1 -12")
    local _w _ic
    for _w in $STATIC_WEIGHTS; do
      for _ic in "${_italics[@]}"; do
        printf '%s %s %s %s\n' "$_w" "$STATIC_SHRP" "${_ic% *}" "${_ic#* }"
      done
    done | parallel --will-cite -j"$(nproc)" --colsep ' ' \
      python "$srcdir/make_statics.py" --wght {1} --shrp {2} --crsv {3} --slnt {4} \
        -o "$srcdir/selected" "$srcdir/GeologicaVariable.ttf"
  fi
  local _count
  _count=$(find "$srcdir/selected" -name '*.ttf' | wc -l)
  echo "==> Selected $_count font file(s)."
  if (( _count == 0 )); then
    echo "Error: no fonts produced." >&2; exit 1
  fi

  local _hintsrc="$srcdir/selected"

  # ── Step 2: Nerd Fonts patching ─────────────────────────────────────────────
  # Patch first, hint afterwards: font-patcher does not keep hint bytecode, and
  # ttfautohint then sees the final glyph set including the icons.
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
  # On the variable font ttfautohint keeps fvar/gvar/STAT/MVAR and all 18
  # named instances, but its blue zones come from the default master (Thin).
  # On a static it hints that exact instance, which is the point of the static
  # build.
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
    # Icons would otherwise get Latin blue zones: scale them instead.
    _ta_opts+=(--fallback-script=none --fallback-scaling)
  else
    _ta_opts+=(--fallback-script="$HINT_FALLBACK_SCRIPT")
  fi
  # Honour an explicit empty HINT_XSNAP_EXC (= no exceptions); omit if unset.
  if [[ "${HINT_XSNAP_EXC+set}" == set ]]; then
    _ta_opts+=(--x-height-snapping-exceptions="$HINT_XSNAP_EXC")
  fi
  if [[ "$HINT_WINCOMPAT" == true ]]; then _ta_opts+=(--windows-compatibility); fi
  if [[ -n "${HINT_FAMILY_SUFFIX:-}" ]]; then _ta_opts+=(--family-suffix="$HINT_FAMILY_SUFFIX"); fi
  if [[ "$HINT_TTFA_TABLE" == true ]]; then _ta_opts+=(--ttfa-table); else _ta_opts+=(--no-info); fi

  # Serial on purpose: GNU parallel rebuilds the command line from its
  # arguments, so a knob whose value contains a space (HINT_FAMILY_SUFFIX="
  # Hinted", HINT_XSNAP_EXC="10-12 14") is split and ttfautohint prints its
  # usage and fails. Hinting one font takes well under a second.
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
  local _fontdir="$pkgdir/usr/share/fonts/geologica"
  install -Dm644 -t "$_fontdir" "$_out/"*.ttf
  install -Dm644 "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"

  local _avail="$pkgdir/usr/share/fontconfig/conf.avail"
  install -d "$_avail"

  # Family names for the SHRP and CRSV axes. Variable build only: the statics
  # have no axes, and with STATIC_SHRP=100 they are already "Geologica Sharp".
  if [[ "$GEO_VARIANT" == variable ]]; then
    install -Dm644 -t "$_avail" "$srcdir/79-geologica-families.conf"
  fi

  # Opt-in rendering tweak (see the header): bytecode hinting for the families
  # this build installed. Shipped in conf.avail and deliberately not enabled.
  # The family list is read from the fonts, so Nerd Fonts names and family
  # suffixes are covered.
  if [[ "$HINTING" == true ]]; then
    local _fam _conf="$_avail/80-$pkgname.conf"
    local _chromium_prgnames=(chrome chromium brave helium electron code slack signal-desktop vesktop)
    local _prg _prgtests=""
    for _prg in "${_chromium_prgnames[@]}"; do
      _prgtests+="    <test qual=\"all\" name=\"prgname\" compare=\"not_eq\"><string>$_prg</string></test>"$'\n'
    done
    {
      echo '<?xml version="1.0" encoding="UTF-8"?>'
      echo '<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">'
      echo "<!-- Installed by $pkgname. Use the ttfautohint bytecode hints in these"
      echo "     fonts rather than FreeType's light autohinter. hintmedium, not"
      echo "     hintfull: same rendering in cairo/pango, and Blink keeps subpixel"
      echo "     positioning at hintmedium but drops it at hintfull."
      echo "     Chromium and Electron apps are excluded: at device scale 1 they use"
      echo "     linear advances only for hintslight/none, so hintmedium would round"
      echo "     every glyph advance to a whole pixel (uneven letter gaps)."
      echo ""
      echo "     Geologica is a case where you may not want this file at all: its"
      echo "     x-height grows with weight, ttfautohint's blue zones are those of"
      echo "     the default (Thin) master, and FreeType's light autohinter - what"
      echo "     hintstyle hintslight already uses - measures better at 700-900."
      echo "     See README.md section 2. -->"
      echo '<fontconfig>'
      # One <match> per family: several <test>s in one <match> are ANDed, so
      # the prgname tests exclude every listed app. qual="all" makes a test
      # pass when prgname is unset. prgname is the executable's basename.
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
