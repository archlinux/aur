# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-commissioner-hinted
_commver=1.012
_nfver=3.5.1
pkgver="${_commver}"
pkgrel=2
pkgdesc='Commissioner, a low-contrast humanist sans with Flare/Volume/Weight axes and a separate italic, re-hinted with ttfautohint for FreeType (optionally static / Nerd Fonts patched)'
arch=('any')
url='https://github.com/kosbarts/Commissioner'
license=('OFL-1.1')
makedepends=('python' 'python-fonttools' 'fontforge' 'parallel' 'ttfautohint')
options=(!strip)
provides=('ttf-commissioner')
conflicts=('ttf-commissioner' 'ttf-commissioner-variable' 'otf-commissioner')
source=(
  "Commissioner-Roman.ttf::https://raw.githubusercontent.com/kosbarts/Commissioner/${_commver}/fonts/variable/Commissioner%5BFLAR%2CVOLM%2Cwght%5D.ttf"
  "Commissioner-Italic.ttf::https://raw.githubusercontent.com/kosbarts/Commissioner/${_commver}/fonts/variable/Commissioner-Italic%5BFLAR%2CVOLM%2Cwght%5D.ttf"
  "OFL.txt::https://raw.githubusercontent.com/kosbarts/Commissioner/${_commver}/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "make_statics.py"
  "make_features.py"
  "set_gasp.py"
  "measure.py"
  "79-commissioner-families.conf"
  "README.md"
  "FEATURES.md"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('63ce7044195585bc41476193be7be0312e07ec6685921eb141c6eabfb0aee3b6'
            'f14e729502d1bcb7873830791d1de58c366d403846eb680a4a1e1e293d6953f6'
            '4a7d88c77b4bc39ff84f2e058ba8f015636c50ce33588a86d9da97defe519933'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            'eed086f8bce3b73ef93475f0706e0978c8070a3bddd47a1e1ce74223beffbe27'
            '0723caa5f49782372701905a5acbc577cb7437a87fd30d9b30524a499a505632'
            '0b0464b268525569b5fa28b4735791efb22f22829ad178629776ae3ea82d7f99'
            '373d859f527adcf80933f9741af0595e708f591bdde5f2f01896aebd7d488750'
            'f09f7f4a7dbcc2b18c1bafeae56c5611d995066f0b1cbcfe84bb9890edc66d4f'
            '4ec84fb46a423d54ee31fea446490c066e122aa802d24dfd722b8a0311309835'
            '3f86a8d1100a69364b1035189143950de9c9963b217184048808ae29e88a6129')

# ── What this package does ──────────────────────────────────────────────────
#
# Commissioner (Kostas Bartsokas) is a low-contrast humanist sans in three
# "voices" that are axis settings, not separate designs: the default grotesque,
# Flare (FLAR 100, glyphic serifs on the terminals) and Loud (FLAR 100 +
# VOLM 100, the same serifs as wedges). Verified against the designer's own
# static TTFs by rendering both at 200 px.
#
# The 1.012 release ships TWO variable fonts:
#
#   Commissioner[FLAR,VOLM,wght].ttf           roman,  9 instances, 3 axes
#   Commissioner-Italic[FLAR,VOLM,wght].ttf    italic, 9 instances, 3 axes
#
# The italic file is the roman sheared 12 degrees - measured pixel-identical
# to the third variable font in the repository,
# Commissioner[FLAR,VOLM,slnt,wght].ttf at slnt=-12, in every weight, in
# Latin, Greek and Cyrillic. That 4-axis file is NOT what this package
# installs, for one reason: it is stale. Google Fonts ships it, but it is
# still version 1.001 built with gftools 0.9.23 (1123 glyphs, 983 code points),
# it is not in the 1.012 release archive at all, and it is missing everything
# 1.012 added - tnum (tabular figures, also for + - = < > etc.), ss01 (the
# alternates of G with a bar), the arbitrary-fraction machinery (numr/dnom/
# frac), and the Greek OpenType fixes. The roman+italic pair is 1.012 in both
# files (1172 glyphs, 994 code points). What you lose is a continuous slnt
# axis; pango, Firefox and Chromium all ask for the italic style and get the
# italic file, so nothing in a desktop notices.
#
# Neither upstream file is hinted: no fpgm, no cvt, zero glyph instructions, a
# 7-byte prep. At hintstyle hintmedium FreeType therefore treats the face as
# hinted and runs no autohinter, i.e. GTK (manual mode, font-hinting medium)
# shows Commissioner completely unhinted. That is measurable: hintmedium on
# the unhinted font is identical to FT_LOAD_NO_HINTING, glyph for glyph.
# Upstream's 54 prebuilt statics, by contrast, ARE hinted (name table: "Version
# 1.012; ttfautohint (v1.8.4.16-eb64)") - so the 54-file AUR package
# ttf-commissioner is hinted and the variable font is not.
#
# Measured with FreeType 2.15.0, word "Hamburgefonstiv Αλφάβητο 0123".
# glued = i j ï ä ö ü ë ё ϊ ϋ ΐ ΰ with no pixel row under 25% coverage between
# mark and letter body, 10-20 px, 165 cases per weight, fewer is better.
# dev = summed coverage difference to an 8x supersampled unhinted render, % of
# its ink, best 1/8 px alignment, 12/13/14/16 px, lower is closer to the design:
#
#                            glued 100/400/700/900     dev 100/400/700/900
#   unhinted (hintmedium)      0/  6/ 38/129            4.1/ 2.7/ 1.5/ 1.0
#   hintslight (autohinter)    0/  0/  6/ 34           12.5/11.7/ 8.4/ 7.0
#   bytecode natural (n)       0/  8/  8/ 72           12.1/11.7/ 7.9/ 6.5  <- default
#   bytecode balanced (q)      0/  7/  8/ 72           12.3/11.8/ 7.9/ 6.4
#   bytecode sharp (s)         0/  8/  8/ 70           54.1/12.3/10.5/ 7.2
#   bytecode light (n, 12-48)  0/  8/  8/ 72           12.1/11.7/ 7.9/ 6.5
#   static, hinted per weight  0/  5/  8/129           11.0/11.2/ 8.0/ 6.4
#   upstream's own statics      0/  0/  7/123           11.9/11.9/ 8.8/10.7
#
# Unlike Geologica, whose x-height grows 80 units across the axis and whose
# bytecode therefore snaps every weight to the Thin master's blue zones, this
# family barely moves: x-height 992 (Thin) to 1016 (Black) font units at 2000
# upem, cap height 1426 in every instance, ascender 1478-1500. So the two
# renderers land on the same pixel: the mean vertical shift of x, o and H is
# identical to the hundredth at 13, 14 and 16 px in all nine weights, and
# differs only at 12 px, by 0.4 px. What still differs is the dot metric:
# FreeType's light autohinter keeps the dot of i off the stem where ttfautohint
# cannot, because a one-pixel gap at 10-14 px in Black is below what bytecode
# hinting can express. That is why hintslight - the Arch default, and what the
# README recommends - remains the best single setting, and the bytecode this
# package adds is for the desktops that run hintmedium/hintfull, where the
# unhinted upstream font renders with no hinting at all.
#
# Note also that ttfautohint's --increase-x-height is silently ignored on a
# variable font: -x 0, -x 30 and -x 60 produce byte-identical rendering (still
# 8 glued at wght 400, 72 at 900). It does work on the statics, where it
# changes the Regular from 5 glued to 0 for 0.1 of deviation - see the
# "balanced" preset in the README's static section.
#
# FreeType only runs TrueType bytecode at hintstyle hintmedium/hintfull. This
# package ships (not enabled) /usr/share/fontconfig/conf.avail/80-$pkgname.conf
# which turns bytecode hinting on for the installed families only, and
# excludes Chromium/Electron by prgname (at device scale 1 they round every
# advance at hintmedium). It only affects clients that read hinting from
# fontconfig (Firefox, Chromium, Qt, kitty/foot): GTK3/GTK4 in manual mode take
# the hint style from gsettings and ignore fontconfig's hintstyle. See
# README.md for the recommended desktop settings, which for Commissioner are
# hintslight plus stem darkening (+39% ink on Thin, +23% on ExtraLight, +10%
# on Regular - the light end of this family needs it).
#
# ── Build-time options ───────────────────────────────────────────────────────
#
# Run from a terminal, prepare() asks for COMM_VARIANT, NERD_PATCH, HINTING and
# HINT_PRESET (Enter keeps the default). Any of them already set in the
# environment is not asked. Without a TTY nothing is asked and the
# environment / defaults below apply. Answers are saved to $srcdir/.build_opts.
#
#  COMM_VARIANT  variable|static  (default: variable)
#                 variable  the roman and the italic variable font: every axis
#                           stays usable
#                 static    one TTF per weight (and italic), cut with the
#                           fontTools instancer; each one is hinted on its own,
#                           so its blue zones match that exact weight
#
#  STATIC_WEIGHTS "100 ... 900"  wght values to cut (default: all nine:
#                 100 200 300 400 500 600 700 800 900)
#  STATIC_ITALIC  true/false     also cut the italic, default true
#  STATIC_VOICES  "default flare loud"   voices to cut, default "default":
#                 default  FLAR 0,   VOLM 0    family "Commissioner"
#                 flare    FLAR 100, VOLM 0    family "Commissioner Flare"
#                 loud     FLAR 100, VOLM 100  family "Commissioner Loud"
#                 All three = 54 files, the same set the designer ships, but
#                 hinted per weight instead of all with one set of flags.
#
#  NERD_PATCH  true/false  Patch with Nerd Fonts glyphs (default: false).
#                          font-patcher drops variable axes, so this forces
#                          COMM_VARIANT=static. Family becomes
#                          "Commissioner Nerd Font (Mono|Propo)".
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
#                                                                       defaults; on the
#                                                                       VF the x-height
#                                                                       part is ignored,
#                                                                       on statics it
#                                                                       opens the dots at
#                                                                       weight 400)
#               sharp      stem=sss (Linux: s)  range 6-48   x-height 14  (highest
#                                                                       contrast, distorts
#                                                                       Thin: dev 54.1)
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
#  HINT_XHEIGHT    N    --increase-x-height (0 = disable; no effect on the
#                        variable fonts, see above)
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
#                        the flag does not change the ppem FreeType picks
#                        (measured: 11 px at 8 pt / 96 dpi with the bit clear
#                        and set); it only feeds the hinter's integer
#                        assumption, which moves ink by up to 3.5%. Enable it
#                        to satisfy fontbakery and match Windows GDI.
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
#
#                 This font has little worth baking. The only candidate is
#                     FEATURE_DEFAULTS="ss01"
#                 ss01   the alternate G WITH A BAR (G and its five accented
#                        forms, nothing else). It is a design decision, and it
#                        is the one substitution here that a page cannot ask
#                        for in a comment: with it baked, every program shows
#                        the barred G, including Chromium.
#                 Do not bake ss02: б -> the Serbian form is what locl already
#                 does for text tagged as Serbian, and baking it would give
#                 Russian text the Serbian letter. Not aalt or ordn either
#                 (H2O -> H2º); make_features.py refuses those unless
#                 --allow-risky is passed.
#                 Everything else (case, tnum, frac, sups) is a per-context
#                 request, not a default: baking tnum would tabularise the
#                 figures of running text.
#
#  FEATURE_FAMILY  "Name"  (default: empty = edit the fonts in place)
#                 Install the result as this family instead, so the stock
#                 Commissioner stays available. The name must not end in a
#                 pango style word (Thin, Bold, Italic, ...). With a rename the
#                 shipped 79-commissioner-families.conf no longer matches
#                 (its <test family="Commissioner"> stops applying); the axes
#                 are still there, under the new name.
#
#  Why calt: fontconfig's fontfeatures is read by pango/GTK only. Chromium,
#  Electron, Qt, LibreOffice, kitty and Firefox ignore it, and a browser can
#  only ask from page CSS. A shaper applies a fixed list of features whatever
#  the font declares (ccmp locl mark mkmk kern calt liga clig rlig), so
#  moving a feature's lookups into calt is the only way to make it the
#  default in every program. Verified in Chromium: the baked font with no CSS
#  at all is pixel-identical to the stock one with font-feature-settings
#  listing the same tags. CSS can still say "calt" 0, which also drops the
#  font's own contextual alternates.
#
#  Examples:
#    makepkg -si                              (asks, when run from a terminal)
#    makepkg -si </dev/null                   (never asks: defaults only)
#    COMM_VARIANT=static makepkg -si
#    COMM_VARIANT=static STATIC_VOICES="default flare loud" makepkg -si
#    COMM_VARIANT=static STATIC_ITALIC=false STATIC_VOICES=flare makepkg -si
#    HINT_PRESET=balanced makepkg -si
#    NERD_PATCH=true STATIC_WEIGHTS="400 500 700" makepkg -si
# ────────────────────────────────────────────────────────────────────────────

_opt_keys=(COMM_VARIANT STATIC_WEIGHTS STATIC_ITALIC STATIC_VOICES NERD_PATCH
           HINTING HINT_PRESET HINT_MODE HINT_RANGE_MIN HINT_RANGE_MAX
           HINT_LIMIT HINT_XHEIGHT HINT_XSNAP_EXC HINT_DEFAULT_SCRIPT
           HINT_FALLBACK_SCRIPT HINT_WINCOMPAT HINT_TTFA_TABLE
           HINT_FAMILY_SUFFIX HINT_INTEGER_PPEM GASP_MODE
           FEATURE_DEFAULTS FEATURE_FAMILY)

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
    if [[ "$NERD_PATCH" != true && -z "${COMM_VARIANT:-}" ]]; then
      _ask_choice "Font set" variable \
        "variable:roman + italic font, all axes (recommended)" \
        "static:one file per weight/italic/voice, hinted per weight"
      COMM_VARIANT=$_choice
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
    if [[ -z "${FEATURE_DEFAULTS:-}" ]]; then
      echo "  Baking ss01 makes the alternate G with a bar the default in every"
      echo "  program (Chromium included); fontconfig alone reaches pango only."
      _ask_yn "Bake ss01 (barred G) into the fonts" n
      if [[ "$_yn" == true ]]; then FEATURE_DEFAULTS="ss01"; else FEATURE_DEFAULTS=""; fi
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

  COMM_VARIANT="${COMM_VARIANT:-variable}"
  STATIC_WEIGHTS="${STATIC_WEIGHTS:-100 200 300 400 500 600 700 800 900}"
  STATIC_ITALIC="${STATIC_ITALIC:-true}"
  STATIC_VOICES="${STATIC_VOICES:-default}"
  NERD_PATCH="${NERD_PATCH:-false}"
  HINTING="${HINTING:-true}"
  HINT_PRESET="${HINT_PRESET:-natural}"
  GASP_MODE="${GASP_MODE:-keep}"
  HINT_WINCOMPAT="${HINT_WINCOMPAT:-false}"
  HINT_TTFA_TABLE="${HINT_TTFA_TABLE:-false}"
  HINT_INTEGER_PPEM="${HINT_INTEGER_PPEM:-false}"
  HINT_DEFAULT_SCRIPT="${HINT_DEFAULT_SCRIPT:-latn}"
  HINT_FALLBACK_SCRIPT="${HINT_FALLBACK_SCRIPT:-latn}"
  FEATURE_DEFAULTS="${FEATURE_DEFAULTS:-}"
  FEATURE_FAMILY="${FEATURE_FAMILY:-}"

  case "$COMM_VARIANT" in
    variable|static) ;;
    *) echo "Error: COMM_VARIANT='$COMM_VARIANT' invalid (variable|static)." >&2; exit 1 ;;
  esac
  for _v in STATIC_ITALIC NERD_PATCH HINTING HINT_WINCOMPAT HINT_TTFA_TABLE HINT_INTEGER_PPEM; do
    case "${!_v}" in
      true|false) ;;
      *) echo "Error: $_v='${!_v}' must be true or false." >&2; exit 1 ;;
    esac
  done
  # font-patcher drops fvar/gvar, so patching always works on statics.
  if [[ "$NERD_PATCH" == true && "$COMM_VARIANT" == variable ]]; then
    echo "==> Note: the variable font cannot be Nerd-patched; using COMM_VARIANT=static."
    COMM_VARIANT=static
  fi
  for _v in $STATIC_WEIGHTS; do
    case "$_v" in
      100|200|300|400|500|600|700|800|900) ;;
      *) echo "Error: STATIC_WEIGHTS: '$_v' is not 100, 200, ... 900." >&2; exit 1 ;;
    esac
  done
  local _voice _seen=" "
  for _voice in $STATIC_VOICES; do
    case "$_voice" in
      default|flare|loud) ;;
      *) echo "Error: STATIC_VOICES: '$_voice' is not default, flare or loud." >&2; exit 1 ;;
    esac
    if [[ "$_seen" == *" $_voice "* ]]; then
      echo "Error: STATIC_VOICES: '$_voice' listed twice." >&2; exit 1
    fi
    _seen+="$_voice "
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
  for _v in ${FEATURE_DEFAULTS//,/ }; do
    if [[ ! "$_v" =~ ^[A-Za-z0-9]{4}$ ]]; then
      echo "Error: FEATURE_DEFAULTS: '$_v' is not a feature tag (e.g. ss01)." >&2
      exit 1
    fi
  done
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
# files this build ended up with (hinted, patched or plain), into
# $srcdir/featured. Last step on purpose: ttfautohint never sees the extra
# lookups.
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

  echo "==> Options: variant=$COMM_VARIANT nerd=$NERD_PATCH hinting=$HINTING"
  if [[ "$COMM_VARIANT" == static ]]; then
    echo "==> Statics: weights='$STATIC_WEIGHTS' italic=$STATIC_ITALIC voices='$STATIC_VOICES'"
  fi
  if [[ "$HINTING" == true ]]; then
    echo "==> ttfautohint: preset=$HINT_PRESET stem=$HINT_MODE" \
         "range=$HINT_RANGE_MIN-$HINT_RANGE_MAX limit=$HINT_LIMIT x-height=$HINT_XHEIGHT" \
         "x-snap-exc='${HINT_XSNAP_EXC-<default>}' gasp=$GASP_MODE integer-ppem=$HINT_INTEGER_PPEM" \
         "ttfa-table=$HINT_TTFA_TABLE${HINT_FAMILY_SUFFIX:+ suffix='$HINT_FAMILY_SUFFIX'}"
  fi

  rm -rf "$srcdir/selected" "$srcdir/patched" "$srcdir/hinted"
  mkdir -p "$srcdir/selected" "$srcdir/patched" "$srcdir/hinted"

  # ── Step 1: select ──────────────────────────────────────────────────────────
  if [[ "$COMM_VARIANT" == variable ]]; then
    # A plain filename: brackets in file names upset some tools and globs.
    install -m644 "$srcdir/Commissioner-Roman.ttf" "$srcdir/Commissioner-Italic.ttf" \
      "$srcdir/selected/"
  else
    echo "==> Cutting static instances..."
    local -a _jobs=()
    local _src _w _voice _flar _volm
    for _src in Roman Italic; do
      [[ "$_src" == Italic && "$STATIC_ITALIC" != true ]] && continue
      for _w in $STATIC_WEIGHTS; do
        for _voice in $STATIC_VOICES; do
          case "$_voice" in
            default) _flar=0;   _volm=0   ;;
            flare)   _flar=100; _volm=0   ;;
            loud)    _flar=100; _volm=100 ;;
          esac
          _jobs+=("$_w $_flar $_volm $_src")
        done
      done
    done
    printf '%s\n' "${_jobs[@]}" | parallel --will-cite -j"$(nproc)" --colsep ' ' \
      python "$srcdir/make_statics.py" --wght {1} --flar {2} --volm {3} \
        -o "$srcdir/selected" "$srcdir/Commissioner-{4}.ttf"
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
  # On a variable font ttfautohint keeps fvar/gvar/STAT/MVAR and every named
  # instance, but its blue zones come from the default master (Thin) and its
  # --increase-x-height is ignored. On a static it hints that exact instance.
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
  local _fontdir="$pkgdir/usr/share/fonts/commissioner"
  install -Dm644 -t "$_fontdir" "$_out/"*.ttf
  install -Dm644 "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"

  local _avail="$pkgdir/usr/share/fontconfig/conf.avail"
  install -d "$_avail"

  # Family names for the FLAR/VOLM voices. Variable build only: the statics
  # have no axes, and with STATIC_VOICES="default flare loud" they are already
  # "Commissioner", "Commissioner Flare" and "Commissioner Loud".
  if [[ "$COMM_VARIANT" == variable ]]; then
    install -Dm644 -t "$_avail" "$srcdir/79-commissioner-families.conf"
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
      echo "     Commissioner does not need this file as badly as Geologica does:"
      echo "     its x-height barely moves with the weight, so the bytecode and the"
      echo "     autohinter snap to the same pixel at 13-16 px. What the bytecode"
      echo "     cannot do is keep the dot of i off the stem at 10-14 px in Bold and"
      echo "     Black (72 glued cases at wght 900 against the autohinter's 34), and"
      echo "     that is the argument for staying on hintstyle hintslight. See"
      echo "     README.md section 2. -->"
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
