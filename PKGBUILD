# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-misans-latin-hinted
pkgver=4.007
pkgrel=2
pkgdesc="MiSans Latin (Latin, Greek, Cyrillic) by Xiaomi, autohinted with ttfautohint and with fontconfig-friendly weight classes"
arch=(any)
url="https://hyperos.mi.com/font/en/download/"
license=(LicenseRef-MiSans)
makedepends=(python python-fonttools ttfautohint)
provides=(ttf-misans-latin)
conflicts=(ttf-misans-latin)
options=(!strip)
# Xiaomi re-uploads the zip in place without a version in the URL, so the
# local file name carries pkgver and the checksum is pinned: a silent upstream
# re-spin fails the checksum instead of slipping through. prepare() also checks
# that the fonts really are version $pkgver.
source=("MiSans_Latin-${pkgver}.zip::https://hyperos.mi.com/font-download/MiSans_Latin.zip"
        "LICENSE.pdf::https://hyperos.mi.com/font-download/MiSans字体知识产权许可协议.pdf"
        "fix_weights.py"
        "set_gasp.py")
sha256sums=('d24091ccd409a4152ffcc12cd659c16df9cdcdb4c702d8ae355b321e711f0004'
            '4a93a27cd2bd81b3b5ecfd0a853144a876fa26938a93a68443c67d74172fcb86'
            'f7b025ab723a672e0c821c610251199d04a5342c265483eafeb35f3e5f0be45b'
            '0b0464b268525569b5fa28b4735791efb22f22829ad178629776ae3ea82d7f99')

# ── Licensing note ──────────────────────────────────────────────────────────
#
# The MiSans license (§2.2) forbids adapting or redeveloping the fonts. This
# PKGBUILD distributes no font files: it downloads Xiaomi's originals and hints
# them locally on the user's machine, for that user's own use. You are
# responsible for deciding whether that is acceptable to you.
#
# ── What this package does ──────────────────────────────────────────────────
#
# Upstream MiSans Latin 4.007 ships effectively unhinted: the static TTFs carry
# an 8-byte 'prep' program and not a single glyph instruction. This package:
#
#   1. takes the ten static TTF weights (Thin … Heavy); the variable font, OTF
#      and WOFF/WOFF2 files are not used
#   2. optionally normalises usWeightClass (FIX_WEIGHTS, default on). Stock
#      weights make fontconfig pick Medium for "regular" and Heavy for "bold";
#      see fix_weights.py
#   3. hints every weight with ttfautohint, which detects the Latin, Greek and
#      Cyrillic scripts and builds separate blue zones for each. Each weight
#      takes its blue zones from its own outlines (HINT_REFERENCE=false)
#   4. optionally rewrites the gasp table (GASP_MODE)
#
# Measured on FreeType 2.14.3 (v40 interpreter, grayscale), rendered through
# pango/cairo at 9-16px:
#
#   * Only the THIRD letter of --stem-width-mode matters on Linux. v40 reports
#     itself to the bytecode as DirectWrite ClearType, so nnn, snn and nsn
#     render pixel-identically; nns does not. The presets below therefore
#     differ where it counts: n (natural), q (quantized) or s (strong).
#   * Do not use --reference=Regular. Bold's x-height really is taller than
#     Regular's (559/572 flat/round vs 530/544 units), so Regular's blue zones
#     capture none of Bold's tops: at 12-16px the round letters (o e c s)
#     rise 1px above the flat ones (x n r v). Each weight's own zones keep
#     all letters on one x-height at every size.
#   * The stock, unhinted fonts break visibly at hintfull (gaps inside words,
#     uneven baseline); the hinted ones do not.
#   * No visible effect for MiSans on Linux: gasp (FreeType ignores it),
#     --composites (identical pixels, larger file), --windows-compatibility
#     (Windows clipping only), and --increase-x-height 0 vs 14 (nearly
#     identical). gasp and -W still matter if the fonts are used under Wine.
#   * v40 ignores horizontal hints, so the outlines' advances never change.
#     But at hintfull/hintmedium Chrome turns off subpixel positioning and
#     rounds every advance to a whole pixel (text widths up to ±2% off, uneven
#     gaps in bold). hintslight keeps exact spacing, but then these hints are
#     not used.
#
# FreeType only runs TrueType bytecode at hintstyle hintmedium/hintfull. With
# the common hintslight setting it uses its own light autohinter instead and
# ignores these hints. The package therefore ships (but does not enable)
# /usr/share/fontconfig/conf.avail/80-misans-latin-hinted.conf, which turns on
# full bytecode hinting for this family only. Enable it with:
#
#   sudo ln -s /usr/share/fontconfig/conf.avail/80-misans-latin-hinted.conf \
#              /etc/fonts/conf.d/
#
# ── Build-time options ───────────────────────────────────────────────────────
#
# Run from a terminal, prepare() asks for FIX_WEIGHTS, HINT_PRESET,
# HINT_REFERENCE and GASP_MODE (Enter keeps the default). Any of them already
# set in the environment is not asked. Without a TTY (chroot, CI, piped stdin)
# nothing is asked and the environment variables / defaults below apply.
# The answers are saved to $srcdir/.build_opts for build() and package().
#
#  FIX_WEIGHTS     true/false  Normalise usWeightClass (default: true)
#  HINT_REFERENCE  true/false  Hint every weight against Regular's blue zones
#                              (--reference; default: false; true breaks the
#                              x-height of the heavier weights, see above)
#
#  HINT_PRESET  name         Named bundle of ttfautohint flags (default: hack)
#                            ("Linux" = the stem letter FreeType v40 actually uses)
#               balanced     stem=qsq (Linux: q)  range 8-50   x-height 14  (upstream defaults)
#               sharp        stem=sss (Linux: s)  range 6-50   x-height 14  (max contrast, low-DPI)
#               natural      stem=nnn (Linux: n)  range 8-50   x-height 0   (least distortion)
#               light        stem=nnn (Linux: n)  range 12-50  x-height 0   (HiDPI; <12px left alone)
#               hack         stem=qsq (Linux: q)  range 6-50   x-height 10  fallback latn
#                            (the settings source-foundry's Hack is built with)
#               custom       use the individual HINT_* vars below verbatim
#
#  Individual ttfautohint knobs (override the preset; empty = use preset value):
#  HINT_MODE       nnn|qqq|qsq|sss   3-char --stem-width-mode (grayscale/GDI/DW; n/q/s)
#                        On Linux only the 3rd letter has an effect (see above).
#  HINT_RANGE_MIN  N    --hinting-range-min  (default 8)
#  HINT_RANGE_MAX  N    --hinting-range-max  (default 50)
#  HINT_LIMIT      N    --hinting-limit      (default: same as HINT_RANGE_MAX, so
#                        hinting really stops above the range instead of reusing
#                        the largest hint set up to 200px; 0 = no limit)
#  HINT_XHEIGHT    N    --increase-x-height  (default 14; 0 = disable)
#  HINT_XSNAP_EXC  STR  --x-height-snapping-exceptions  (e.g. "13-17", "" = none)
#  HINT_FALLBACK_SCRIPT  STR  --fallback-script for glyphs outside any script
#                        (symbols, arrows); e.g. latn (default: none)
#  HINT_WINCOMPAT  true/false  --windows-compatibility (Windows/Wine only)
#  HINT_TTFA_TABLE true/false  --ttfa-table: embed a TTFA table recording every
#                        parameter used, readable with `ttfautohint --ttfa-info`
#                        (default: false)
#  HINT_FAMILY_SUFFIX  STR     -F/--family-suffix, e.g. " Hinted" gives the family
#                              "MiSans Latin Hinted" (the fontconfig snippet follows)
#
#  GASP_MODE  keep|sized|smooth|gridfit   (default: keep; Windows/Wine only)
#               keep     leave the gasp table as ttfautohint wrote it ({0xFFFF: 15})
#               sized    MS strategy: <=8 grayscale, 9-16 gridfit, 17+ both
#               smooth   all sizes anti-aliased ({0xFFFF: 15}, symmetric flags)
#               gridfit  all sizes gridfit+grayscale ({0xFFFF: 3})
#
#  Examples:
#    makepkg -si                         (asks, when run from a terminal)
#    makepkg -si </dev/null              (never asks: defaults only)
#    HINT_PRESET=sharp makepkg -si       (asks everything except the preset)
#    HINT_PRESET=custom HINT_MODE=qqs HINT_RANGE_MIN=6 makepkg -si
#    FIX_WEIGHTS=false HINT_FAMILY_SUFFIX=" Hinted" makepkg -si
# ────────────────────────────────────────────────────────────────────────────

_fontdir="MiSans Latin/ttf"
_family="MiSans Latin"

# Every option _resolve_options() understands, and so the only keys
# .build_opts may set.
_opt_keys=(FIX_WEIGHTS HINT_REFERENCE HINT_PRESET HINT_MODE HINT_RANGE_MIN
           HINT_RANGE_MAX HINT_LIMIT HINT_XHEIGHT HINT_XSNAP_EXC
           HINT_FALLBACK_SCRIPT HINT_WINCOMPAT HINT_TTFA_TABLE
           HINT_FAMILY_SUFFIX GASP_MODE)

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
    printf "    %d) %-9s %s%s\n" "$((_i + 1))" "${_items[$_i]%%:*}" "${_items[$_i]#*:}" \
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
    echo "  ttf-misans-latin-hinted: build options (Enter = default)"
    echo ""
    if [[ -z "${FIX_WEIGHTS:-}" ]]; then
      _ask_yn "Normalise weight classes (fontconfig picks the right Regular/Bold)" y
      FIX_WEIGHTS=$_yn
    fi
    if [[ -z "${HINT_PRESET:-}" ]]; then
      _ask_choice "Hinting preset" hack \
        "balanced:stem q, 8-50px, x-height 14 (ttfautohint defaults)" \
        "sharp:stem s, 6-50px, x-height 14 (max contrast, low-DPI)" \
        "natural:stem n, 8-50px, no x-height boost (least distortion)" \
        "light:stem n, 12-50px, no x-height boost (HiDPI)" \
        "hack:stem q, 6-50px, x-height 10, fallback latn (Hack's settings)" \
        "custom:use the HINT_* environment variables"
      HINT_PRESET=$_choice
    fi
    if [[ -z "${HINT_REFERENCE:-}" ]]; then
      echo "  Hinting every weight against Regular's blue zones breaks the x-height"
      echo "  of Bold and Heavy (round letters sit 1px above flat ones)."
      _ask_yn "Use Regular as the blue-zone reference" n
      HINT_REFERENCE=$_yn
    fi
    if [[ -z "${GASP_MODE:-}" ]]; then
      _ask_choice "gasp table (FreeType ignores it; Windows/Wine only)" keep \
        "keep:as ttfautohint writes it" \
        "sized:grayscale <=8px, gridfit 9-16px, both 17px+" \
        "smooth:all sizes anti-aliased" \
        "gridfit:all sizes gridfit + grayscale"
      GASP_MODE=$_choice
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

  FIX_WEIGHTS="${FIX_WEIGHTS:-true}"
  HINT_REFERENCE="${HINT_REFERENCE:-false}"
  HINT_PRESET="${HINT_PRESET:-hack}"

  local _m _lo _hi _xh _fb
  case "$HINT_PRESET" in
    balanced) _m=qsq; _lo=8;  _hi=50; _xh=14; _fb=none ;;
    sharp)    _m=sss; _lo=6;  _hi=50; _xh=14; _fb=none ;;
    natural)  _m=nnn; _lo=8;  _hi=50; _xh=0;  _fb=none ;;
    light)    _m=nnn; _lo=12; _hi=50; _xh=0;  _fb=none ;;
    hack)     _m=qsq; _lo=6;  _hi=50; _xh=10; _fb=latn ;;
    custom)   _m=qsq; _lo=8;  _hi=50; _xh=14; _fb=none ;;
    *)
      echo "Error: unknown HINT_PRESET='$HINT_PRESET'." >&2
      echo "  Valid: balanced sharp natural light hack custom" >&2
      exit 1 ;;
  esac
  # A preset never overrides a value the user set explicitly.
  HINT_MODE="${HINT_MODE:-$_m}"
  HINT_RANGE_MIN="${HINT_RANGE_MIN:-$_lo}"
  HINT_RANGE_MAX="${HINT_RANGE_MAX:-$_hi}"
  HINT_LIMIT="${HINT_LIMIT:-$HINT_RANGE_MAX}"
  HINT_XHEIGHT="${HINT_XHEIGHT:-$_xh}"
  HINT_FALLBACK_SCRIPT="${HINT_FALLBACK_SCRIPT:-$_fb}"
  GASP_MODE="${GASP_MODE:-keep}"
  HINT_WINCOMPAT="${HINT_WINCOMPAT:-false}"
  HINT_TTFA_TABLE="${HINT_TTFA_TABLE:-false}"

  if [[ ! "$HINT_MODE" =~ ^[nqs]{3}$ ]]; then
    echo "Error: HINT_MODE='$HINT_MODE' must be 3 chars from n/q/s (e.g. qsq)." >&2
    exit 1
  fi
  local _v
  for _v in HINT_RANGE_MIN HINT_RANGE_MAX HINT_LIMIT HINT_XHEIGHT; do
    if [[ ! "${!_v}" =~ ^[0-9]+$ ]]; then
      echo "Error: $_v='${!_v}' must be a non-negative integer." >&2; exit 1
    fi
  done
  if (( HINT_RANGE_MIN > HINT_RANGE_MAX )); then
    echo "Error: HINT_RANGE_MIN ($HINT_RANGE_MIN) > HINT_RANGE_MAX ($HINT_RANGE_MAX)." >&2
    exit 1
  fi
  case "$GASP_MODE" in
    keep|sized|smooth|gridfit) ;;
    *) echo "Error: GASP_MODE='$GASP_MODE' invalid (keep|sized|smooth|gridfit)." >&2; exit 1 ;;
  esac
  if [[ ! "$HINT_FALLBACK_SCRIPT" =~ ^[a-z0-9]{3,4}$ ]]; then
    echo "Error: HINT_FALLBACK_SCRIPT='$HINT_FALLBACK_SCRIPT' must be a script tag (e.g. none, latn)." >&2
    exit 1
  fi
  for _v in FIX_WEIGHTS HINT_REFERENCE HINT_WINCOMPAT HINT_TTFA_TABLE; do
    case "${!_v}" in
      true|false) ;;
      *) echo "Error: $_v='${!_v}' must be true or false." >&2; exit 1 ;;
    esac
  done
}

prepare() {
  _prompt_options

  # The checksum already pins the zip; this catches a PKGBUILD whose pkgver was
  # bumped without looking at what Xiaomi actually shipped.
  local _ver
  _ver="$(python -c 'import sys
from fontTools.ttLib import TTFont
print(str(TTFont(sys.argv[1], lazy=True)["name"].getDebugName(5)).split()[-1])' \
    "$srcdir/$_fontdir/MiSansLatin-Regular.ttf")"
  if [[ "$_ver" != "$pkgver" ]]; then
    echo "Error: fonts report version '$_ver' but pkgver is '$pkgver'." >&2
    exit 1
  fi
}

build() {
  _resolve_options

  echo "==> Options: FIX_WEIGHTS=$FIX_WEIGHTS reference=$HINT_REFERENCE preset=$HINT_PRESET" \
       "stem=$HINT_MODE range=$HINT_RANGE_MIN-$HINT_RANGE_MAX limit=$HINT_LIMIT" \
       "x-height=$HINT_XHEIGHT fallback=$HINT_FALLBACK_SCRIPT gasp=$GASP_MODE" \
       "ttfa-table=$HINT_TTFA_TABLE${HINT_FAMILY_SUFFIX:+ suffix='$HINT_FAMILY_SUFFIX'}"

  rm -rf "$srcdir/work" "$srcdir/hinted"
  mkdir -p "$srcdir/work" "$srcdir/hinted"
  cp "$srcdir/$_fontdir/"*.ttf "$srcdir/work/"

  local _count
  _count=$(find "$srcdir/work" -name '*.ttf' | wc -l)
  if (( _count != 10 )); then
    echo "Error: expected 10 static TTF weights, found $_count. Has the zip layout changed?" >&2
    exit 1
  fi

  if [[ "$FIX_WEIGHTS" == true ]]; then
    echo "==> Normalising usWeightClass..."
    python "$srcdir/fix_weights.py" "$srcdir/work/"*.ttf
  fi

  local -a _ta_opts=(
    --hinting-range-min="$HINT_RANGE_MIN"
    --hinting-range-max="$HINT_RANGE_MAX"
    --hinting-limit="$HINT_LIMIT"
    --increase-x-height="$HINT_XHEIGHT"
    --stem-width-mode="$HINT_MODE"
    --fallback-script="$HINT_FALLBACK_SCRIPT"
    --no-info
  )
  # Opt-in: blue zones from the (unhinted, weight-fixed) Regular for every
  # weight. Off by default, see the header. The path is relative
  # (ttfautohint runs inside work/) because a TTFA table records it verbatim.
  if [[ "$HINT_REFERENCE" == true ]]; then
    _ta_opts+=(--reference=MiSansLatin-Regular.ttf)
  fi
  if [[ "$HINT_TTFA_TABLE" == true ]]; then _ta_opts+=(--ttfa-table); fi
  # Honour an explicit empty HINT_XSNAP_EXC (= no exceptions); omit if unset.
  if [[ "${HINT_XSNAP_EXC+set}" == set ]]; then
    _ta_opts+=(--x-height-snapping-exceptions="$HINT_XSNAP_EXC")
  fi
  if [[ "$HINT_WINCOMPAT" == true ]]; then _ta_opts+=(--windows-compatibility); fi
  if [[ -n "${HINT_FAMILY_SUFFIX:-}" ]]; then _ta_opts+=(--family-suffix="$HINT_FAMILY_SUFFIX"); fi

  echo "==> Hinting with ttfautohint..."
  local _f
  cd "$srcdir/work"
  for _f in *.ttf; do
    ttfautohint "${_ta_opts[@]}" "$_f" "$srcdir/hinted/$_f"
  done

  if [[ "$GASP_MODE" != keep ]]; then
    echo "==> Applying gasp mode '$GASP_MODE'..."
    python "$srcdir/set_gasp.py" "$GASP_MODE" "$srcdir/hinted/"*.ttf
  fi
}

package() {
  _resolve_options

  install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" "$srcdir/hinted/"*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE.pdf"

  # Opt-in rendering tweak (see the header): full bytecode hinting for this
  # family only. Shipped in conf.avail and deliberately not enabled.
  install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/fontconfig/conf.avail/80-misans-latin-hinted.conf" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
<!-- Installed by $pkgname. Use the ttfautohint bytecode hints in these
     fonts rather than FreeType's light autohinter. -->
<fontconfig>
  <match target="font">
    <test name="family" compare="eq">
      <string>${_family}${HINT_FAMILY_SUFFIX:-}</string>
    </test>
    <edit name="hinting" mode="assign"><bool>true</bool></edit>
    <edit name="autohint" mode="assign"><bool>false</bool></edit>
    <edit name="hintstyle" mode="assign"><const>hintfull</const></edit>
  </match>
</fontconfig>
EOF
}
