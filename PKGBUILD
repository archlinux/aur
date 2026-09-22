# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=nerd-fonts-apple-hinted
_nfver=3.5.1
# pkgver is derived at build time by pkgver() below: the highest font version
# found inside the selected Apple fonts, plus the Nerd Fonts patcher version
# (e.g. 22.0.5.4+nf3.5.1). The literal here is only a placeholder for the first
# run and for tooling that parses the PKGBUILD without executing it.
pkgver=22.0.5.4+nf3.5.1
pkgrel=1
pkgdesc="Apple fonts (SF Pro, SF Compact, SF Mono, SF Arabic, NY), optionally Nerd Fonts patched and/or autohinted (ttfautohint / CFF) with gasp tuning"
arch=(any)
url="https://developer.apple.com/fonts/"
license=("custom")
makedepends=("p7zip" "python" "python-fonttools" "python-skia-pathops" "parallel" "fontforge" "ttfautohint" "libarchive")
optdepends=("afdko: better CFF/OTF hinting via otfautohint (HINT_ENGINE=cff)")
options=(!strip !zipman)
conflicts=("nerd-fonts-apple" "apple-fonts" "nerd-fonts-sf-mono")
provides=("nerd-fonts-apple" "ttf-font-nerd")
source=(
  "SF-Pro.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg"
  "SF-Compact.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg"
  "SF-Mono.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg"
  "SF-Arabic.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Arabic.dmg"
  "NY.dmg::https://devimages-cdn.apple.com/design/resources/download/NY.dmg"
  "font-patcher-${_nfver}::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "otf2ttf.py"
  "set_gasp.py"
  "cff_hint.py"
  "dedup_blues.py"
  "font_meta.py"
)
# Apple re-spins the DMGs without versioning, so those legitimately stay SKIP —
# the real identity check is pkgver(), which reads the version out of the font
# files themselves. FontPatcher is a tagged GitHub release — pin it once you have
# a known-good hash (replace the 6th SKIP). The *.py helpers are vendored locally
# (no network fetch), so they are covered by makepkg's local-file hashing —
# fill these in with `updpkgsums`.
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

# ── Versioning ──────────────────────────────────────────────────────────────
#
# pkgver() composes the version from the fonts themselves plus the patcher:
#
#     <highest Apple font version>+nf<nerd fonts version>    e.g. 22.0.5.4+nf3.5.1
#
# The Apple part is read out of the OpenType `name` table (nameID 5, e.g.
# "Version 22.0d5e4" → 22.0.5.4) of the *selected* families, taking the highest.
# Apple versions each family independently (SF Pro 22.0d5e4, SF Mono 18.0d1e1,
# New York 16.0d2e2), so taking the max keeps pkgver monotonic: any family Apple
# bumps raises the package version, while a re-spin that changes nothing leaves
# it untouched. Note that pkgver therefore depends on which families you select.
#
# ── Build-time options (all settable via env vars) ──────────────────────────
#
#  NERD_PATCH  true/false   Patch fonts with Nerd Fonts glyphs (default: false)
#                           false → install fonts as-is (static OTF or variable TTF)
#
#  WANT_VARIABLE  true/false  Include variable TTF fonts when NERD_PATCH=false.
#                             (Variable fonts are excluded when patching — font-patcher
#                             destroys fvar/gvar axes during generation.)
#                             Ignored when NERD_PATCH=true.
#
#  HINTING   true/false      Apply autohinting (default: true)
#                            When NERD_PATCH=true:  hints the patched TTF output.
#                            When NERD_PATCH=false + ttfautohint engine: converts
#                              static OTF→TTF first, then hints. Variable TTFs are
#                              hinted directly (axes are flattened to a static TTF).
#                            When NERD_PATCH=false + cff engine: hints OTFs in place,
#                              output stays OTF (no TTF conversion).
#
#  HINT_ENGINE  ttfautohint|cff   Hinting backend (default: ttfautohint)
#                            ttfautohint: TrueType bytecode hints (best for screen/
#                              terminal/Latin; requires TTF, converts OTF→TTF).
#                            cff: PostScript/CFF hints, OTF output preserved. Uses
#                              otfautohint (afdko) if present, else falls back
#                              to FontForge AutoHint. Forced to ttfautohint when
#                              NERD_PATCH=true (patched fonts are always TTF).
#
#  ── ttfautohint tuning ──
#  HINT_PRESET  name         Named bundle of ttfautohint flags (default: balanced)
#               balanced     stem=qsq  range 8-50  x-height 14            (upstream defaults)
#               terminal     stem=qss  range 6-50  x-height 10  +gasp     (Hack-style, small mono)
#               ui           stem=qsq  range 8-60  x-height 14  +gasp     (proportional screen text)
#               print        stem=nnn  range 8-50  x-height 0             (natural stems, no x-snap)
#               light        stem=nnn  range 12-50 x-height 0             (HiDPI, minimal interference)
#               strong       stem=sss  range 6-50  x-height 14  +gasp     (aggressive low-DPI)
#               custom       use the individual HINT_* vars below verbatim
#
#  Individual ttfautohint knobs (override the preset; empty = use preset value):
#  HINT_MODE     nnn|qqq|qsq|sss   3-char --stem-width-mode (grayscale/GDI/DW; n/q/s)
#  HINT_RANGE_MIN  N    --hinting-range-min  (default 8)
#  HINT_RANGE_MAX  N    --hinting-range-max  (default 50)
#  HINT_LIMIT      N    --hinting-limit      (default 200; 0 = no limit)
#  HINT_XHEIGHT    N    --increase-x-height  (default 14; 0 = disable x-height snapping bump)
#  HINT_XSNAP_EXC  STR  --x-height-snapping-exceptions  (e.g. "13-17", "" = none)
#  HINT_WINCOMPAT  true/false  --windows-compatibility (artificial blue zones)
#  HINT_TTFA_TABLE true/false  -t/--ttfa-table (embed a TTFA table with all params)
#  HINT_FAMILY_SUFFIX  STR     -F/--family-suffix (distinguish differently-hinted builds)
#  (PUA/Nerd icon glyphs are always handled with --fallback-script=none --fallback-scaling.)
#
#  ── gasp grid-fitting / anti-aliasing tuning (TTF output only) ──
#  GASP_MODE  keep|sized|smooth|gridfit   (default: keep)
#               keep     leave the gasp table as ttfautohint/font-patcher wrote it
#               sized    MS strategy: <=8 grayscale, 9-16 gridfit, 17+ both
#               smooth   all sizes anti-aliased ({0xFFFF:15}; gftools style)
#               gridfit  all sizes gridfit+grayscale ({0xFFFF:3})
#             Some presets enable a sensible GASP_MODE automatically (see above);
#             an explicit GASP_MODE always wins.
#
#  Font family selection:
#  WANT_SF_PRO      true/false   (default: true)
#  WANT_SF_COMPACT  true/false   (default: false)
#  WANT_SF_MONO     true/false   (default: true)
#  WANT_SF_ARABIC   true/false   (default: false)
#  WANT_NY          true/false   (default: true)
#
#  Subfamily selection (space-separated, empty = all):
#  SF_PRO_SUBS      e.g. "Display Text Rounded"
#  SF_COMPACT_SUBS  e.g. "Display Text Rounded"
#  NY_SUBS          e.g. "Small Medium Large ExtraLarge"
#
#  Non-interactive examples:
#    HINTING=true HINT_PRESET=terminal WANT_SF_MONO=true WANT_SF_PRO=false makepkg -si
#    NERD_PATCH=false HINTING=true HINT_ENGINE=cff makepkg -si
#    HINTING=true HINT_PRESET=custom HINT_MODE=qss HINT_RANGE_MIN=6 GASP_MODE=sized makepkg -si
# ────────────────────────────────────────────────────────────────────────────

_validate_hint_mode() {
  if [[ ! "$HINT_MODE" =~ ^[nqs]{3}$ ]]; then
    echo "Error: HINT_MODE='$HINT_MODE' is invalid."
    echo "  Must be 3 chars from: n (natural)  q (quantized)  s (strong)"
    echo "  Examples: nnn  qqq  qsq  sss"
    exit 1
  fi
}

# Map a named preset into the individual HINT_* / GASP_MODE vars.
# Individual vars already set in the environment are preserved (preset never
# overrides an explicit user value).
_apply_preset() {
  local _p="$1"
  local _m _lo _hi _lim _xh _gasp
  case "$_p" in
    balanced) _m=qsq; _lo=8;  _hi=50; _lim=200; _xh=14; _gasp=keep ;;
    terminal) _m=qss; _lo=6;  _hi=50; _lim=200; _xh=10; _gasp=sized ;;
    ui)       _m=qsq; _lo=8;  _hi=60; _lim=200; _xh=14; _gasp=sized ;;
    print)    _m=nnn; _lo=8;  _hi=50; _lim=200; _xh=0;  _gasp=keep ;;
    light)    _m=nnn; _lo=12; _hi=50; _lim=200; _xh=0;  _gasp=keep ;;
    strong)   _m=sss; _lo=6;  _hi=50; _lim=200; _xh=14; _gasp=smooth ;;
    custom)   _m=qsq; _lo=8;  _hi=50; _lim=200; _xh=14; _gasp=keep ;;
    *)
      echo "Error: unknown HINT_PRESET='$_p'."
      echo "  Valid: balanced terminal ui print light strong custom"
      exit 1 ;;
  esac
  HINT_MODE="${HINT_MODE:-$_m}"
  HINT_RANGE_MIN="${HINT_RANGE_MIN:-$_lo}"
  HINT_RANGE_MAX="${HINT_RANGE_MAX:-$_hi}"
  HINT_LIMIT="${HINT_LIMIT:-$_lim}"
  HINT_XHEIGHT="${HINT_XHEIGHT:-$_xh}"
  GASP_MODE="${GASP_MODE:-$_gasp}"
}

# ── DMG extraction ──────────────────────────────────────────────────────────
# Apple ships two different DMG layouts and re-spins the images without bumping
# any version, so both must be handled (verified by 7z l):
#
#   "folder" layout (SF-Mono, SF-Arabic, NY — and SF-Pro/SF-Compact before
#   Sept 2026): the DMG holds a <Family>Fonts/ directory containing a
#   "<Family> Fonts.pkg" metapackage plus a <Family>Fonts.pkg/Payload:
#     NY.dmg → NYFonts/ "NY Fonts.pkg" → NYFonts.pkg/Payload
#
#   "flat" layout (SF-Pro, SF-Compact as of Sept 2026): the DMG holds a single
#   <Family>Fonts.pkg *file* at the root, itself an xar archive whose inner
#   component package carries the payload:
#     SF-Pro.dmg → SFProFonts.pkg → SFProFontsPackage.pkg/Payload
#
# Rather than hard-coding either shape, we extract the DMG and then locate the
# Payload(s) by search, which should survive the next re-spin too. Extraction
# happens in prepare() so that pkgver() can read the fonts' own version strings.
_extract_dmg() {
  local _archive="$1" _dest="$2"
  local _stem _work _pass _pkg _payload _found=0
  _stem="$(basename "$_archive" .dmg)"
  _work="$srcdir/dmg/$_stem"

  rm -rf "$_work"; mkdir -p "$_work" "$_dest"
  (
    set -e
    cd "$_work"
    7z x "$_archive" >/dev/null

    # Unwrap every xar/pkg we can find, repeatedly: the "folder" layout nests a
    # metapackage one level deep, the "flat" layout wraps the component package
    # in an outer one. Three passes cover both with room to spare; each pass only
    # touches .pkg entries that are regular files (the *.pkg/ payload directories
    # are left alone).
    for _pass in 1 2 3; do
      while IFS= read -r -d '' _pkg; do
        # No -P: do not preserve absolute paths from Apple's installer payload.
        bsdtar xf "$_pkg" -C "$(dirname "$_pkg")" 2>/dev/null || true
        rm -f "$_pkg"
      done < <(find . -type f -name '*.pkg' ! -name '._*' -print0)
    done

    # Payload is a gzip'd cpio; there may be more than one (e.g. a family whose
    # installer splits Display/Text into separate component packages).
    while IFS= read -r -d '' _payload; do
      bsdtar xf "$_payload" -C "$(dirname "$_payload")" 2>/dev/null || continue
      _found=1
    done < <(find . -type f -name 'Payload' ! -path '*/._*' -print0)

    if (( _found == 0 )); then
      echo "Error: no installer Payload found in $(basename "$_archive")." >&2
      echo "       Apple may have changed the DMG layout again. Inspect with:" >&2
      echo "         7z l '$_archive'" >&2
      exit 1
    fi

    find . \( -iname '*.ttf' -o -iname '*.otf' -o -iname '*.ttc' \) \
      ! -path '*/._*' ! -name '._*' -exec cp -n {} "$_dest/" \;
  ) || return 1

  rm -rf "$_work"
  return 0
}

# Extract every selected DMG into $srcdir/extracted. Used by prepare(); build()
# reuses the result rather than extracting twice.
_extract_selected() {
  local _archive _stem _before _after
  mkdir -p "$srcdir/extracted" "$srcdir/dmg"

  declare -A _dmg_want=(
    [SF-Pro]="$WANT_SF_PRO"
    [SF-Compact]="$WANT_SF_COMPACT"
    [SF-Mono]="$WANT_SF_MONO"
    [SF-Arabic]="$WANT_SF_ARABIC"
    [NY]="$WANT_NY"
  )

  for _archive in "$srcdir"/*.dmg; do
    _stem="$(basename "$_archive" .dmg)"
    if [[ "${_dmg_want[$_stem]:-false}" != true ]]; then
      echo "==> Skipping: $(basename "$_archive") (not selected)"
      continue
    fi
    echo "==> Extracting: $(basename "$_archive")"
    _before=$(find "$srcdir/extracted" -type f | wc -l)
    _extract_dmg "$_archive" "$srcdir/extracted" \
      || { echo "Error: extraction failed for $_stem."; exit 1; }
    # Fail loud per family rather than letting an empty extraction surface much
    # later as a confusing "no fonts matched the selection".
    _after=$(find "$srcdir/extracted" -type f | wc -l)
    if (( _after == _before )); then
      echo "Error: $_stem extracted no font files."; exit 1
    fi
    echo "    -> $(( _after - _before )) font file(s)"
  done
  rm -rf "$srcdir/dmg"
}

_show()    { printf "  [%s] %s\n" "$1" "$2"; }
_ask_yn()  { local _default="${2:-n}"; read -p "  $1? (default: $_default) " _yn; _yn="${_yn:-$_default}"; }
_ask_multi() {
  local _label="$1"; shift; local _opts=("$@"); local _n=${#_opts[@]}
  echo "    Subfamilies (space-separated numbers, or Enter/a for all):"
  for (( i=0; i<_n; i++ )); do printf "      %d) %s\n" "$((i+1))" "${_opts[$i]}"; done
  read -p "    > " _raw; _sel=""
  if [[ "$_raw" =~ ^[aA]$ || -z "$_raw" ]]; then
    _sel="${_opts[*]}"
  else
    for _tok in $_raw; do
      local _idx=$(( _tok - 1 ))
      (( _idx >= 0 && _idx < _n )) && _sel="$_sel ${_opts[$_idx]}"
    done
    _sel="${_sel# }"
  fi
}

# Resolve every build option: prompt when interactive, otherwise fall back to
# environment variables and defaults. Called from prepare() (so the answers are
# known before pkgver() needs them) and re-read from disk by build().
_resolve_options() {
  # ══════════════════════════════════════════════════════════════════════════
  # Interactivity guard: only prompt when connected to a terminal. In a clean
  # chroot / CI / --noconfirm build stdin is not a TTY; prompting there would
  # read EOF and silently fall through, so we go straight to env vars/defaults.
  # ══════════════════════════════════════════════════════════════════════════
  local _interactive=false
  if [[ -t 0 ]]; then _interactive=true; fi

  if [[ "$_interactive" == true ]]; then
    echo ""
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║       nerd-fonts-apple-hinted — build options        ║"
    echo "╚══════════════════════════════════════════════════════╝"
  else
    echo "==> Non-interactive build (no TTY): using environment variables / defaults."
  fi

  # ── Nerd Fonts patching ──────────────────────────────────────────────────
  if [[ "$_interactive" == true && -z "${NERD_PATCH:-}" ]]; then
    _ask_yn "Patch fonts with Nerd Fonts glyphs" n
    [[ "$_yn" =~ ^[yY]$ ]] && NERD_PATCH=true || NERD_PATCH=false
  fi
  NERD_PATCH="${NERD_PATCH:-false}"

  # ── Variable fonts (only relevant when not patching) ─────────────────────
  if [[ "$_interactive" == true && "$NERD_PATCH" == false && -z "${WANT_VARIABLE:-}" ]]; then
    echo ""
    echo "  Variable fonts (SF Pro, SF Compact, New York) contain all weights"
    echo "  in a single file with fvar/gvar axes. They are excluded when"
    echo "  patching because font-patcher destroys variable axes."
    _ask_yn "Include variable TTF fonts" n
    [[ "$_yn" =~ ^[yY]$ ]] && WANT_VARIABLE=true || WANT_VARIABLE=false
  fi
  # Variable fonts are never compatible with Nerd Fonts patching
  if [[ "$NERD_PATCH" == true ]]; then WANT_VARIABLE=false; fi
  WANT_VARIABLE="${WANT_VARIABLE:-false}"

  # ── Hinting ──────────────────────────────────────────────────────────────
  if [[ "$_interactive" == true && -z "${HINTING:-}" ]]; then
    echo ""
    if [[ "$NERD_PATCH" == false ]]; then
      echo "  Note: ttfautohint engine hints TrueType, so static OTFs are"
      echo "        converted OTF→TTF first; variable TTFs are flattened to static."
      echo "        The 'cff' engine hints OTFs in place and keeps them as OTF."
    fi
    _ask_yn "Apply autohinting" y
    [[ "$_yn" =~ ^[yY]$ ]] && HINTING=true || HINTING=false
  fi
  HINTING="${HINTING:-true}"

  # ── Hinting engine ─────────────────────────────────────────────────────────
  if [[ "$HINTING" == true && "$NERD_PATCH" == false && "$_interactive" == true && -z "${HINT_ENGINE:-}" ]]; then
    echo ""
    echo "  Hinting engine:"
    PS3="  > "
    select _choice in "ttfautohint (TrueType bytecode, converts OTF→TTF)" \
                      "cff (PostScript/CFF hints, keeps OTF)"; do
      case "$REPLY" in
        1) HINT_ENGINE=ttfautohint; break ;;
        2) HINT_ENGINE=cff; break ;;
        *) echo "  Please enter 1 or 2." ;;
      esac
      [[ -z "$REPLY" ]] && { echo "  No selection; defaulting to ttfautohint."; HINT_ENGINE=ttfautohint; break; }
    done
  fi
  HINT_ENGINE="${HINT_ENGINE:-ttfautohint}"
  # Patched fonts are always TTF → ttfautohint only.
  if [[ "$NERD_PATCH" == true ]]; then HINT_ENGINE=ttfautohint; fi
  if [[ "$HINT_ENGINE" != ttfautohint && "$HINT_ENGINE" != cff ]]; then
    echo "Error: HINT_ENGINE='$HINT_ENGINE' invalid (use 'ttfautohint' or 'cff')."; exit 1
  fi

  # ── Hinting preset (ttfautohint only) ──────────────────────────────────────
  if [[ "$HINTING" == true && "$HINT_ENGINE" == ttfautohint ]]; then
    if [[ "$_interactive" == true && -z "${HINT_PRESET:-}" && -z "${HINT_MODE:-}" ]]; then
      echo ""
      echo "  Hinting preset:"
      PS3="  > "
      select _choice in "balanced (upstream defaults, qsq 8-50 x14)" \
                        "terminal (mono/small, qss 6-50 x10 +gasp)" \
                        "ui (proportional screen, qsq 8-60 x14 +gasp)" \
                        "print (natural stems, nnn, no x-snap)" \
                        "light (HiDPI minimal, nnn 12-50)" \
                        "strong (aggressive low-DPI, sss +smooth gasp)" \
                        "custom (set HINT_* vars yourself)"; do
        case "$REPLY" in
          1) HINT_PRESET=balanced; break ;;
          2) HINT_PRESET=terminal; break ;;
          3) HINT_PRESET=ui;       break ;;
          4) HINT_PRESET=print;    break ;;
          5) HINT_PRESET=light;    break ;;
          6) HINT_PRESET=strong;   break ;;
          7) HINT_PRESET=custom;   break ;;
          *) echo "  Please enter 1-7." ;;
        esac
        [[ -z "$REPLY" ]] && { echo "  No selection; defaulting to balanced."; HINT_PRESET=balanced; break; }
      done
    fi
    HINT_PRESET="${HINT_PRESET:-balanced}"
    _apply_preset "$HINT_PRESET"
    _validate_hint_mode

    # Validate numeric knobs.
    for _v in HINT_RANGE_MIN HINT_RANGE_MAX HINT_LIMIT HINT_XHEIGHT; do
      if [[ ! "${!_v}" =~ ^[0-9]+$ ]]; then
        echo "Error: $_v='${!_v}' must be a non-negative integer."; exit 1
      fi
    done
    if (( HINT_RANGE_MIN > HINT_RANGE_MAX )); then
      echo "Error: HINT_RANGE_MIN ($HINT_RANGE_MIN) > HINT_RANGE_MAX ($HINT_RANGE_MAX)."; exit 1
    fi
  fi

  # gasp default + validation (used by both engines, but only meaningful for TTF)
  GASP_MODE="${GASP_MODE:-keep}"
  case "$GASP_MODE" in
    keep|sized|smooth|gridfit) ;;
    *) echo "Error: GASP_MODE='$GASP_MODE' invalid (keep|sized|smooth|gridfit)."; exit 1 ;;
  esac

  HINT_WINCOMPAT="${HINT_WINCOMPAT:-false}"
  HINT_TTFA_TABLE="${HINT_TTFA_TABLE:-false}"

  # ── Font family & subfamily selection ────────────────────────────────────
  if [[ "$_interactive" == true && \
        -z "${WANT_SF_PRO:-}${WANT_SF_COMPACT:-}${WANT_SF_MONO:-}${WANT_SF_ARABIC:-}${WANT_NY:-}" ]]; then
    echo ""
    echo "  ── Font families ────────────────────────────────────────"

    _ask_yn "Include SF Pro" y
    if [[ "$_yn" =~ ^[yY]$ ]]; then
      WANT_SF_PRO=true
      if [[ -z "${SF_PRO_SUBS:-}" ]]; then
        echo "  SF Pro subfamilies:"
        _ask_multi "SF Pro" "Display" "Text" "Rounded"
        SF_PRO_SUBS="$_sel"
      fi
    else
      WANT_SF_PRO=false
    fi

    _ask_yn "Include SF Compact" n
    if [[ "$_yn" =~ ^[yY]$ ]]; then
      WANT_SF_COMPACT=true
      if [[ -z "${SF_COMPACT_SUBS:-}" ]]; then
        echo "  SF Compact subfamilies:"
        _ask_multi "SF Compact" "Display" "Text" "Rounded"
        SF_COMPACT_SUBS="$_sel"
      fi
    else
      WANT_SF_COMPACT=false
    fi

    _ask_yn "Include SF Mono" y
    [[ "$_yn" =~ ^[yY]$ ]] && WANT_SF_MONO=true || WANT_SF_MONO=false

    _ask_yn "Include SF Arabic" n
    [[ "$_yn" =~ ^[yY]$ ]] && WANT_SF_ARABIC=true || WANT_SF_ARABIC=false

    _ask_yn "Include New York" y
    if [[ "$_yn" =~ ^[yY]$ ]]; then
      WANT_NY=true
      if [[ -z "${NY_SUBS:-}" ]]; then
        echo "  New York subfamilies:"
        _ask_multi "New York" "Small" "Medium" "Large" "ExtraLarge"
        NY_SUBS="$_sel"
      fi
    else
      WANT_NY=false
    fi
  fi

  WANT_SF_PRO="${WANT_SF_PRO:-true}"
  WANT_SF_COMPACT="${WANT_SF_COMPACT:-false}"
  WANT_SF_MONO="${WANT_SF_MONO:-true}"
  WANT_SF_ARABIC="${WANT_SF_ARABIC:-false}"
  WANT_NY="${WANT_NY:-true}"

  if [[ "$WANT_SF_PRO$WANT_SF_COMPACT$WANT_SF_MONO$WANT_SF_ARABIC$WANT_NY" != *true* ]]; then
    echo "Error: no font families selected. Aborting."; exit 1
  fi

  # ── Build summary ─────────────────────────────────────────────────────────
  echo ""
  echo "  ── Build summary ───────────────────────────────────────"
  printf "  NERD_PATCH:    %s\n" "$NERD_PATCH"
  printf "  WANT_VARIABLE: %s\n" "$WANT_VARIABLE"
  if [[ "$HINTING" == true ]]; then
    printf "  HINTING:       true  (engine=%s)\n" "$HINT_ENGINE"
    if [[ "$HINT_ENGINE" == ttfautohint ]]; then
      printf "    preset=%s  stem=%s  range=%s-%s  limit=%s  x-height=%s\n" \
        "$HINT_PRESET" "$HINT_MODE" "$HINT_RANGE_MIN" "$HINT_RANGE_MAX" "$HINT_LIMIT" "$HINT_XHEIGHT"
      printf "    x-snap-exc='%s'  win-compat=%s  ttfa-table=%s%s\n" \
        "${HINT_XSNAP_EXC-<default>}" "$HINT_WINCOMPAT" "$HINT_TTFA_TABLE" \
        "${HINT_FAMILY_SUFFIX:+  family-suffix='$HINT_FAMILY_SUFFIX'}"
    fi
    printf "    gasp=%s\n" "$GASP_MODE"
  else
    printf "  HINTING:       false\n"
  fi
  echo ""
  _show "$( [[ "$WANT_SF_PRO"     == true ]] && echo "x" || echo " " )" "SF Pro      ${SF_PRO_SUBS:+(subfamilies: $SF_PRO_SUBS)}"
  _show "$( [[ "$WANT_SF_COMPACT" == true ]] && echo "x" || echo " " )" "SF Compact  ${SF_COMPACT_SUBS:+(subfamilies: $SF_COMPACT_SUBS)}"
  _show "$( [[ "$WANT_SF_MONO"    == true ]] && echo "x" || echo " " )" "SF Mono"
  _show "$( [[ "$WANT_SF_ARABIC"  == true ]] && echo "x" || echo " " )" "SF Arabic"
  _show "$( [[ "$WANT_NY"         == true ]] && echo "x" || echo " " )" "New York    ${NY_SUBS:+(subfamilies: $NY_SUBS)}"
  echo "  ────────────────────────────────────────────────────────"
  echo ""

  # Persist the resolved options so build() and package() reuse the same answers
  # instead of re-prompting (makepkg runs each function in a fresh shell).
  {
    echo "NERD_PATCH=$NERD_PATCH"
    echo "WANT_VARIABLE=$WANT_VARIABLE"
    echo "HINTING=$HINTING"
    echo "HINT_ENGINE=$HINT_ENGINE"
    echo "HINT_PRESET=${HINT_PRESET:-}"
    echo "HINT_MODE=${HINT_MODE:-}"
    echo "HINT_RANGE_MIN=${HINT_RANGE_MIN:-}"
    echo "HINT_RANGE_MAX=${HINT_RANGE_MAX:-}"
    echo "HINT_LIMIT=${HINT_LIMIT:-}"
    echo "HINT_XHEIGHT=${HINT_XHEIGHT:-}"
    echo "HINT_WINCOMPAT=$HINT_WINCOMPAT"
    echo "HINT_TTFA_TABLE=$HINT_TTFA_TABLE"
    echo "GASP_MODE=$GASP_MODE"
    echo "WANT_SF_PRO=$WANT_SF_PRO"
    echo "WANT_SF_COMPACT=$WANT_SF_COMPACT"
    echo "WANT_SF_MONO=$WANT_SF_MONO"
    echo "WANT_SF_ARABIC=$WANT_SF_ARABIC"
    echo "WANT_NY=$WANT_NY"
    echo "SF_PRO_SUBS=${SF_PRO_SUBS:-}"
    echo "SF_COMPACT_SUBS=${SF_COMPACT_SUBS:-}"
    echo "NY_SUBS=${NY_SUBS:-}"
    # These two are optional and must distinguish "unset" from "set to empty".
    # `if` rather than `&&` so an unset variable is not a non-zero exit status
    # for the whole group under makepkg's `set -e`.
    if [[ "${HINT_XSNAP_EXC+set}" == set ]]; then
      echo "HINT_XSNAP_EXC=$HINT_XSNAP_EXC"
    fi
    if [[ -n "${HINT_FAMILY_SUFFIX:-}" ]]; then
      echo "HINT_FAMILY_SUFFIX=$HINT_FAMILY_SUFFIX"
    fi
  } > "$srcdir/.build_opts"
}

# Load the options persisted by _resolve_options(). Keys are whitelisted so a
# stray line in the file can never inject an arbitrary variable.
_load_options() {
  local _k _v
  [[ -f "$srcdir/.build_opts" ]] || { echo "Error: missing .build_opts; run prepare() first."; exit 1; }
  while IFS='=' read -r _k _v; do
    case "$_k" in
      NERD_PATCH|WANT_VARIABLE|HINTING|HINT_ENGINE|HINT_PRESET|HINT_MODE| \
      HINT_RANGE_MIN|HINT_RANGE_MAX|HINT_LIMIT|HINT_XHEIGHT|HINT_WINCOMPAT| \
      HINT_TTFA_TABLE|HINT_XSNAP_EXC|HINT_FAMILY_SUFFIX|GASP_MODE| \
      WANT_SF_PRO|WANT_SF_COMPACT|WANT_SF_MONO|WANT_SF_ARABIC|WANT_NY| \
      SF_PRO_SUBS|SF_COMPACT_SUBS|NY_SUBS)
        printf -v "$_k" '%s' "$_v" ;;
    esac
  done < "$srcdir/.build_opts"
}

prepare() {
  _resolve_options

  # ══════════════════════════════════════════════════════════════════════════
  # Step 1 — Extract fonts from Apple DMG archives (selected families only)
  # ══════════════════════════════════════════════════════════════════════════
  # Extraction lives in prepare() rather than build() so pkgver() — which runs
  # in between — can read the version out of the extracted font files.
  rm -rf "$srcdir/extracted" "$srcdir/converted" "$srcdir/patched" \
         "$srcdir/selected" "$srcdir/dmg"
  mkdir -p "$srcdir/extracted" "$srcdir/converted" "$srcdir/patched" \
           "$srcdir/selected"
  _extract_selected
}

pkgver() {
  # Compose the version from what the fonts themselves declare, combined with
  # the Nerd Fonts patcher version:
  #
  #   <highest Apple font version>+nf<nerd fonts version>   e.g. 22.0.5.4+nf3.5.1
  #
  # Apple's per-family versions differ (SF Pro 22.0d5e4, SF Mono 18.0d1e1,
  # NY 16.0d2e2), so we take the highest across the *selected* families. That
  # keeps pkgver monotonic: any family Apple bumps raises the package version,
  # and re-spins that change nothing leave it alone.
  local _apple
  _apple="$(python "$srcdir/font_meta.py" version "$srcdir/extracted/"* 2>/dev/null)" || _apple=""
  if [[ -z "$_apple" ]]; then
    # Never fail the build over a version string: fall back to the previous
    # pkgver so the package still builds if Apple ships unparseable metadata.
    echo "Warning: could not read a font version; keeping $pkgver" >&2
    echo "$pkgver"
    return 0
  fi
  # '-' is not allowed in pkgver; '+' and '.' are.
  printf '%s+nf%s\n' "${_apple//-/.}" "${_nfver//-/.}"
}

build() {
  _load_options


  # ══════════════════════════════════════════════════════════════════════════
  # Step 2 — Filter by family/subfamily and variable-font preference
  # ══════════════════════════════════════════════════════════════════════════
  # Selection is driven by each font's OpenType `name` table (typographic family,
  # nameID 16, falling back to nameID 1) rather than by filename patterns. Apple
  # has already changed both the installer layout and file naming between
  # re-spins, but the internal family names ("SF Pro Text", "New York Small",
  # "SF Mono") have been stable across every release we have seen — and they are
  # what fontconfig ends up showing the user anyway.
  #
  # The family map is built once with a single python call; the shell then only
  # does string matching, so a new weight or a renamed file is picked up for free.
  declare -A _fam_of=()
  local _file _fam
  while IFS=$'\t' read -r _file _fam; do
    if [[ -n "$_file" ]]; then _fam_of["$_file"]="$_fam"; fi
  done < <(python "$srcdir/font_meta.py" families "$srcdir/extracted/"* 2>/dev/null)

  if (( ${#_fam_of[@]} == 0 )); then
    echo "Error: could not read family names from any extracted font." >&2
    echo "       Is python-fonttools installed and are the fonts intact?" >&2
    exit 1
  fi

  # Does family string $1 belong to base family $2 with one of subfamilies $3?
  # Empty $3 means "any subfamily of this base family".
  _family_matches() {
    local _fam="$1" _base="$2" _subs="$3" _sub
    # Exact base family (e.g. "SF Mono", or the variable "SF Pro") …
    [[ "$_fam" == "$_base" ]] && { [[ -z "$_subs" ]] && return 0 || return 1; }
    # … or "<base> <subfamily>" (e.g. "SF Pro Text", "New York Small").
    [[ "$_fam" == "$_base "* ]] || return 1
    [[ -z "$_subs" ]] && return 0
    local _rest="${_fam#"$_base" }"
    for _sub in $_subs; do
      # Compare ignoring spaces so "ExtraLarge" matches "Extra Large".
      [[ "${_rest// /}" == "${_sub// /}" ]] && return 0
    done
    return 1
  }

  # Copy every extracted font whose family matches, honouring the static/variable
  # split: variable fonts are TTFs with an fvar axis and are only wanted when
  # NERD_PATCH=false and WANT_VARIABLE=true (font-patcher destroys fvar/gvar).
  _select_family() {
    local _want="$1" _base="$2" _subs="$3"
    [[ "$_want" != true ]] && return 0
    local _f _bn _fam _n=0
    for _f in "$srcdir/extracted"/*; do
      [[ -f "$_f" ]] || continue
      _bn="$(basename "$_f")"
      [[ "$_bn" == ._* ]] && continue
      _fam="${_fam_of[$_bn]:-}"
      [[ -n "$_fam" ]] || continue
      _family_matches "$_fam" "$_base" "$_subs" || continue
      # Apple ships the variable faces as .ttf and the static faces as .otf.
      if [[ "$_bn" == *.ttf || "$_bn" == *.TTF ]]; then
        [[ "$NERD_PATCH" == true || "$WANT_VARIABLE" != true ]] && continue
      fi
      cp -n "$_f" "$srcdir/selected/" && _n=$(( _n + 1 ))
    done
    if (( _n == 0 )); then
      echo "Warning: no fonts matched '$_base'${_subs:+ (subfamilies: $_subs)}." >&2
      # List what was actually available so a renamed subfamily is obvious.
      local _avail
      _avail="$(printf '%s\n' "${_fam_of[@]}" | grep -F "$_base" | sort -u | paste -sd', ')"
      if [[ -n "$_avail" ]]; then echo "         Available: $_avail" >&2; fi
    fi
    return 0
  }

  # SF Mono and SF Arabic have no subfamily split; the rest are filtered by the
  # *_SUBS variables (empty = every subfamily).
  _select_family "$WANT_SF_MONO"    "SF Mono"     ""
  _select_family "$WANT_SF_ARABIC"  "SF Arabic"   ""
  _select_family "$WANT_SF_PRO"     "SF Pro"      "$SF_PRO_SUBS"
  _select_family "$WANT_SF_COMPACT" "SF Compact"  "$SF_COMPACT_SUBS"
  _select_family "$WANT_NY"         "New York"    "$NY_SUBS"

  local _sel_count; _sel_count=$(find "$srcdir/selected" -type f | wc -l)
  echo "==> Selected $_sel_count font files for processing."
  if (( _sel_count == 0 )); then
    echo "Error: no fonts matched the selection. Check subfamily names."; exit 1
  fi

  # ══════════════════════════════════════════════════════════════════════════
  # Step 3 — OTF → TTF conversion (only for the ttfautohint engine, no patch)
  # ══════════════════════════════════════════════════════════════════════════
  # ttfautohint requires TrueType glyf outlines. otf2ttf.py (cu2qu) converts CFF
  # cubics to quadratic splines while preserving the name table. The 'cff' engine
  # keeps OTFs intact and is handled in step 5.
  local _patchsrc
  if [[ "$NERD_PATCH" == false && "$HINTING" == true && "$HINT_ENGINE" == ttfautohint ]]; then
    printf "%b" "\e[1;34m==> INFO:\e[0m Converting static OTF→TTF for ttfautohint...\n"
    find "$srcdir/selected" -name '*.otf' ! -name '._*' | sort | \
      parallel --will-cite -j"$(nproc)" \
        'python "'"$srcdir/otf2ttf.py"'" --post-format 2.0 --max-error 1.0 \
           -o "'"$srcdir/converted"'/{/.}.ttf" "{}"'
    # Variable TTFs and native TTFs pass through unchanged
    find "$srcdir/selected" -name '*.ttf' ! -name '._*' \
      -exec cp -n {} "$srcdir/converted/" \;
    _patchsrc="$srcdir/converted"
  else
    # NERD_PATCH=true → font-patcher converts implicitly.
    # cff engine / no-hint → operate on selected fonts directly.
    _patchsrc="$srcdir/selected"
  fi

  # ══════════════════════════════════════════════════════════════════════════
  # Step 4 — Nerd Fonts patching (skipped when NERD_PATCH=false)
  # ══════════════════════════════════════════════════════════════════════════
  local _hintsrc
  if [[ "$NERD_PATCH" == true ]]; then
    printf "%b" "\e[1;33m==> WARNING:\e[0m Patching with Nerd Fonts glyphs — this takes a while...\n"

    # SF Mono: -s (--mono) preserves monospace cell-width metrics.
    # stderr is kept (only stdout silenced) so patch failures are visible, and we
    # assert non-empty output afterwards rather than masking with `|| true`.
    find "$_patchsrc" \( -name 'SF-Mono-*.otf' -o -name 'SF-Mono-*.ttf' \) | sort | \
      parallel --will-cite -j4 python "$srcdir/font-patcher" \
        --variable-width-glyphs -q -c -s {} \
        -out "$srcdir/patched" '>/dev/null'

    find "$_patchsrc" \( -name '*.otf' -o -name '*.ttf' \) ! -name 'SF-Mono-*' | sort | \
      parallel --will-cite -j4 python "$srcdir/font-patcher" \
        --variable-width-glyphs -q -c {} \
        -out "$srcdir/patched" '>/dev/null'

    # font-patcher preserves the input outline format: OTF/CFF inputs (all the
    # Apple static fonts, including SF Mono) yield patched *.otf; only TrueType
    # inputs yield *.ttf. Count both, and fail loud if nothing came out.
    local _patched_count
    _patched_count=$(find "$srcdir/patched" -maxdepth 1 \( -name '*.ttf' -o -name '*.otf' \) | wc -l)
    if (( _patched_count == 0 )); then
      echo "Error: font-patcher produced no output. See messages above."; exit 1
    fi
    echo "==> Patched $_patched_count font(s)."

    # The ttfautohint engine needs TrueType glyf outlines, so convert any patched
    # OTFs to TTF in place. (The cff engine only runs when NERD_PATCH=false, so a
    # patched tree never feeds it.)
    if [[ "$HINTING" == true && "$HINT_ENGINE" == ttfautohint ]] && \
       compgen -G "$srcdir/patched/*.otf" >/dev/null; then
      printf "%b" "\e[1;34m==> INFO:\e[0m Converting patched OTF→TTF for ttfautohint...\n"
      find "$srcdir/patched" -maxdepth 1 -name '*.otf' ! -name '._*' | sort | \
        parallel --will-cite -j"$(nproc)" \
          'python "'"$srcdir/otf2ttf.py"'" --post-format 2.0 --max-error 1.0 \
             -o "'"$srcdir/patched"'/{/.}.ttf" "{}" && rm -f "{}"'
    fi
    _hintsrc="$srcdir/patched"
  else
    _hintsrc="$_patchsrc"
  fi

  # ══════════════════════════════════════════════════════════════════════════
  # Step 5 — Hinting
  # ══════════════════════════════════════════════════════════════════════════
  if [[ "$HINTING" == true && "$HINT_ENGINE" == cff && "$NERD_PATCH" == false ]]; then
    # ── CFF/OTF hinting: keep OTF outlines, no TTF conversion ──
    mkdir -p "$srcdir/patched/hinted"
    local _have_otfautohint=false
    command -v otfautohint >/dev/null 2>&1 && _have_otfautohint=true
    if [[ "$_have_otfautohint" == true ]]; then
      printf "%b" "\e[1;32m==> INFO:\e[0m CFF hinting via otfautohint (AFDKO)...\n"
    else
      printf "%b" "\e[1;32m==> INFO:\e[0m CFF hinting via FontForge AutoHint (install afdko for otfautohint)...\n"
    fi
    # Two Apple-specific quirks make stock otfautohint abort on these fonts:
    #
    #  1. Overlapping alignment zones. otfautohint reads the CFF Private-dict
    #     zones and FATALLY rejects any that overlap or sit within 1+2*BlueFuzz
    #     units. Apple's SF Pro/Compact ship DUPLICATE/OVERLAPPING zones (e.g.
    #     SF Pro Text BlueValues lists (1443,1477) twice; OtherBlues has
    #     (-34,0)⊃(-19,0)) → "top of zone X overlaps zone Y". dedup_blues.py
    #     collapses those redundant pairs into a spec-conformant, non-overlapping
    #     set (outlines untouched).
    #
    #  2. closeSegs assertion on overlapping contours. otfautohint has an open
    #     bug (afdko #1795, unfixed through 5.0.1) where `assert n and p` in
    #     hinter.py crashes on glyphs with overlapping/degenerate contours — the
    #     heavy SF *-Black weights hit this (e.g. uni10094E.large). Passing
    #     --force-overlap routes glyphs through otfautohint's overlap-correction
    #     path during analysis and avoids the crash WITHOUT altering the emitted
    #     outlines (verified bit-identical on normal glyphs).
    #
    # otfautohint preserves the name table; the FontForge AutoHint path
    # (cff_hint.py) is kept only as a last-resort fallback (it repairs the names
    # FontForge mangles) so a font is never silently dropped from the package.
    for _f in "$_hintsrc"/*.otf; do
      [[ -f "$_f" ]] || continue
      local _out="$srcdir/patched/hinted/$(basename "$_f")"
      if [[ "$_have_otfautohint" == true ]]; then
        python "$srcdir/dedup_blues.py" "$_f"
        if ! otfautohint --force-overlap -o "$_out" "$_f" 2>/dev/null; then
          printf "%b" "\e[1;33m==> WARNING:\e[0m otfautohint failed on $(basename "$_f"); using FontForge AutoHint instead.\n"
          rm -f "$_out"
          python "$srcdir/cff_hint.py" "$_f" "$_out"
        fi
      else
        python "$srcdir/cff_hint.py" "$_f" "$_out"
      fi
    done
    # Variable / native TTFs cannot get CFF hints — pass them through untouched.
    for _f in "$_hintsrc"/*.ttf; do
      [[ -f "$_f" ]] || continue
      cp -n "$_f" "$srcdir/patched/hinted/"
    done

  elif [[ "$HINTING" == true ]]; then
    # ── ttfautohint engine (TTF) ──
    # PUA glyphs (SF Symbols / Nerd icons): --fallback-script=none +
    # --fallback-scaling scale them proportionally instead of mis-hinting as Latin.
    printf "%b" "\e[1;32m==> INFO:\e[0m ttfautohint (preset=$HINT_PRESET, stem=$HINT_MODE, range=$HINT_RANGE_MIN-$HINT_RANGE_MAX, x-height=$HINT_XHEIGHT)...\n"
    mkdir -p "$srcdir/patched/hinted"

    # Assemble optional flags.
    local -a _ta_opts=(
      --hinting-range-min="$HINT_RANGE_MIN"
      --hinting-range-max="$HINT_RANGE_MAX"
      --hinting-limit="$HINT_LIMIT"
      --increase-x-height="$HINT_XHEIGHT"
      --fallback-script=none
      --fallback-scaling
      --stem-width-mode="$HINT_MODE"
      --ignore-restrictions
    )
    # x-height-snapping-exceptions: honour an explicit value (including empty
    # string = no exceptions); omit entirely if unset to use ttfautohint's default.
    if [[ "${HINT_XSNAP_EXC+set}" == set ]]; then
      _ta_opts+=(--x-height-snapping-exceptions="$HINT_XSNAP_EXC")
    fi
    if [[ "$HINT_WINCOMPAT" == true ]]; then _ta_opts+=(--windows-compatibility); fi
    if [[ -n "${HINT_FAMILY_SUFFIX:-}" ]]; then _ta_opts+=(--family-suffix="$HINT_FAMILY_SUFFIX"); fi
    if [[ "$HINT_TTFA_TABLE" == true ]]; then
      _ta_opts+=(--ttfa-table)
    else
      _ta_opts+=(--no-info)
    fi

    for _f in "$_hintsrc"/*.ttf; do
      [[ -f "$_f" ]] || continue
      ttfautohint "${_ta_opts[@]}" "$_f" "$srcdir/patched/hinted/$(basename "$_f")"
    done
  fi

  # ══════════════════════════════════════════════════════════════════════════
  # Step 6 — gasp grid-fitting / anti-aliasing tuning (TTF output only)
  # ══════════════════════════════════════════════════════════════════════════
  if [[ "$HINTING" == true && "$GASP_MODE" != keep ]]; then
    local _gasp_dir
    if [[ "$HINT_ENGINE" == cff && "$NERD_PATCH" == false ]]; then
      _gasp_dir="$srcdir/patched/hinted"   # only the .ttf passthroughs here have a gasp
    else
      _gasp_dir="$srcdir/patched/hinted"
    fi
    if compgen -G "$_gasp_dir/*.ttf" >/dev/null; then
      printf "%b" "\e[1;36m==> INFO:\e[0m Applying gasp mode '$GASP_MODE' to TTF output...\n"
      python "$srcdir/set_gasp.py" "$GASP_MODE" "$_gasp_dir"/*.ttf
    fi
  fi

}

package() {
  # Reuse the single source of truth written by prepare(); makepkg runs each
  # function in a fresh shell, so nothing is inherited.
  local HINTING NERD_PATCH WANT_VARIABLE HINT_ENGINE
  _load_options

  install -d "$pkgdir/usr/share/fonts/apple"

  if [[ "$HINTING" == true ]]; then
    # Hinted output (TTF and/or OTF for the cff engine) lives in patched/hinted/.
    # Fail loud if it is empty — never silently ship a fontless package.
    if compgen -G "$srcdir/patched/hinted/*.ttf" >/dev/null; then
      install -m644 "$srcdir/patched/hinted/"*.ttf "$pkgdir/usr/share/fonts/apple"
    fi
    if compgen -G "$srcdir/patched/hinted/*.otf" >/dev/null; then
      install -m644 "$srcdir/patched/hinted/"*.otf "$pkgdir/usr/share/fonts/apple"
    fi
    if ! compgen -G "$pkgdir/usr/share/fonts/apple/*" >/dev/null; then
      echo "Error: hinting was requested but produced no fonts."; exit 1
    fi

  elif [[ "$NERD_PATCH" == true ]]; then
    # Patched but not hinted: font-patcher emits TTF for TTF inputs and OTF for
    # OTF inputs (e.g. SF Mono), so install both. patched/hinted/ doesn't exist
    # on this path, so the shallow globs won't pick up hinted output.
    if compgen -G "$srcdir/patched/*.ttf" >/dev/null; then
      install -m644 "$srcdir/patched/"*.ttf "$pkgdir/usr/share/fonts/apple"
    fi
    if compgen -G "$srcdir/patched/*.otf" >/dev/null; then
      install -m644 "$srcdir/patched/"*.otf "$pkgdir/usr/share/fonts/apple"
    fi
    if ! compgen -G "$pkgdir/usr/share/fonts/apple/*" >/dev/null; then
      echo "Error: patching was requested but produced no fonts."; exit 1
    fi

  else
    # No patching, no hinting: install selected fonts directly.
    if compgen -G "$srcdir/selected/*.otf" >/dev/null; then
      install -m644 "$srcdir/selected/"*.otf "$pkgdir/usr/share/fonts/apple"
    fi
    if [[ "$WANT_VARIABLE" == true ]] && compgen -G "$srcdir/selected/*.ttf" >/dev/null; then
      install -m644 "$srcdir/selected/"*.ttf "$pkgdir/usr/share/fonts/apple"
    fi
    if ! compgen -G "$pkgdir/usr/share/fonts/apple/*" >/dev/null; then
      echo "Error: no fonts were installed."; exit 1
    fi
  fi

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
Apple San Francisco, SF Compact, SF Mono, SF Arabic, and New York fonts
are proprietary fonts owned by Apple Inc. They are provided for use on
Apple platforms and non-Apple platforms for personal, non-commercial use.
See https://developer.apple.com/fonts/ for the full license agreement.

Nerd Fonts glyphs are licensed under their respective open-source licenses.
See https://github.com/ryanoasis/nerd-fonts for details.
EOF
}
