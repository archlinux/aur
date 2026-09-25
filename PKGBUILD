# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-inter-hinted
_interver=4.1
_nfver=3.5.1
pkgver="${_interver}"
pkgrel=1
pkgdesc='Inter, a typeface designed for UI legibility, re-hinted with ttfautohint for FreeType (optionally Nerd Fonts patched)'
arch=('any')
url='https://rsms.me/inter/'
license=('OFL-1.1')
makedepends=('python' 'python-fonttools' 'python-skia-pathops' 'fontforge' 'parallel' 'ttfautohint')
optdepends=('afdko: CFF/OTF hinting via otfautohint (HINT_ENGINE=cff)')
options=(!strip)
provides=('inter-font')
conflicts=('inter-font' 'interui-ttf-hinted')
replaces=('interui-ttf-hinted')
source=(
  "Inter-${_interver}.zip::https://github.com/rsms/inter/releases/download/v${_interver}/Inter-${_interver}.zip"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "LICENSE-${_interver}.txt::https://raw.githubusercontent.com/rsms/inter/v${_interver}/LICENSE.txt"
  "otf2ttf.py"
  "set_gasp.py"
  "cff_hint.py"
  "dedup_blues.py"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '262481e844521b326f5ecd053e59b98c8b2da78c8ee1bdbb6e8174305e54935a'
            '151f00af692183a62146453b709f04240dfe72fdc7a1b98a833f664177eacd21'
            '0b0464b268525569b5fa28b4735791efb22f22829ad178629776ae3ea82d7f99'
            '77dd6b9d0b43f261ef68f46bf8d5b4bb8d142969e2c305e7cd2feb1ccecf61fc'
            '980f8ce4e3e9b3738ee47d30068d9f9d6f69dfae035363e36b769919122bf194')

# ── What this package does ──────────────────────────────────────────────────
#
# Takes Inter from the upstream release zip and, depending on the options
# below, installs the static TTF, static OTF or variable fonts, optionally
# patched with Nerd Fonts glyphs, re-hinted with ttfautohint and with an
# opt-in fontconfig snippet.
#
# rsms already ships the static TTFs hinted (ttfautohint, stem mode qqq). The
# point of re-hinting is the stem mode. Measured on FreeType 2.14.3 (v40
# interpreter, grayscale) with pango/cairo, Inter Regular…ExtraBold plus
# Italic/Bold Italic at 9-20px:
#
#   * Only the THIRD letter of --stem-width-mode matters on Linux: v40 reports
#     itself to the bytecode as DirectWrite ClearType. Upstream's qqq renders
#     like qsq, and qss like sss.
#   * x-height, cap height and baseline agree between flat and round letters in
#     every variant, upstream included, so there is nothing to fix there.
#   * The i/j dots and diaereses (ï ä ö ü ϊ) are what differs. With q or n
#     stems (upstream included) the gap under them closes in 72 of 490
#     weight/size/glyph cases, from SemiBold up at 10-13px. With s stems only 7
#     do. Hence the default preset is "sharp".
#   * --increase-x-height, --x-height-snapping-exceptions, --hinting-limit,
#     gasp and --windows-compatibility made no visible difference.
#   * The variable font ships unhinted. It can be hinted (ttfautohint keeps the
#     fvar/gvar axes, blue zones come from the default master); Inter keeps
#     the same x-height in every weight, so the instances measure as well as
#     the statics.
#
# FreeType only runs TrueType bytecode at hintstyle hintmedium/hintfull. With
# the common hintslight setting it uses its own light autohinter instead and
# ignores these hints. The package therefore ships (but does not enable)
# /usr/share/fontconfig/conf.avail/80-ttf-inter-hinted.conf, which turns on
# bytecode hinting for the installed families only. It uses hintmedium, not
# hintfull: cairo/pango render the two identically, but Chrome turns off
# subpixel positioning (whole-pixel advances, uneven gaps) only at hintfull.
# Enable it with:
#
#   sudo ln -s /usr/share/fontconfig/conf.avail/80-ttf-inter-hinted.conf \
#              /etc/fonts/conf.d/
#
# ── Build-time options ───────────────────────────────────────────────────────
#
# Run from a terminal, prepare() asks for INTER_VARIANT, WANT_INTER/
# WANT_DISPLAY, NERD_PATCH, HINTING, HINT_ENGINE and HINT_PRESET (Enter keeps
# the default). Any of them already set in the environment is not asked.
# Without a TTY (chroot, CI, piped stdin) nothing is asked and the environment
# variables / defaults below apply. The answers are saved to
# $srcdir/.build_opts for build() and package().
#
#  INTER_VARIANT  ttf|otf|variable   Which font set to install (default: ttf)
#                   ttf       static TrueType (extras/ttf)
#                   otf       static OpenType/CFF (extras/otf)
#                   variable  InterVariable.ttf + InterVariable-Italic.ttf
#
#  WANT_INTER     true/false  The "Inter" text cut (default: true)
#  WANT_DISPLAY   true/false  The "Inter Display" optical size (default: false)
#                             At least one must be true; ignored for variable,
#                             whose single file carries both via the opsz axis.
#
#  NERD_PATCH  true/false  Patch with Nerd Fonts glyphs (default: false).
#                          font-patcher cannot keep variable axes, so
#                          INTER_VARIANT=variable switches to ttf when patching.
#
#  HINTING     true/false  Re-hint (default: true). false installs the fonts as
#                          rsms ships them: static TTFs with his qqq ttfautohint
#                          hints, the variable fonts unhinted.
#
#  HINT_ENGINE ttfautohint|cff  (default: ttfautohint). cff keeps OTF outlines
#                          (otfautohint, or FontForge as a fallback) and only
#                          applies to INTER_VARIANT=otf without patching.
#                          ttfautohint converts OTF input to TTF first.
#
#  HINT_PRESET  name       Named bundle of ttfautohint flags (default: sharp)
#                          ("Linux" = the stem letter FreeType v40 actually uses)
#               sharp      stem=sss (Linux: s)  range 6-48   x-height 14  (clear i/j dots)
#               balanced   stem=qsq (Linux: q)  range 8-48   x-height 14  (ttfautohint defaults;
#                                                                       renders like upstream)
#               natural    stem=nnn (Linux: n)  range 8-48   x-height 0   (least distortion)
#               light      stem=nnn (Linux: n)  range 12-48  x-height 0   (HiDPI; <12px left alone)
#               custom     use the individual HINT_* vars below verbatim
#
#  Individual ttfautohint knobs (override the preset; empty = use preset value):
#  HINT_MODE       nnn|qqq|qsq|sss   3-char --stem-width-mode (grayscale/GDI/DW)
#                        On Linux only the 3rd letter has an effect.
#  HINT_RANGE_MIN  N    --hinting-range-min
#  HINT_RANGE_MAX  N    --hinting-range-max
#  HINT_LIMIT      N    --hinting-limit (default: same as HINT_RANGE_MAX, so
#                        hinting really stops above the range; 0 = no limit)
#  HINT_XHEIGHT    N    --increase-x-height (0 = disable)
#  HINT_XSNAP_EXC  STR  --x-height-snapping-exceptions (e.g. "13-17"; unset = none)
#  HINT_DEFAULT_SCRIPT  STR  --default-script (default: latn)
#  HINT_FALLBACK_SCRIPT STR  --fallback-script for glyphs outside any script
#                        (default: latn; Nerd-patched builds always use none
#                        plus --fallback-scaling so icons are not hinted as Latin)
#  HINT_WINCOMPAT  true/false  --windows-compatibility (Windows/Wine only)
#  HINT_TTFA_TABLE true/false  --ttfa-table: embed the parameters used, readable
#                        with `ttfautohint --ttfa-info` (default: false)
#  HINT_FAMILY_SUFFIX  STR     -F/--family-suffix, e.g. " Hinted"
#
#  GASP_MODE  keep|sized|smooth|gridfit  (default: keep; Windows/Wine only,
#             FreeType 2.14 ignores gasp)
#               keep     leave the gasp table as ttfautohint wrote it
#               sized    MS strategy: <=8 grayscale, 9-16 gridfit, 17+ both
#               smooth   all sizes anti-aliased ({0xFFFF: 15})
#               gridfit  all sizes gridfit+grayscale ({0xFFFF: 3})
#
#  Examples:
#    makepkg -si                              (asks, when run from a terminal)
#    makepkg -si </dev/null                   (never asks: defaults only)
#    INTER_VARIANT=variable makepkg -si       (asks everything else)
#    WANT_DISPLAY=true HINT_PRESET=balanced makepkg -si
#    NERD_PATCH=true HINT_FAMILY_SUFFIX=" Hinted" makepkg -si
# ────────────────────────────────────────────────────────────────────────────

# Every option _resolve_options() understands, and so the only keys
# .build_opts may set.
_opt_keys=(INTER_VARIANT WANT_INTER WANT_DISPLAY NERD_PATCH HINTING HINT_ENGINE
           HINT_PRESET HINT_MODE HINT_RANGE_MIN HINT_RANGE_MAX HINT_LIMIT
           HINT_XHEIGHT HINT_XSNAP_EXC HINT_DEFAULT_SCRIPT HINT_FALLBACK_SCRIPT
           HINT_WINCOMPAT HINT_TTFA_TABLE HINT_FAMILY_SUFFIX GASP_MODE)

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
    echo "  ttf-inter-hinted: build options (Enter = default)"
    echo ""
    if [[ -z "${INTER_VARIANT:-}" ]]; then
      _ask_choice "Font set" ttf \
        "ttf:static TrueType" \
        "otf:static OpenType/CFF" \
        "variable:InterVariable (all weights and opsz in one file)"
      INTER_VARIANT=$_choice
    fi
    if [[ "$INTER_VARIANT" != variable && -z "${WANT_INTER:-}${WANT_DISPLAY:-}" ]]; then
      _ask_yn "Include Inter (text cut)" y;      WANT_INTER=$_yn
      _ask_yn "Include Inter Display" n;         WANT_DISPLAY=$_yn
    fi
    if [[ -z "${NERD_PATCH:-}" ]]; then
      _ask_yn "Patch with Nerd Fonts glyphs" n;  NERD_PATCH=$_yn
    fi
    if [[ -z "${HINTING:-}" ]]; then
      _ask_yn "Re-hint with ttfautohint (n = keep upstream hints)" y; HINTING=$_yn
    fi
    if [[ "$HINTING" == true && "$INTER_VARIANT" == otf && "${NERD_PATCH:-false}" != true && \
          -z "${HINT_ENGINE:-}" ]]; then
      _ask_choice "Hinting engine" ttfautohint \
        "ttfautohint:TrueType bytecode, converts OTF to TTF" \
        "cff:PostScript/CFF hints, keeps OTF"
      HINT_ENGINE=$_choice
    fi
    if [[ "$HINTING" == true && "${HINT_ENGINE:-ttfautohint}" == ttfautohint && \
          -z "${HINT_PRESET:-}" ]]; then
      _ask_choice "Hinting preset" sharp \
        "sharp:stem s, 6-48px (measured: keeps i/j dots clear)" \
        "balanced:stem q, 8-48px (ttfautohint defaults, like upstream)" \
        "natural:stem n, 8-48px, no x-height boost (least distortion)" \
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

  INTER_VARIANT="${INTER_VARIANT:-ttf}"
  WANT_INTER="${WANT_INTER:-true}"
  WANT_DISPLAY="${WANT_DISPLAY:-false}"
  NERD_PATCH="${NERD_PATCH:-false}"
  HINTING="${HINTING:-true}"
  HINT_ENGINE="${HINT_ENGINE:-ttfautohint}"
  HINT_PRESET="${HINT_PRESET:-sharp}"
  GASP_MODE="${GASP_MODE:-keep}"
  HINT_WINCOMPAT="${HINT_WINCOMPAT:-false}"
  HINT_TTFA_TABLE="${HINT_TTFA_TABLE:-false}"
  HINT_DEFAULT_SCRIPT="${HINT_DEFAULT_SCRIPT:-latn}"
  HINT_FALLBACK_SCRIPT="${HINT_FALLBACK_SCRIPT:-latn}"

  case "$INTER_VARIANT" in
    ttf|otf|variable) ;;
    *) echo "Error: INTER_VARIANT='$INTER_VARIANT' invalid (ttf|otf|variable)." >&2; exit 1 ;;
  esac
  for _v in WANT_INTER WANT_DISPLAY NERD_PATCH HINTING HINT_WINCOMPAT HINT_TTFA_TABLE; do
    case "${!_v}" in
      true|false) ;;
      *) echo "Error: $_v='${!_v}' must be true or false." >&2; exit 1 ;;
    esac
  done
  # font-patcher drops fvar/gvar, so patching always works on static TTFs.
  if [[ "$NERD_PATCH" == true && "$INTER_VARIANT" == variable ]]; then
    echo "==> Note: variable fonts cannot be Nerd-patched; using INTER_VARIANT=ttf."
    INTER_VARIANT=ttf
  fi
  if [[ "$INTER_VARIANT" != variable && "$WANT_INTER" != true && "$WANT_DISPLAY" != true ]]; then
    echo "Error: select at least one of WANT_INTER / WANT_DISPLAY." >&2; exit 1
  fi
  case "$HINT_ENGINE" in
    ttfautohint|cff) ;;
    *) echo "Error: HINT_ENGINE='$HINT_ENGINE' invalid (ttfautohint|cff)." >&2; exit 1 ;;
  esac
  if [[ "$HINT_ENGINE" == cff && ( "$INTER_VARIANT" != otf || "$NERD_PATCH" == true ) ]]; then
    echo "==> Note: the cff engine needs INTER_VARIANT=otf without patching; using ttfautohint."
    HINT_ENGINE=ttfautohint
  fi

  local _m _lo _hi _xh
  case "$HINT_PRESET" in
    sharp)    _m=sss; _lo=6;  _hi=48; _xh=14 ;;
    balanced) _m=qsq; _lo=8;  _hi=48; _xh=14 ;;
    natural)  _m=nnn; _lo=8;  _hi=48; _xh=0  ;;
    light)    _m=nnn; _lo=12; _hi=48; _xh=0  ;;
    custom)   _m=sss; _lo=6;  _hi=48; _xh=14 ;;
    *)
      echo "Error: unknown HINT_PRESET='$HINT_PRESET'." >&2
      echo "  Valid: sharp balanced natural light custom" >&2
      exit 1 ;;
  esac
  # A preset never overrides a value the user set explicitly.
  HINT_MODE="${HINT_MODE:-$_m}"
  HINT_RANGE_MIN="${HINT_RANGE_MIN:-$_lo}"
  HINT_RANGE_MAX="${HINT_RANGE_MAX:-$_hi}"
  HINT_LIMIT="${HINT_LIMIT:-$HINT_RANGE_MAX}"
  HINT_XHEIGHT="${HINT_XHEIGHT:-$_xh}"

  if [[ ! "$HINT_MODE" =~ ^[nqs]{3}$ ]]; then
    echo "Error: HINT_MODE='$HINT_MODE' must be 3 chars from n/q/s (e.g. sss)." >&2
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
  mkdir -p "$srcdir/font-patcher"
  bsdtar xf "$srcdir/font-patcher-${_nfver}.zip" -C "$srcdir/font-patcher"
}

build() {
  _resolve_options

  echo "==> Options: variant=$INTER_VARIANT inter=$WANT_INTER display=$WANT_DISPLAY" \
       "nerd=$NERD_PATCH hinting=$HINTING engine=$HINT_ENGINE"
  if [[ "$HINTING" == true && "$HINT_ENGINE" == ttfautohint ]]; then
    echo "==> ttfautohint: preset=$HINT_PRESET stem=$HINT_MODE" \
         "range=$HINT_RANGE_MIN-$HINT_RANGE_MAX limit=$HINT_LIMIT x-height=$HINT_XHEIGHT" \
         "x-snap-exc='${HINT_XSNAP_EXC-<default>}' gasp=$GASP_MODE" \
         "ttfa-table=$HINT_TTFA_TABLE${HINT_FAMILY_SUFFIX:+ suffix='$HINT_FAMILY_SUFFIX'}"
  fi

  rm -rf "$srcdir/selected" "$srcdir/converted" "$srcdir/patched" "$srcdir/hinted"
  mkdir -p "$srcdir/selected" "$srcdir/converted" "$srcdir/patched" "$srcdir/hinted"

  # ── Step 1: select ──────────────────────────────────────────────────────────
  # Inter-4.1.zip layout:
  #   InterVariable.ttf, InterVariable-Italic.ttf   (variable)
  #   extras/ttf/{Inter,InterDisplay}-*.ttf          (static TrueType, hinted)
  #   extras/otf/{Inter,InterDisplay}-*.otf          (static OpenType/CFF)
  if [[ "$INTER_VARIANT" == variable ]]; then
    cp "$srcdir"/InterVariable*.ttf "$srcdir/selected/"
  else
    local _ext="$INTER_VARIANT"
    if [[ "$WANT_INTER" == true ]]; then
      find "$srcdir/extras/$_ext" -maxdepth 1 -name "Inter-*.$_ext" -exec cp {} "$srcdir/selected/" \;
    fi
    if [[ "$WANT_DISPLAY" == true ]]; then
      find "$srcdir/extras/$_ext" -maxdepth 1 -name "InterDisplay-*.$_ext" -exec cp {} "$srcdir/selected/" \;
    fi
  fi
  local _count
  _count=$(find "$srcdir/selected" -type f | wc -l)
  echo "==> Selected $_count font file(s)."
  if (( _count == 0 )); then
    echo "Error: no fonts matched the selection. Has the zip layout changed?" >&2; exit 1
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
    _count=$(find "$srcdir/patched" -maxdepth 1 \( -name '*.ttf' -o -name '*.otf' \) | wc -l)
    if (( _count == 0 )); then
      echo "Error: font-patcher produced no output. See messages above." >&2; exit 1
    fi
    echo "==> Patched $_count font(s)."
    _hintsrc="$srcdir/patched"
  fi

  if [[ "$HINTING" != true ]]; then
    return 0
  fi

  # ── Step 3a: CFF hinting (otf, unpatched) ───────────────────────────────────
  if [[ "$HINT_ENGINE" == cff ]]; then
    local _f _out
    if command -v otfautohint >/dev/null 2>&1; then
      echo "==> CFF hinting with otfautohint..."
    else
      echo "==> CFF hinting with FontForge AutoHint (install afdko for otfautohint)..."
    fi
    for _f in "$_hintsrc"/*.otf; do
      _out="$srcdir/hinted/${_f##*/}"
      if command -v otfautohint >/dev/null 2>&1; then
        python "$srcdir/dedup_blues.py" "$_f"
        if ! otfautohint --force-overlap -o "$_out" "$_f" 2>/dev/null; then
          echo "==> WARNING: otfautohint failed on ${_f##*/}; using FontForge AutoHint."
          rm -f "$_out"
          python "$srcdir/cff_hint.py" "$_f" "$_out"
        fi
      else
        python "$srcdir/cff_hint.py" "$_f" "$_out"
      fi
    done
    return 0
  fi

  # ── Step 3b: ttfautohint ────────────────────────────────────────────────────
  # ttfautohint needs TrueType outlines: convert any OTF (the otf variant, or
  # patched OTFs) with cu2qu first.
  if compgen -G "$_hintsrc/*.otf" >/dev/null; then
    echo "==> Converting OTF to TTF for ttfautohint..."
    find "$_hintsrc" -maxdepth 1 -name '*.otf' | sort | \
      parallel --will-cite -j"$(nproc)" \
        python "$srcdir/otf2ttf.py" --post-format 2.0 --max-error 1.0 \
          -o "$srcdir/converted/{/.}.ttf" {}
    find "$_hintsrc" -maxdepth 1 -name '*.ttf' -exec cp {} "$srcdir/converted/" \;
    _hintsrc="$srcdir/converted"
  fi

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
  local _f
  for _f in "$_hintsrc"/*.ttf; do
    ttfautohint "${_ta_opts[@]}" "$_f" "$srcdir/hinted/${_f##*/}"
  done

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
  if ! compgen -G "$_out/*.[ot]tf" >/dev/null; then
    echo "Error: no fonts to install in $_out." >&2; exit 1
  fi
  install -Dm644 -t "$pkgdir/usr/share/fonts/inter" "$_out/"*.[ot]tf
  install -Dm644 "$srcdir/LICENSE-${_interver}.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Opt-in rendering tweak (see the header): bytecode hinting for the families
  # this build installed as ttfautohinted TTFs. Shipped in conf.avail and
  # deliberately not enabled. The family list is read from the fonts, so Nerd
  # Fonts names and family suffixes are covered.
  if [[ "$HINTING" == true && "$HINT_ENGINE" == ttfautohint ]]; then
    local _fam _conf="$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf"
    install -d "${_conf%/*}"
    {
      echo '<?xml version="1.0" encoding="UTF-8"?>'
      echo '<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">'
      echo "<!-- Installed by $pkgname. Use the ttfautohint bytecode hints in these"
      echo "     fonts rather than FreeType's light autohinter. hintmedium, not"
      echo "     hintfull: same rendering in cairo/pango, but Chrome keeps subpixel"
      echo "     positioning at hintmedium. -->"
      echo '<fontconfig>'
      # One <match> per family: several <test>s in one <match> are ANDed.
      while IFS= read -r _fam; do
        _fam="${_fam//&/&amp;}"; _fam="${_fam//</&lt;}"
        cat <<EOF
  <match target="font">
    <test name="family" compare="eq"><string>$_fam</string></test>
    <edit name="hinting" mode="assign"><bool>true</bool></edit>
    <edit name="autohint" mode="assign"><bool>false</bool></edit>
    <edit name="hintstyle" mode="assign"><const>hintmedium</const></edit>
  </match>
EOF
      done < <(python - "$pkgdir/usr/share/fonts/inter/"*.ttf <<'PY' | sort -u
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
}
