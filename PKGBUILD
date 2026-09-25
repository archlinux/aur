# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-misans-latin-hinted
pkgver=4.007
pkgrel=1
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
#      Cyrillic scripts and builds separate blue zones for each. By default
#      every weight takes its blue zones from Regular (--reference), so bold
#      words sit at the same x-height and cap height as the surrounding text
#   4. optionally rewrites the gasp table (GASP_MODE)
#
# Measured on FreeType 2.14.3 (v40 interpreter, grayscale), rendered through
# pango/cairo at 9-16px:
#
#   * Only the THIRD letter of --stem-width-mode matters on Linux. v40 reports
#     itself to the bytecode as DirectWrite ClearType, so nnn, snn and nsn
#     render pixel-identically; nns does not. The presets below therefore
#     differ where it counts: n (natural), q (quantized) or s (strong).
#   * --reference=Regular: Regular/Bold cap height matched at 8 of 8 sizes
#     (3 of 8 without it) and x-height at 7 of 8 (4 of 8).
#   * The stock, unhinted fonts break visibly at hintfull (gaps inside words,
#     uneven baseline); the hinted ones do not.
#   * No visible effect for MiSans on Linux: gasp (FreeType ignores it),
#     --composites (identical pixels, larger file), --windows-compatibility
#     (Windows clipping only), and --increase-x-height 0 vs 14 (nearly
#     identical). gasp and -W still matter if the fonts are used under Wine.
#   * Advance widths never change: v40 ignores horizontal hints, so spacing is
#     exactly the designer's at every setting.
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
# ── Build-time options (environment variables) ──────────────────────────────
#
#  FIX_WEIGHTS     true/false  Normalise usWeightClass (default: true)
#  HINT_REFERENCE  true/false  Hint every weight against Regular's blue zones
#                              (--reference; default: true)
#
#  HINT_PRESET  name         Named bundle of ttfautohint flags (default: balanced)
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
#    makepkg -si
#    HINT_PRESET=sharp makepkg -si
#    HINT_PRESET=custom HINT_MODE=qqs HINT_RANGE_MIN=6 makepkg -si
#    FIX_WEIGHTS=false HINT_FAMILY_SUFFIX=" Hinted" makepkg -si
# ────────────────────────────────────────────────────────────────────────────

_fontdir="MiSans Latin/ttf"
_family="MiSans Latin"

# Resolve and validate every option from the environment. makepkg runs build()
# and package() in separate shells, so both call this; it is deterministic and
# never prompts.
_resolve_options() {
  FIX_WEIGHTS="${FIX_WEIGHTS:-true}"
  HINT_REFERENCE="${HINT_REFERENCE:-true}"
  HINT_PRESET="${HINT_PRESET:-balanced}"

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
  # Blue zones from the (unhinted, weight-fixed) Regular for every weight, so
  # all ten share x-height and cap-height pixel rounding. The path is relative
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
