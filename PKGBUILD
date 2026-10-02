# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-roboto-flex-hinted
_flexver=3.200
_nfver=3.5.1
pkgver="${_flexver}"
pkgrel=1
pkgdesc='Roboto Flex, the 13-axis variable Roboto, hinted with ttfautohint for FreeType, with working italics and fontconfig axis presets (optionally static / Nerd Fonts patched)'
arch=('any')
url='https://github.com/googlefonts/roboto-flex'
license=('OFL-1.1')
makedepends=('python' 'python-fonttools' 'fontforge' 'parallel' 'ttfautohint')
options=(!strip)
provides=('ttf-roboto-flex')
conflicts=('ttf-roboto-flex')
source=(
  "roboto-flex-fonts-${_flexver}.zip::https://github.com/googlefonts/roboto-flex/releases/download/${_flexver}/roboto-flex-fonts.zip"
  "OFL-${_flexver}.txt::https://raw.githubusercontent.com/googlefonts/roboto-flex/${_flexver}/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "make_statics.py"
  "set_gasp.py"
  "79-roboto-flex-families.conf"
  "81-roboto-flex-italic.conf"
  "README.md"
  "FEATURES.md"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('6b2b14e11308c7d3e8388b623cf740c46b872e7519198e0cff8062e52b75239b'
            '454ec26838f2b8f2e2588e759dd3742577e0d305d3359a7b81c86641fcab7d21'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '94a0ee1553e70911c9fbf24991632f85ebe7b0f6ae666ece8fc5a26590f9770c'
            '0b0464b268525569b5fa28b4735791efb22f22829ad178629776ae3ea82d7f99'
            '7cafc2f26e6490e58987f13f2a4f25334f2b30a28f89741f1eaa5bf144e3f51c'
            '38abb99dc9daaa04f43441f3036baff81270f2636c52772fba72c7454c44e2f9'
            '714b4e099545fabbadfb9eeeda513d6e15790c251ba4d6bffd909d790b063be1'
            'ed3710d5143d2724a3e9ff0248738033eb4c5a43941767309abf535efb65d656')

# ── What this package does ──────────────────────────────────────────────────
#
# Roboto Flex 3.200 ships as ONE unhinted variable font with 13 axes: opsz
# 8-144, wght 100-1000, GRAD -200..150, wdth 25-151, slnt -10..0 and eight
# parametric axes (XOPQ YOPQ XTRA YTUC YTLC YTAS YTDE YTFI). There is no
# separate italic file: italic is slnt=-10. This package installs it either as
# that variable font (default) or as static instances, hinted with
# ttfautohint, plus fontconfig snippets. README.md has the measurements and
# FEATURES.md the full axis/feature reference.
#
# Why hint it. The font has an empty prep table and no glyph instructions. At
# hintmedium FreeType treats it as hinted and does not autohint it: bitmaps
# are hash-identical to NO_HINTING, i.e. GTK (manual mode, font-hinting
# medium, which ignores fontconfig's hintstyle) shows it completely unhinted:
# 241 glued dots and 74 x-height/baseline mismatches below. Measured on FreeType 2.14.3,
# 400/500/600 roman + italic, 10-20 px, opsz = size in pt as pango sets it,
# dots/diaereses `i j ï ä ö ü ϊ ϋ ë ΐ ΰ` touching the letter body:
#
#     hintmedium, upstream      241 glued, 74 height mismatches (= unhinted)
#     hintslight (autohinter)   113 glued, incl. ä ö ü ΐ ΰ from Regular 12 px up
#     bytecode natural  (n)      47 glued, i/j only (and one ë)
#     bytecode balanced (q)      20 glued, i/j only, 0 at Regular
#     bytecode sharp    (s)      12 glued, but 78 x-height/baseline mismatches
#                                 at 10-48 px vs 19 for q
#
# Hence the default preset is "balanced". The remaining i/j cases are
# SemiBold 12/13/18/19 px; the designed gap between the dot and the stem is
# only ~1 px there (0.5-0.9 px at Black), so no hinter separates it without
# distorting the letter.
#
# Hinting the variable font: ttfautohint keeps fvar/gvar/avar/STAT/MVAR and all
# 20 named instances. Its blue zones come from the default master (opsz 14,
# wght 400). Measured flat-vs-round x-height/cap/baseline mismatches: 0 for
# every weight, wdth 25-151, GRAD -200..150 and opsz 8-24 at 10-32 px. Only
# a large opsz rendered small (opsz 36+ at 11-17 px) glues dots, and nothing
# does that: pango sets opsz = size in points, browsers opsz = CSS px.
#
# Italics: pango derives wght (from the weight) and opsz (from the size) for a
# variable font and passes them as variations, which resets every other axis
# to its default. fontconfig matches the "Italic" named instance, but its
# slnt=-10 is thrown away and the text renders upright (verified: pixel-
# identical to Regular). 81-roboto-flex-italic.conf adds slnt=-10 whenever
# Roboto Flex is asked for in italic/oblique, and marks the match italic so
# 90-synthetic.conf does not add its fake shear on top (measured 19.6 degrees
# instead of 10 without that). It is enabled by default.
#
# FreeType only runs TrueType bytecode at hintstyle hintmedium/hintfull. The
# package ships (not enabled) /usr/share/fontconfig/conf.avail/80-$pkgname.conf
# which turns it on for the installed families only; Chromium and Electron are
# excluded (at device scale 1 they round every advance at hintmedium). It only
# affects clients that read hinting from fontconfig (Firefox, Chromium, Qt,
# kitty/foot): GTK3/GTK4 in manual mode take the hint style from gsettings and
# ignore fontconfig's hintstyle. GTK needs gsettings font-rendering=manual + font-hinting=medium and
# gtk-hint-font-metrics=false. See README.md.
#
# ── Build-time options ───────────────────────────────────────────────────────
#
# Run from a terminal, prepare() asks for FLEX_VARIANT, NERD_PATCH, HINTING and
# HINT_PRESET (Enter keeps the default). Any of them already set in the
# environment is not asked. Without a TTY nothing is asked and the
# environment / defaults below apply. Answers are saved to $srcdir/.build_opts.
#
#  FLEX_VARIANT  variable|static  (default: variable)
#                  variable  the single 13-axis font: every axis stays usable,
#                            pango sets opsz from the point size
#                  static    one TTF per weight (x width x italic), cut with
#                            fontTools instancer at a fixed opsz and GRAD=0
#
#  STATIC_WEIGHTS "100 ... 1000"  wght values to cut (default: all ten:
#                  100 200 300 400 500 600 700 800 900 1000)
#  STATIC_WIDTHS  "100"            wdth values; any of 25 50 62.5 75 87.5 100
#                  112.5 125 150 151. Non-100 widths become their own family
#                  ("Roboto Flex Condensed"). (default: 100)
#  STATIC_ITALIC  true/false       also cut slnt=-10 italics (default: true)
#  STATIC_OPSZ    N                fixed optical size, 8-144 (default: 14, the
#                  opsz of upstream's named instances)
#
#  NERD_PATCH  true/false  Patch with Nerd Fonts glyphs (default: false).
#                          font-patcher drops variable axes, so this forces
#                          FLEX_VARIANT=static. Family becomes
#                          "RobotoFlex Nerd Font Propo".
#
#  HINTING     true/false  Hint with ttfautohint (default: true). false installs
#                          the fonts as upstream ships them: no hinting at all
#                          at hintmedium, the autohinter at hintslight.
#
#  HINT_PRESET  name       Named bundle of ttfautohint flags (default: balanced)
#                          ("Linux" = the stem letter FreeType v40 actually uses)
#               balanced   stem=qsq (Linux: q)  range 8-48   x-height 14  (fewest glued
#                                                                       dots without distortion)
#               natural    stem=nnn (Linux: n)  range 8-48   x-height 0   (closest to the
#                                                                       outline, more glued i/j)
#               sharp      stem=sss (Linux: s)  range 6-48   x-height 14  (highest contrast,
#                                                                       most distortion)
#               light      stem=nnn (Linux: n)  range 12-48  x-height 0   (HiDPI; <12px left alone)
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
#  HINT_WINCOMPAT  true/false  --windows-compatibility (Windows/Wine only)
#  HINT_TTFA_TABLE true/false  --ttfa-table (default: false)
#  HINT_FAMILY_SUFFIX  STR     -F/--family-suffix, e.g. " Hinted"
#
#  GASP_MODE  keep|sized|smooth|gridfit  (default: keep; FreeType ignores gasp)
#
#  ITALIC_FIX  true/false  Enable 81-roboto-flex-italic.conf by default through
#                          /usr/share/fontconfig/conf.default (default: true;
#                          variable only). false still ships it in conf.avail.
#
#  Examples:
#    makepkg -si                              (asks, when run from a terminal)
#    makepkg -si </dev/null                   (never asks: defaults only)
#    HINT_PRESET=natural makepkg -si
#    FLEX_VARIANT=static STATIC_WIDTHS="75 100" makepkg -si
#    NERD_PATCH=true STATIC_WEIGHTS="400 500 700" makepkg -si
# ────────────────────────────────────────────────────────────────────────────

_opt_keys=(FLEX_VARIANT STATIC_WEIGHTS STATIC_WIDTHS STATIC_ITALIC STATIC_OPSZ
           NERD_PATCH HINTING HINT_PRESET HINT_MODE HINT_RANGE_MIN HINT_RANGE_MAX
           HINT_LIMIT HINT_XHEIGHT HINT_XSNAP_EXC HINT_DEFAULT_SCRIPT
           HINT_FALLBACK_SCRIPT HINT_WINCOMPAT HINT_TTFA_TABLE HINT_FAMILY_SUFFIX
           GASP_MODE ITALIC_FIX)

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
    if [[ "$NERD_PATCH" != true && -z "${FLEX_VARIANT:-}" ]]; then
      _ask_choice "Font set" variable \
        "variable:one 13-axis font, automatic optical size (recommended)" \
        "static:one file per weight/width/italic at a fixed opsz"
      FLEX_VARIANT=$_choice
    fi
    if [[ -z "${HINTING:-}" ]]; then
      _ask_yn "Hint with ttfautohint (n = unhinted, as upstream)" y; HINTING=$_yn
    fi
    if [[ "$HINTING" == true && -z "${HINT_PRESET:-}" ]]; then
      _ask_choice "Hinting preset" balanced \
        "balanced:stem q, 8-48px (fewest glued dots, measured best)" \
        "natural:stem n, 8-48px, no x-height boost (closest to outline)" \
        "sharp:stem s, 6-48px (highest contrast, harsher shapes)" \
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

  FLEX_VARIANT="${FLEX_VARIANT:-variable}"
  STATIC_WEIGHTS="${STATIC_WEIGHTS:-100 200 300 400 500 600 700 800 900 1000}"
  STATIC_WIDTHS="${STATIC_WIDTHS:-100}"
  STATIC_ITALIC="${STATIC_ITALIC:-true}"
  STATIC_OPSZ="${STATIC_OPSZ:-14}"
  NERD_PATCH="${NERD_PATCH:-false}"
  HINTING="${HINTING:-true}"
  HINT_PRESET="${HINT_PRESET:-balanced}"
  GASP_MODE="${GASP_MODE:-keep}"
  HINT_WINCOMPAT="${HINT_WINCOMPAT:-false}"
  HINT_TTFA_TABLE="${HINT_TTFA_TABLE:-false}"
  HINT_DEFAULT_SCRIPT="${HINT_DEFAULT_SCRIPT:-latn}"
  HINT_FALLBACK_SCRIPT="${HINT_FALLBACK_SCRIPT:-latn}"
  ITALIC_FIX="${ITALIC_FIX:-true}"

  case "$FLEX_VARIANT" in
    variable|static) ;;
    *) echo "Error: FLEX_VARIANT='$FLEX_VARIANT' invalid (variable|static)." >&2; exit 1 ;;
  esac
  for _v in STATIC_ITALIC NERD_PATCH HINTING HINT_WINCOMPAT HINT_TTFA_TABLE ITALIC_FIX; do
    case "${!_v}" in
      true|false) ;;
      *) echo "Error: $_v='${!_v}' must be true or false." >&2; exit 1 ;;
    esac
  done
  # font-patcher drops fvar/gvar, so patching always works on statics.
  if [[ "$NERD_PATCH" == true && "$FLEX_VARIANT" == variable ]]; then
    echo "==> Note: the variable font cannot be Nerd-patched; using FLEX_VARIANT=static."
    FLEX_VARIANT=static
  fi
  for _v in $STATIC_WEIGHTS; do
    case "$_v" in
      100|200|300|400|500|600|700|800|900|1000) ;;
      *) echo "Error: STATIC_WEIGHTS: '$_v' is not 100, 200, ... 1000." >&2; exit 1 ;;
    esac
  done
  for _v in $STATIC_WIDTHS; do
    case "$_v" in
      25|50|62.5|75|87.5|100|112.5|125|150|151) ;;
      *) echo "Error: STATIC_WIDTHS: '$_v' is not one of 25 50 62.5 75 87.5 100 112.5 125 150 151." >&2
         exit 1 ;;
    esac
  done
  if [[ ! "$STATIC_OPSZ" =~ ^[0-9]+(\.[0-9]+)?$ ]] || \
     ! awk -v o="$STATIC_OPSZ" 'BEGIN { exit !(o >= 8 && o <= 144) }'; then
    echo "Error: STATIC_OPSZ='$STATIC_OPSZ' must be a number from 8 to 144." >&2; exit 1
  fi

  local _m _lo _hi _xh
  case "$HINT_PRESET" in
    balanced) _m=qsq; _lo=8;  _hi=48; _xh=14 ;;
    natural)  _m=nnn; _lo=8;  _hi=48; _xh=0  ;;
    sharp)    _m=sss; _lo=6;  _hi=48; _xh=14 ;;
    light)    _m=nnn; _lo=12; _hi=48; _xh=0  ;;
    custom)   _m=qsq; _lo=8;  _hi=48; _xh=14 ;;
    *)
      echo "Error: unknown HINT_PRESET='$HINT_PRESET'." >&2
      echo "  Valid: balanced natural sharp light custom" >&2
      exit 1 ;;
  esac
  # A preset never overrides a value the user set explicitly.
  HINT_MODE="${HINT_MODE:-$_m}"
  HINT_RANGE_MIN="${HINT_RANGE_MIN:-$_lo}"
  HINT_RANGE_MAX="${HINT_RANGE_MAX:-$_hi}"
  HINT_LIMIT="${HINT_LIMIT:-$HINT_RANGE_MAX}"
  HINT_XHEIGHT="${HINT_XHEIGHT:-$_xh}"

  if [[ ! "$HINT_MODE" =~ ^[nqs]{3}$ ]]; then
    echo "Error: HINT_MODE='$HINT_MODE' must be 3 chars from n/q/s (e.g. qsq)." >&2
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

build() {
  _resolve_options

  echo "==> Options: variant=$FLEX_VARIANT nerd=$NERD_PATCH hinting=$HINTING"
  if [[ "$FLEX_VARIANT" == static ]]; then
    echo "==> Statics: weights='$STATIC_WEIGHTS' widths='$STATIC_WIDTHS'" \
         "italic=$STATIC_ITALIC opsz=$STATIC_OPSZ"
  fi
  if [[ "$HINTING" == true ]]; then
    echo "==> ttfautohint: preset=$HINT_PRESET stem=$HINT_MODE" \
         "range=$HINT_RANGE_MIN-$HINT_RANGE_MAX limit=$HINT_LIMIT x-height=$HINT_XHEIGHT" \
         "x-snap-exc='${HINT_XSNAP_EXC-<default>}' gasp=$GASP_MODE" \
         "ttfa-table=$HINT_TTFA_TABLE${HINT_FAMILY_SUFFIX:+ suffix='$HINT_FAMILY_SUFFIX'}"
  fi

  rm -rf "$srcdir/selected" "$srcdir/patched" "$srcdir/hinted"
  mkdir -p "$srcdir/selected" "$srcdir/patched" "$srcdir/hinted"

  # ── Step 1: select ──────────────────────────────────────────────────────────
  # roboto-flex-fonts.zip layout:
  #   roboto-flex-fonts/fonts/variable/RobotoFlex[GRAD,XOPQ,...,wght].ttf
  #   roboto-flex-fonts/out/proof/...   (diffenator proofs, not installed)
  local _vf
  _vf=$(find "$srcdir/roboto-flex-fonts/fonts/variable" -maxdepth 1 -name 'RobotoFlex*.ttf' | head -n1)
  if [[ -z "$_vf" ]]; then
    echo "Error: variable font not found in the zip. Has the layout changed?" >&2; exit 1
  fi

  if [[ "$FLEX_VARIANT" == variable ]]; then
    # A plain filename: brackets in file names upset some tools and globs.
    cp "$_vf" "$srcdir/selected/RobotoFlex-Variable.ttf"
  else
    echo "==> Cutting static instances (opsz $STATIC_OPSZ)..."
    local -a _slnts=(0)
    [[ "$STATIC_ITALIC" == true ]] && _slnts+=(-10)
    local _w _d _s
    for _d in $STATIC_WIDTHS; do
      for _w in $STATIC_WEIGHTS; do
        for _s in "${_slnts[@]}"; do
          printf '%s %s %s\n' "$_w" "$_d" "$_s"
        done
      done
    done | parallel --will-cite -j"$(nproc)" --colsep ' ' \
      python "$srcdir/make_statics.py" --wght {1} --wdth {2} --slnt {3} \
        --opsz "$STATIC_OPSZ" -o "$srcdir/selected" "$_vf"
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
    return 0
  fi

  # ── Step 3: ttfautohint ─────────────────────────────────────────────────────
  # Works on the variable font too: fvar/gvar/avar/STAT/MVAR and the named
  # instances are kept, blue zones come from the default master.
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

  echo "==> Hinting with ttfautohint..."
  find "$_hintsrc" -maxdepth 1 -name '*.ttf' | sort | \
    parallel --will-cite -j"$(nproc)" --halt now,fail=1 \
      ttfautohint "${_ta_opts[@]}" {} "$srcdir/hinted/{/}"

  if [[ "$GASP_MODE" != keep ]]; then
    echo "==> Applying gasp mode '$GASP_MODE'..."
    python "$srcdir/set_gasp.py" "$GASP_MODE" "$srcdir/hinted/"*.ttf
  fi
}

package() {
  _resolve_options

  local _out="$srcdir/selected"
  if [[ "$HINTING" == true ]]; then
    _out="$srcdir/hinted"
  elif [[ "$NERD_PATCH" == true ]]; then
    _out="$srcdir/patched"
  fi
  if ! compgen -G "$_out/*.ttf" >/dev/null; then
    echo "Error: no fonts to install in $_out." >&2; exit 1
  fi
  local _fontdir="$pkgdir/usr/share/fonts/roboto-flex"
  install -Dm644 -t "$_fontdir" "$_out/"*.ttf
  install -Dm644 "$srcdir/OFL-${_flexver}.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"

  local _avail="$pkgdir/usr/share/fontconfig/conf.avail"
  install -d "$_avail"

  # The variable font only: italics through slnt (enabled by default, see the
  # header) and the opt-in width/grade family presets.
  if [[ "$FLEX_VARIANT" == variable ]]; then
    install -Dm644 -t "$_avail" "$srcdir/81-roboto-flex-italic.conf" \
                                "$srcdir/79-roboto-flex-families.conf"
    if [[ "$ITALIC_FIX" == true ]]; then
      install -d "$pkgdir/usr/share/fontconfig/conf.default"
      ln -s ../conf.avail/81-roboto-flex-italic.conf \
        "$pkgdir/usr/share/fontconfig/conf.default/81-roboto-flex-italic.conf"
    fi
  fi

  # Opt-in rendering tweak (see the header): bytecode hinting for the families
  # this build installed. Shipped in conf.avail and deliberately not enabled.
  # The family list is read from the fonts, so Nerd Fonts names, width
  # families and family suffixes are covered.
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
      echo "     every glyph advance to a whole pixel (uneven letter gaps). -->"
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
