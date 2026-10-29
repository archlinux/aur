# Maintainer: gaou-piou <i.am.piou@gmail.com>
# Contributor: GCMarvin <GCMarvin@users.noreply.github.com>

pkgname=ttf-google-sans-hinted
_nfver=3.5.1
pkgver=1.020
pkgrel=1
pkgdesc='Google Sans and Google Sans Display, re-hinted with ttfautohint for FreeType (optionally Nerd Fonts patched)'
url='https://flutter.googlesource.com/gallery-assets'
arch=('any')
license=('LicenseRef-Google-Sans')
makedepends=('python' 'python-fonttools' 'parallel' 'fontforge' 'ttfautohint')
options=(!strip !zipman)
conflicts=('ttf-google-sans')
provides=('ttf-google-sans')

source=(
  'fonts.tar.gz::https://flutter.googlesource.com/gallery-assets/+archive/refs/heads/master/lib/fonts.tar.gz'
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  'set_gasp.py'
  'make_features.py'
)
noextract=("font-patcher-${_nfver}.zip")
# gitiles builds the archive on every request and stamps each entry with the
# download time, so its checksum changes every time - even for a pinned commit.
# The archive is SKIPped here; prepare() checks the fonts themselves instead.
sha256sums=('SKIP'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '0b0464b268525569b5fa28b4735791efb22f22829ad178629776ae3ea82d7f99'
            '200fc13d7cf288ebd10c2832a0c9e1cf5a8b7c7e4e6283311778a2df7057581e')

# sha256 of the upstream TTFs (see the note above sha256sums). When Google
# updates the fonts, prepare() fails here: refresh this list and set pkgver to
# the new name ID 5 version.
_font_sums=(
  '804fdad80c0a5bf7ea7a2396f7368abbcb4d948f31f0ac88b199dc4c18ef3391  GoogleSans-Bold.ttf'
  'c22e02ace4469ff22340fc1c90c10e9414910f3dadf51e91c50445000b843bea  GoogleSans-BoldItalic.ttf'
  '011fbabfe51a86e81401ffa3eb87df74dec15ad38e75b9ade8460f6ca630e657  GoogleSans-Italic.ttf'
  '8e72f9df72eddef9a75aa93b0972c35491bab52d65c32714fe004b75bd7b5271  GoogleSans-Medium.ttf'
  'cefc41078b3da17b5c1aa9ccf8507b911e50b42005f70f18a7128eb47d3285f7  GoogleSans-MediumItalic.ttf'
  'f8914b020e2c78fe86ca14198095455139f08047b8b52ab69003cb5af35cbbc0  GoogleSans-Regular.ttf'
  '842e6578c478336a0ecd49ed7779bb67cd2dfb4188aff9a7e24fd6ed868eac2a  GoogleSansDisplay-Bold.ttf'
  '603682b81c56ddd52af4a22eb5e1f9d82cea836ea5d0016f1611a447b0a39569  GoogleSansDisplay-BoldItalic.ttf'
  '4af7c400d97c640a2e12155734637f65beacc0a4c51853b676e785faae1af417  GoogleSansDisplay-Italic.ttf'
  '40c1436cb0e94370dee18db4f09e3eb8e199713919adb33295536e6c26d9b74d  GoogleSansDisplay-Medium.ttf'
  '2419ca16947c7e974a537f8e887a73d67ec2c8ac7dd1f6fc47b1a22f4d56a68f  GoogleSansDisplay-MediumItalic.ttf'
  'c1b3bd356f209f250345f33413fe659d8f0634fb15bb2b640b2eee24708978fd  GoogleSansDisplay-Regular.ttf'
)

# ── What this package does ──────────────────────────────────────────────────
#
# Takes the static Google Sans and Google Sans Display TTFs (version 1.020;
# Regular, Medium, Bold and their italics) from Flutter's gallery assets and,
# depending on the options below, installs them optionally patched with Nerd
# Fonts glyphs, re-hinted with ttfautohint and with an opt-in fontconfig
# snippet. The procedure is the one ttf-inter-hinted and ttf-geologica-hinted
# use.
#
# Upstream already ships the fonts hinted (fpgm/prep/cvt, head.flags bit 3
# set). Re-hinting replaces those hints with ttfautohint's, whose stem mode the
# presets choose. The presets and the "natural" default come from the
# measurements made on Inter and Geologica (README.md of those packages); they
# have not been re-measured on Google Sans.
#
# FreeType only runs TrueType bytecode at hintstyle hintmedium/hintfull. With
# the common hintslight setting it uses its own light autohinter instead and
# ignores these hints. The package therefore ships (but does not enable)
# /usr/share/fontconfig/conf.avail/80-ttf-google-sans-hinted.conf, which turns
# on bytecode hinting for the installed families only. It uses hintmedium, not
# hintfull: cairo/pango render the two identically, but Blink turns off
# subpixel positioning at hintfull. Chromium and Electron apps are excluded by
# prgname: at device scale 1 Skia uses linear advances only for hintslight/none,
# so at hintmedium every glyph advance is rounded to a whole pixel (uneven
# gaps; nerd-fonts-apple-hinted README.md §10). Enable it with:
#
#   sudo ln -s /usr/share/fontconfig/conf.avail/80-ttf-google-sans-hinted.conf \
#              /etc/fonts/conf.d/
#
# That is not enough for GTK4 (4.16+): with gtk-font-rendering=automatic, the
# default, GTK4 hard-codes hintslight and cairo lets that override fontconfig.
# On GNOME set `gsettings set org.gnome.desktop.interface font-rendering manual`
# and font-hinting to medium, and put gtk-hint-font-metrics=false in
# ~/.config/gtk-4.0/settings.ini (ttf-inter-hinted README.md).
#
# ── Build-time options ───────────────────────────────────────────────────────
#
# Run from a terminal, prepare() asks for WANT_GOOGLE_SANS/
# WANT_GOOGLE_SANS_DISPLAY, NERD_PATCH, FEATURE_DEFAULTS, HINTING and
# HINT_PRESET (Enter keeps the default). Any of them already set in the
# environment is not asked. Without a TTY (chroot, CI, piped stdin) nothing is
# asked and the environment variables / defaults below apply. The answers are
# saved to $srcdir/.build_opts for build() and package().
#
#  WANT_GOOGLE_SANS          true/false  "Google Sans" (default: true)
#  WANT_GOOGLE_SANS_DISPLAY  true/false  "Google Sans Display" (default: true)
#                            At least one must be true.
#
#  NERD_PATCH  true/false  Patch with Nerd Fonts glyphs (default: false).
#                          Family becomes "GoogleSans Nerd Font Propo".
#
#  HINTING     true/false  Re-hint with ttfautohint (default: true). false
#                          installs the fonts as upstream ships them, with
#                          Google's own hints (lost when Nerd-patched).
#
#  HINT_PRESET  name       Named bundle of ttfautohint flags (default: natural)
#                          ("Linux" = the stem letter FreeType v40 actually uses)
#               natural    stem=nnn (Linux: n)  range 8-48   x-height 0   (least distortion
#                                                                       on Inter/Geologica)
#               balanced   stem=qsq (Linux: q)  range 8-48   x-height 14  (ttfautohint defaults)
#               sharp      stem=sss (Linux: s)  range 6-48   x-height 14  (highest contrast,
#                                                                       most distortion)
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
#                        integer") on the hinted fonts (default: false, which
#                        clears it: upstream Google Sans has it set and
#                        ttfautohint keeps the input's flags). On Linux it is
#                        not cosmetic: FreeType then rounds fractional sizes up
#                        to whole pixels (measured +16-19% ink at 8-11 pt on
#                        Geologica), so text is bigger and line breaks shift.
#                        Enable it only to match Windows GDI.
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
#                 that EVERY renderer applies them, not only pango (see the
#                 note below). Asked during the build as well (none / the two
#                 cosmetic ones / a list of your own) - although this font has
#                 almost nothing worth baking. Audit of
#                 GoogleSans-Regular.ttf, shaping every codepoint with each
#                 feature on and off:
#                   case   52 subs, but it is NOT mild: it raises ( ) [ ] { }
#                          to capital height AND turns every digit into a
#                          .cap (cap-height) digit: "100%" -> one.cap
#                          zero.cap zero.cap percent.cap. Not a default.
#                   ss01   one sub: * -> asterisk.num (numeral height)
#                   ss02   one sub: : -> colon.time
#                   tnum   tabular figures plus .tf spaced punctuation; the
#                          font's default figures are proportional
#                   smcp, c2sc  real small caps - never as a default
#                   aalt, dlig, frac, lnum, pnum  change nothing in this build
#                 So: nothing to bake for a better desktop font. The option
#                 is here so that FEATURE_DEFAULTS/tag sets behave the same in
#                 every package of this family, and for the occasional
#                 "ss01 everywhere" experiment.
#
#  FEATURE_FAMILY  "Name"  (default: empty = edit the fonts in place)
#                 Install the result as this family instead, so the stock
#                 Google Sans stays available. Environment-only on purpose: it
#                 renames every file to one family, which would merge Google
#                 Sans and Google Sans Display - select only one of them.
#
#  Why calt: fontconfig's fontfeatures is read by pango/GTK only. Chromium,
#  Electron, Qt, LibreOffice, kitty and Firefox ignore it, and a browser can
#  only ask from page CSS. A shaper applies a fixed list of features whatever
#  the font declares (ccmp locl mark mkmk kern calt liga clig rlig), so
#  moving a feature's lookups into calt is the only way to make it the
#  default in every program. CSS can still say "calt" 0.
#
#  Examples:
#    makepkg -si                              (asks, when run from a terminal)
#    makepkg -si </dev/null                   (never asks: defaults only)
#    HINT_PRESET=balanced makepkg -si         (asks everything else)
#    NERD_PATCH=true HINT_FAMILY_SUFFIX=" Hinted" makepkg -si
#    HINTING=false WANT_GOOGLE_SANS_DISPLAY=false makepkg -si
#    FEATURE_DEFAULTS=ss01 makepkg -si
# ────────────────────────────────────────────────────────────────────────────

# Every option _resolve_options() understands, and so the only keys
# .build_opts may set.
_opt_keys=(WANT_GOOGLE_SANS WANT_GOOGLE_SANS_DISPLAY NERD_PATCH
           FEATURE_DEFAULTS FEATURE_FAMILY
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
    echo "  ttf-google-sans-hinted: build options (Enter = default)"
    echo ""
    if [[ -z "${WANT_GOOGLE_SANS:-}${WANT_GOOGLE_SANS_DISPLAY:-}" ]]; then
      _ask_yn "Include Google Sans" y;          WANT_GOOGLE_SANS=$_yn
      _ask_yn "Include Google Sans Display" y;  WANT_GOOGLE_SANS_DISPLAY=$_yn
    fi
    if [[ -z "${NERD_PATCH:-}" ]]; then
      _ask_yn "Patch with Nerd Fonts glyphs" n;  NERD_PATCH=$_yn
    fi
    if [[ -z "${FEATURE_DEFAULTS+set}" ]]; then
      echo ""
      echo "  ── OpenType features ────────────────────────────────────"
      echo "  A font cannot declare a feature \"on by default\": programs apply a fixed"
      echo "  list (kern calt liga ...) and ignore the rest. Baking moves a feature's"
      echo "  lookups into calt, which every program applies - the only way Chromium,"
      echo "  Electron, Qt and LibreOffice honour one, since they never read"
      echo "  fontconfig's fontfeatures. GTK is covered either way by fonts.conf."
      _ask_choice "Bake features into calt" none \
        "none:leave the fonts as upstream ships them (default)" \
        "cosmetic:ss01,ss02 - asterisk.num and colon.time, the only two that change little" \
        "custom:type the tag list yourself"
      case $_choice in
        none)     FEATURE_DEFAULTS="" ;;
        cosmetic) FEATURE_DEFAULTS="ss01,ss02" ;;
        custom)
          echo "  Tags, comma or space separated (e.g. \"ss01,ss02\"):"
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
        echo "FEATURE_FAMILY to the name for it (e.g. FEATURE_FAMILY=\"Google Sans Alt\") and"
        echo "build again. Without it the packaged files keep their names and the"
        echo "features apply everywhere, with no way back except CSS \"calt\" 0."
      fi
      echo ""
    fi
    if [[ -z "${HINTING:-}" ]]; then
      _ask_yn "Re-hint with ttfautohint (n = keep upstream hints)" y; HINTING=$_yn
    fi
    if [[ "$HINTING" == true && -z "${HINT_PRESET:-}" ]]; then
      _ask_choice "Hinting preset" natural \
        "natural:stem n, 8-48px, no x-height boost (least distortion)" \
        "balanced:stem q, 8-48px (ttfautohint defaults)" \
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

  WANT_GOOGLE_SANS="${WANT_GOOGLE_SANS:-true}"
  WANT_GOOGLE_SANS_DISPLAY="${WANT_GOOGLE_SANS_DISPLAY:-true}"
  NERD_PATCH="${NERD_PATCH:-false}"
  FEATURE_DEFAULTS="${FEATURE_DEFAULTS:-}"
  FEATURE_FAMILY="${FEATURE_FAMILY:-}"
  HINTING="${HINTING:-true}"
  HINT_PRESET="${HINT_PRESET:-natural}"
  GASP_MODE="${GASP_MODE:-keep}"
  HINT_WINCOMPAT="${HINT_WINCOMPAT:-false}"
  HINT_TTFA_TABLE="${HINT_TTFA_TABLE:-false}"
  HINT_INTEGER_PPEM="${HINT_INTEGER_PPEM:-false}"
  HINT_DEFAULT_SCRIPT="${HINT_DEFAULT_SCRIPT:-latn}"
  HINT_FALLBACK_SCRIPT="${HINT_FALLBACK_SCRIPT:-latn}"

  for _v in WANT_GOOGLE_SANS WANT_GOOGLE_SANS_DISPLAY NERD_PATCH HINTING \
            HINT_WINCOMPAT HINT_TTFA_TABLE HINT_INTEGER_PPEM; do
    case "${!_v}" in
      true|false) ;;
      *) echo "Error: $_v='${!_v}' must be true or false." >&2; exit 1 ;;
    esac
  done
  if [[ "$WANT_GOOGLE_SANS" != true && "$WANT_GOOGLE_SANS_DISPLAY" != true ]]; then
    echo "Error: select at least one of WANT_GOOGLE_SANS / WANT_GOOGLE_SANS_DISPLAY." >&2
    exit 1
  fi
  for _v in ${FEATURE_DEFAULTS//,/ }; do
    if [[ ! "$_v" =~ ^[A-Za-z0-9]{4}$ ]]; then
      echo "Error: FEATURE_DEFAULTS: '$_v' is not a feature tag (e.g. ss01)." >&2
      exit 1
    fi
  done
  if [[ -n "$FEATURE_DEFAULTS" && -n "$FEATURE_FAMILY" && \
        "$WANT_GOOGLE_SANS" == true && "$WANT_GOOGLE_SANS_DISPLAY" == true ]]; then
    echo "Error: FEATURE_FAMILY=\"$FEATURE_FAMILY\" would rename Google Sans and Google" >&2
    echo "  Sans Display to the same family. Select only one of them." >&2
    exit 1
  fi

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

# _bake_features SRCDIR: FEATURE_DEFAULTS into calt, last, on the finished
# files, so hinting never sees the extra lookups.
_bake_features() {
  local _src="$1" _fam=()
  [[ -n "$FEATURE_DEFAULTS" ]] || return 0
  [[ -n "$FEATURE_FAMILY" ]] && _fam=(--family "$FEATURE_FAMILY")
  echo "==> Baking $FEATURE_DEFAULTS into calt" \
       "${FEATURE_FAMILY:+(installed as '$FEATURE_FAMILY')}..."
  python "$srcdir/make_features.py" --features "$FEATURE_DEFAULTS" \
    "${_fam[@]+"${_fam[@]}"}" -o "$srcdir/featured" "$_src"/*.ttf
}

prepare() {
  cd "$srcdir"
  printf '%s\n' "${_font_sums[@]}" | sha256sum -c --quiet - || {
    echo "Error: the upstream fonts changed - update _font_sums and pkgver." >&2; exit 1
  }

  _prompt_options
  _resolve_options   # validate now, so a typo fails before the long steps

  rm -rf "$srcdir/font-patcher"
  mkdir -p "$srcdir/font-patcher"
  bsdtar xf "$srcdir/font-patcher-${_nfver}.zip" -C "$srcdir/font-patcher"
}

build() {
  _resolve_options

  echo "==> Options: google-sans=$WANT_GOOGLE_SANS display=$WANT_GOOGLE_SANS_DISPLAY" \
       "nerd=$NERD_PATCH hinting=$HINTING${FEATURE_DEFAULTS:+ features=$FEATURE_DEFAULTS}"
  if [[ "$HINTING" == true ]]; then
    echo "==> ttfautohint: preset=$HINT_PRESET stem=$HINT_MODE" \
         "range=$HINT_RANGE_MIN-$HINT_RANGE_MAX limit=$HINT_LIMIT x-height=$HINT_XHEIGHT" \
         "x-snap-exc='${HINT_XSNAP_EXC-<default>}' gasp=$GASP_MODE integer-ppem=$HINT_INTEGER_PPEM" \
         "ttfa-table=$HINT_TTFA_TABLE${HINT_FAMILY_SUFFIX:+ suffix='$HINT_FAMILY_SUFFIX'}"
  fi

  rm -rf "$srcdir/selected" "$srcdir/patched" "$srcdir/hinted" "$srcdir/featured"
  mkdir -p "$srcdir/selected" "$srcdir/patched" "$srcdir/hinted"

  # ── Step 1: select ──────────────────────────────────────────────────────────
  # fonts.tar.gz holds GoogleSans-*.ttf, GoogleSansDisplay-*.ttf and
  # GalleryIcons.ttf (not a text font, never installed).
  if [[ "$WANT_GOOGLE_SANS" == true ]]; then
    find "$srcdir" -maxdepth 1 -name 'GoogleSans-*.ttf' -exec cp {} "$srcdir/selected/" \;
  fi
  if [[ "$WANT_GOOGLE_SANS_DISPLAY" == true ]]; then
    find "$srcdir" -maxdepth 1 -name 'GoogleSansDisplay-*.ttf' -exec cp {} "$srcdir/selected/" \;
  fi
  local _count
  _count=$(find "$srcdir/selected" -type f | wc -l)
  echo "==> Selected $_count font file(s)."
  if (( _count == 0 )); then
    echo "Error: no fonts matched the selection. Has the archive layout changed?" >&2; exit 1
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

  # Explicit both ways: ttfautohint keeps the input's head.flags, and
  # upstream Google Sans has bit 3 set.
  echo "==> head.flags bit 3 (integer ppem): $HINT_INTEGER_PPEM"
  python - "$HINT_INTEGER_PPEM" "$srcdir/hinted/"*.ttf <<'PY'
import sys
from fontTools.ttLib import TTFont
for path in sys.argv[2:]:
    font = TTFont(path)
    if sys.argv[1] == "true":
        font["head"].flags |= 1 << 3
    else:
        font["head"].flags &= ~(1 << 3)
    font.save(path)
PY

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
  local _fontdir="$pkgdir/usr/share/fonts/google-sans"
  install -Dm644 -t "$_fontdir" "$_out/"*.ttf

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
Google Sans fonts are proprietary fonts owned by Google LLC.
They are distributed as part of Google's Flutter gallery assets.
See https://flutter.googlesource.com/gallery-assets for details.

Nerd Fonts glyphs are licensed under their respective open-source licenses.
See https://github.com/ryanoasis/nerd-fonts for details.
EOF

  # Opt-in rendering tweak (see the header): bytecode hinting for the families
  # this build installed. Shipped in conf.avail and deliberately not enabled.
  # The family list is read from the fonts, so Nerd Fonts names and family
  # suffixes are covered.
  if [[ "$HINTING" == true ]]; then
    local _fam _conf="$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf"
    local _chromium_prgnames=(chrome chromium brave helium electron code slack signal-desktop vesktop)
    local _prg _prgtests=""
    for _prg in "${_chromium_prgnames[@]}"; do
      _prgtests+="    <test qual=\"all\" name=\"prgname\" compare=\"not_eq\"><string>$_prg</string></test>"$'\n'
    done
    install -d "${_conf%/*}"
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
}
