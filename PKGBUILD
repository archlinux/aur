# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=nerd-fonts-apple-hinted
_nfver=3.5.1
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
# pkgver is derived at build time by pkgver() below: the highest font version
# found inside the selected Apple fonts, plus the Nerd Fonts patcher version
# (e.g. 22.0.5.4+nf3.5.1). The literal here is only a placeholder for the first
# run and for tooling that parses the PKGBUILD without executing it.
# NOTE: makepkg writes the resolved pkgver back into this file and resets
# pkgrel to 1 when it changes. After a build that selected a subset of the
# families (SF Mono alone gives 18.0.1.1+nf3.5.1), restore both lines before
# committing: `git checkout PKGBUILD` and re-apply the pkgrel bump.
pkgver=22.2.2.1+nf3.5.1
pkgrel=1
pkgdesc="Apple fonts (SF Pro, SF Compact, SF Mono, SF Arabic, NY), optionally Nerd Fonts patched, tuned with fonttune"
arch=(any)
url="https://developer.apple.com/fonts/"
license=("custom")
makedepends=("git" "p7zip" "python" "python-fonttools" "python-freetype-py" "python-skia-pathops" "parallel" "fontforge" "libarchive" "ttfautohint")
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
  "font_meta.py"
  "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}"
)
# Apple re-spins the DMGs without versioning, so those legitimately stay SKIP:
# the real identity check is pkgver(), which reads the version out of the font
# files themselves. fonttune tracks main (see _check_fonttune).
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '1297a4be9504032cc3457c3d50f30a21c3101f4203f5dd545c8d4c19f4859600'
            'SKIP')

# ── Versioning ──────────────────────────────────────────────────────────────
#
#     <highest Apple font version>+nf<nerd fonts version>    e.g. 22.0.5.4+nf3.5.1
#
# Apple versions each family independently (SF Pro 22.0d5e4, SF Mono 18.0d1e1,
# New York 16.0d2e2), so taking the max of the selected families keeps pkgver
# monotonic. pkgver therefore depends on which families you select.
#
# ── Build options ───────────────────────────────────────────────────────────
#
# Asked on a terminal, otherwise taken from the environment / defaults.
#
#  Apple-specific (this PKGBUILD):
#    NERD_PATCH     true/false  patch with Nerd Fonts glyphs (default false)
#    WANT_VARIABLE  true/false  also install the variable TTFs; never with NERD_PATCH
#    WANT_SF_PRO / WANT_SF_COMPACT / WANT_SF_MONO / WANT_SF_ARABIC / WANT_NY
#                   true/false  (defaults true false true false true)
#    SF_PRO_SUBS / SF_COMPACT_SUBS / NY_SUBS   space-separated subfamilies, empty = all
#
#  Font tuning (fonttune; see `fonttune steps` and its README). Every key can
#  be given as FONTTUNE_<KEY>, which also skips its question:
#    FONTTUNE_OTF2TTF      true/false   OTF -> TrueType outlines (FreeType only
#                                       autohints TrueType under hintslight)
#    FONTTUNE_WEIGHTS      true/false   normalise usWeightClass
#    FONTTUNE_TRAK         ""|strip|stat|<pt>   trak table: leave, remove, keep+STAT, or
#                                       bake the tracking at <pt> points (default 13)
#    FONTTUNE_EVEN_SPACING ""|all|latin,greek,cyrillic
#    FONTTUNE_PIXEL_GRID   ""|auto|<ppem>      exclusive with EVEN_SPACING
#    FONTTUNE_FEATURES     ""|fonts.conf|tag,tag   bake into calt so every program applies them
#    FONTTUNE_FEATURE_SUFFIX  e.g. " Alt": install renamed families next to nothing else
#    FONTTUNE_GASP         keep|sized|smooth|gridfit
#    Extra: FONTTUNE_REPO / FONTTUNE_REF pick the fonttune source (local testing:
#    `FONTTUNE_DEV=true` (see _ft_local)).
#
#  Hinting is the fonttune step `hint` (ttfautohint; FONTTUNE_HINT=balanced|sharp|
#  natural|light). Under GNOME's hintslight FreeType ignores the bytecode (bitmaps
#  identical, +44% size), so the question defaults to "no" there. When it is on,
#  the package also ships conf.avail/80-$pkgname.conf (not enabled) that makes
#  the installed families use it:
#    sudo ln -s /usr/share/fontconfig/conf.avail/80-$pkgname.conf /etc/fonts/conf.d/
#  GTK4 needs font-rendering=manual + font-hinting=medium as well. The old CFF
#  engine is gone (worse than ttfautohint); see README.md for the measurements.
#
# fonts.conf features: FONTTUNE_FEATURES=fonts.conf takes the tags active in the
# <match target="font"> blocks of ~/.config/fontconfig/fonts.conf (or $APPLE_FONTS_CONF)
# whose family belongs to a family this build installs. A tag a family cannot
# honour is skipped there (_FEATURE_SKIP: ss03 is the centred colon in SF Pro
# but "remove the slash from the zero" in SF Mono).
# ────────────────────────────────────────────────────────────────────────────

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

_show() { printf "  [%s] %s\n" "$1" "$2"; }
_ask_yn() { local _default="${2:-n}"; read -r -p "  $1? (default: $_default) " _yn || _yn=""; _yn="${_yn:-$_default}"; }
_ask_multi() {
  local _label="$1"; shift; local _opts=("$@"); local _n=${#_opts[@]}
  echo "    Subfamilies (space-separated numbers, or Enter/a for all):"
  for (( i=0; i<_n; i++ )); do printf "      %d) %s\n" "$((i+1))" "${_opts[$i]}"; done
  read -r -p "    > " _raw || _raw=""; _sel=""
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

# Apple-specific options only. Everything about the font tuning itself is asked
# by `fonttune configure` once the fonts are selected (see prepare()).
_resolve_options() {
  local _interactive=false
  [[ -t 0 ]] && _interactive=true
  if [[ "$_interactive" == true ]]; then
    echo ""
    echo "══ nerd-fonts-apple-hinted: fonts ══"
  else
    echo "==> Non-interactive build (no TTY): using environment variables / defaults."
  fi

  if [[ "$_interactive" == true && -z "${NERD_PATCH:-}" ]]; then
    _ask_yn "[NERD_PATCH] Patch fonts with Nerd Fonts glyphs" n
    [[ "$_yn" =~ ^[yY]$ ]] && NERD_PATCH=true || NERD_PATCH=false
  fi
  NERD_PATCH="${NERD_PATCH:-false}"

  if [[ "$_interactive" == true && "$NERD_PATCH" == false && -z "${WANT_VARIABLE:-}" ]]; then
    echo "  Variable fonts hold all weights in one file; font-patcher destroys their axes."
    _ask_yn "[WANT_VARIABLE] Include variable TTF fonts" n
    [[ "$_yn" =~ ^[yY]$ ]] && WANT_VARIABLE=true || WANT_VARIABLE=false
  fi
  [[ "$NERD_PATCH" == true ]] && WANT_VARIABLE=false
  WANT_VARIABLE="${WANT_VARIABLE:-false}"

  if [[ "$_interactive" == true && \
        -z "${WANT_SF_PRO:-}${WANT_SF_COMPACT:-}${WANT_SF_MONO:-}${WANT_SF_ARABIC:-}${WANT_NY:-}" ]]; then
    _ask_yn "[WANT_SF_PRO] Include SF Pro" y
    if [[ "$_yn" =~ ^[yY]$ ]]; then
      WANT_SF_PRO=true
      if [[ -z "${SF_PRO_SUBS:-}" ]]; then _ask_multi "SF Pro" Display Text Rounded; SF_PRO_SUBS="$_sel"; fi
    else WANT_SF_PRO=false; fi
    _ask_yn "[WANT_SF_COMPACT] Include SF Compact" n
    if [[ "$_yn" =~ ^[yY]$ ]]; then
      WANT_SF_COMPACT=true
      if [[ -z "${SF_COMPACT_SUBS:-}" ]]; then _ask_multi "SF Compact" Display Text Rounded; SF_COMPACT_SUBS="$_sel"; fi
    else WANT_SF_COMPACT=false; fi
    _ask_yn "[WANT_SF_MONO] Include SF Mono" y
    [[ "$_yn" =~ ^[yY]$ ]] && WANT_SF_MONO=true || WANT_SF_MONO=false
    _ask_yn "[WANT_SF_ARABIC] Include SF Arabic" n
    [[ "$_yn" =~ ^[yY]$ ]] && WANT_SF_ARABIC=true || WANT_SF_ARABIC=false
    _ask_yn "[WANT_NY] Include New York" y
    if [[ "$_yn" =~ ^[yY]$ ]]; then
      WANT_NY=true
      if [[ -z "${NY_SUBS:-}" ]]; then _ask_multi "New York" Small Medium Large ExtraLarge; NY_SUBS="$_sel"; fi
    else WANT_NY=false; fi
  fi
  WANT_SF_PRO="${WANT_SF_PRO:-true}"
  WANT_SF_COMPACT="${WANT_SF_COMPACT:-false}"
  WANT_SF_MONO="${WANT_SF_MONO:-true}"
  WANT_SF_ARABIC="${WANT_SF_ARABIC:-false}"
  WANT_NY="${WANT_NY:-true}"
  if [[ "$WANT_SF_PRO$WANT_SF_COMPACT$WANT_SF_MONO$WANT_SF_ARABIC$WANT_NY" != *true* ]]; then
    echo "Error: no font families selected. Aborting."; exit 1
  fi

  echo ""
  echo "  ── Fonts ───────────────────────────────────────────────"
  printf "  NERD_PATCH: %s   WANT_VARIABLE: %s\n" "$NERD_PATCH" "$WANT_VARIABLE"
  _show "$( [[ "$WANT_SF_PRO"     == true ]] && echo x || echo ' ' )" "SF Pro      ${SF_PRO_SUBS:+(subfamilies: $SF_PRO_SUBS)}"
  _show "$( [[ "$WANT_SF_COMPACT" == true ]] && echo x || echo ' ' )" "SF Compact  ${SF_COMPACT_SUBS:+(subfamilies: $SF_COMPACT_SUBS)}"
  _show "$( [[ "$WANT_SF_MONO"    == true ]] && echo x || echo ' ' )" "SF Mono"
  _show "$( [[ "$WANT_SF_ARABIC"  == true ]] && echo x || echo ' ' )" "SF Arabic"
  _show "$( [[ "$WANT_NY"         == true ]] && echo x || echo ' ' )" "New York    ${NY_SUBS:+(subfamilies: $NY_SUBS)}"
  echo "  ────────────────────────────────────────────────────────"

  # makepkg runs each function in a fresh shell: persist for build()/package().
  {
    echo "NERD_PATCH=$NERD_PATCH"
    echo "WANT_VARIABLE=$WANT_VARIABLE"
    echo "WANT_SF_PRO=$WANT_SF_PRO"
    echo "WANT_SF_COMPACT=$WANT_SF_COMPACT"
    echo "WANT_SF_MONO=$WANT_SF_MONO"
    echo "WANT_SF_ARABIC=$WANT_SF_ARABIC"
    echo "WANT_NY=$WANT_NY"
    echo "SF_PRO_SUBS=${SF_PRO_SUBS:-}"
    echo "SF_COMPACT_SUBS=${SF_COMPACT_SUBS:-}"
    echo "NY_SUBS=${NY_SUBS:-}"
  } > "$srcdir/.build_opts"
}

# Keys are whitelisted so a stray line can never inject an arbitrary variable.
_load_options() {
  local _k _v
  [[ -f "$srcdir/.build_opts" ]] || { echo "Error: missing .build_opts; run prepare() first."; exit 1; }
  while IFS='=' read -r _k _v; do
    case "$_k" in
      NERD_PATCH|WANT_VARIABLE|WANT_SF_PRO|WANT_SF_COMPACT|WANT_SF_MONO|WANT_SF_ARABIC|WANT_NY|\
      SF_PRO_SUBS|SF_COMPACT_SUBS|NY_SUBS) printf -v "$_k" '%s' "$_v" ;;
    esac
  done < "$srcdir/.build_opts"
}

# Tags that must not be baked into some families. Audit 2026-10-29: ss03 is the
# centred colon in SF Pro (colon -> colon.uc) but un-slashes the zero in SF Mono
# (no colon.uc glyph there), so the tag is dropped for SF Mono and baked into
# the rest. 'TAG=REGEX|reason'; the regex is tested against the family name, the
# nameID 16 name and the file name, so it also matches the patched Nerd names.
_FEATURE_SKIP=(
  'ss03=SF ?Mono|SF Mono has no colon.uc glyph; its ss03 would replace the slashed zero with a plain one'
)

# Copy the extracted fonts of the selected families to $srcdir/selected. Selection
# is by each font's `name` table (typographic family, nameID 16, else 1), not by
# file name: Apple has changed file naming between re-spins, the family names
# have been stable.
_select_fonts() {
  declare -gA _fam_of=()
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
    [[ "$_fam" == "$_base" ]] && { [[ -z "$_subs" ]] && return 0 || return 1; }
    [[ "$_fam" == "$_base "* ]] || return 1
    [[ -z "$_subs" ]] && return 0
    local _rest="${_fam#"$_base" }"
    for _sub in $_subs; do
      [[ "${_rest// /}" == "${_sub// /}" ]] && return 0   # "ExtraLarge" == "Extra Large"
    done
    return 1
  }

  # Apple ships the variable faces as .ttf and the static ones as .otf; variable
  # fonts are only wanted with NERD_PATCH=false and WANT_VARIABLE=true.
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
      if [[ "$_bn" == *.ttf || "$_bn" == *.TTF ]]; then
        [[ "$NERD_PATCH" == true || "$WANT_VARIABLE" != true ]] && continue
      fi
      cp -n "$_f" "$srcdir/selected/" && _n=$(( _n + 1 ))
    done
    if (( _n == 0 )); then
      echo "Warning: no fonts matched '$_base'${_subs:+ (subfamilies: $_subs)}." >&2
      local _avail
      _avail="$(printf '%s\n' "${_fam_of[@]}" | grep -F "$_base" | sort -u | paste -sd', ')"
      if [[ -n "$_avail" ]]; then echo "         Available: $_avail" >&2; fi
    fi
    return 0
  }

  _select_family "$WANT_SF_MONO"    "SF Mono"    ""
  _select_family "$WANT_SF_ARABIC"  "SF Arabic"  ""
  _select_family "$WANT_SF_PRO"     "SF Pro"     "$SF_PRO_SUBS"
  _select_family "$WANT_SF_COMPACT" "SF Compact" "$SF_COMPACT_SUBS"
  _select_family "$WANT_NY"         "New York"   "$NY_SUBS"

  local _n; _n=$(find "$srcdir/selected" -type f | wc -l)
  echo "==> Selected $_n font files for processing."
  if (( _n == 0 )); then echo "Error: no fonts matched the selection. Check subfamily names."; exit 1; fi
}

prepare() {
  _resolve_options
  rm -rf "$srcdir/extracted" "$srcdir/patched" "$srcdir/selected" "$srcdir/dmg"
  mkdir -p "$srcdir/extracted" "$srcdir/patched" "$srcdir/selected"
  # Extraction lives in prepare() so pkgver(), which runs next, can read the
  # version out of the extracted font files.
  _extract_selected
  _select_fonts
  _ft_local
  _check_fonttune
  # The tuning questions, asked about the fonts that were just selected (so
  # only relevant ones appear). Answers go to a file that build() reads.
  python "$(_ft)/bin/fonttune" configure --defaults apple \
    --save-to "$srcdir/fonttune.toml" "$srcdir/selected/"*
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

# Local fonttune, uncommitted edits included, only with FONTTUNE_DEV=true: the
# tree in FONTTUNE_DEV_DIR, else the one saved by `fonttune dev set [path]`, else
# ../fonttune next to this PKGBUILD, else (with a note) the git source. Unset or
# false (AUR helpers): always the git source. A missing tree never stops the
# build. The tree is copied to $srcdir/fonttune-local; the git source and
# .SRCINFO stay as they are.
_ft() { if [[ -d "$srcdir/fonttune-local" ]]; then echo "$srcdir/fonttune-local"; else echo "$srcdir/fonttune"; fi; }

_ft_local() {  # in prepare(): with FONTTUNE_DEV=true the local tree, if there is one
  local _dev=${FONTTUNE_DEV-} _cf=${XDG_CONFIG_HOME:-$HOME/.config}/fonttune/dev _t
  local -a _try=()
  rm -rf "$srcdir/fonttune-local"
  case "${_dev,,}" in
    true|1|yes|on) ;;
    ''|false|0|no|off) return 0 ;;
    *) echo "==> fonttune: FONTTUNE_DEV=$_dev is not true/false: building with the git source" \
         "(the tree goes in FONTTUNE_DEV_DIR or \`fonttune dev set\`)" >&2
       return 0 ;;
  esac
  [[ -n "${FONTTUNE_DEV_DIR-}" ]] && _try+=("$FONTTUNE_DEV_DIR")
  [[ -r "$_cf" ]] && _try+=("$(<"$_cf")")
  _try+=("$(realpath -m "$startdir/../fonttune")")
  for _t in "${_try[@]}" ''; do
    [[ -n "$_t" && -f "$_t/fonttune/__init__.py" ]] && break
  done
  if [[ -z "$_t" ]]; then
    echo "==> fonttune: FONTTUNE_DEV=$_dev but no fonttune tree at ${_try[*]}: building with the git source" >&2
    return 0
  fi
  mkdir "$srcdir/fonttune-local"
  tar -C "$_t" --exclude=.git --exclude=__pycache__ -cf - . | tar -C "$srcdir/fonttune-local" -xf -
  echo "local:$(git -C "$_t" describe --always --dirty 2>/dev/null || echo "$_t")" \
    > "$srcdir/fonttune-local/.rev"
  echo "==> fonttune: LOCAL tree $_t ($(<"$srcdir/fonttune-local/.rev"))" >&2
}

_ft_rev() { cat "$(_ft)/.rev" 2>/dev/null || git -C "$srcdir/fonttune" describe --always --dirty 2>/dev/null; }

_check_fonttune() {
  # fonttune is tracked at main (latest). Its API number only changes when a
  # step interface breaks; then this package needs a matching update.
  local _api
  _api=$(sed -nE 's/^API *= *([0-9]+).*/\1/p' "$(_ft)/fonttune/__init__.py")
  if [[ "$_api" != "$_ftapi" ]]; then
    echo "Error: fonttune API is '${_api:-?}', this PKGBUILD expects $_ftapi." >&2
    echo "       Update the PKGBUILD for the new fonttune, or pin FONTTUNE_REF=tag=<last-good>." >&2
    exit 1
  fi
}

# Regex over the families this build installs, for fonttune's fonts.conf lookup.
_families_regex() {
  local -a _alt=()
  [[ "$WANT_SF_PRO" == true ]]     && _alt+=('SF ?Pro')
  [[ "$WANT_SF_COMPACT" == true ]] && _alt+=('SF ?Compact')
  [[ "$WANT_SF_MONO" == true ]]    && _alt+=('SF ?Mono')
  [[ "$WANT_SF_ARABIC" == true ]]  && _alt+=('SF ?Arabic')
  [[ "$WANT_NY" == true ]]         && _alt+=('New ?York')
  local IFS='|'
  echo "^(${_alt[*]})"
}

build() {
  _check_fonttune
  _load_options

  local -a _ft=(python "$(_ft)/bin/fonttune" run --config "$srcdir/fonttune.toml" --in-place
                --fonts-conf "${APPLE_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}"
                --features-match "$(_families_regex)")
  local _s
  for _s in "${_FEATURE_SKIP[@]}"; do _ft+=(--feature-skip "$_s"); done

  if [[ "$NERD_PATCH" != true ]]; then
    "${_ft[@]}" "$srcdir/selected/"*
    return
  fi

  # font-patcher (FontForge) drops trak and STAT, so weights and trak run first;
  # everything else works on the patched fonts.
  printf "%b" "\e[1;33m==> WARNING:\e[0m Patching with Nerd Fonts glyphs, this takes a while...\n"
  "${_ft[@]}" --only weights,trak "$srcdir/selected/"*

  # SF Mono: -s (--mono) keeps the monospace cell width.
  find "$srcdir/selected" \( -name 'SF-Mono-*.otf' -o -name 'SF-Mono-*.ttf' \) | sort | \
    parallel --will-cite -j4 python "$srcdir/font-patcher" \
      --variable-width-glyphs -q -c -s {} -out "$srcdir/patched" '>/dev/null'
  find "$srcdir/selected" \( -name '*.otf' -o -name '*.ttf' \) ! -name 'SF-Mono-*' | sort | \
    parallel --will-cite -j4 python "$srcdir/font-patcher" \
      --variable-width-glyphs -q -c {} -out "$srcdir/patched" '>/dev/null'

  # font-patcher keeps the input outline format (OTF in, OTF out).
  local -a _patched=()
  local _f
  for _f in "$srcdir/patched/"*.otf "$srcdir/patched/"*.ttf; do
    [[ -f "$_f" ]] && _patched+=("$_f")
  done
  if (( ${#_patched[@]} == 0 )); then echo "Error: font-patcher produced no output."; exit 1; fi
  echo "==> Patched ${#_patched[@]} font(s)."

  # FontForge writes garbage into nameID 16/17 (a patched SF Pro would advertise
  # "最攀਀ऀ攀砀...") and adds a duplicate Mac-Roman copy of Apple's 60 KB licence,
  # pushing the name table past the 64 KB limit; no later step could write the
  # font back. Repair it before anything else touches the patched fonts.
  echo "==> Repairing the name table font-patcher wrote..."
  parallel --will-cite -j"$(nproc)" python "$(_ft)/fonttune/steps/fix_names.py" ::: "${_patched[@]}"

  "${_ft[@]}" --skip weights,trak "${_patched[@]}"
}

package() {
  local NERD_PATCH
  _load_options
  local _src="$srcdir/selected"
  [[ "$NERD_PATCH" == true ]] && _src="$srcdir/patched"

  install -d "$pkgdir/usr/share/fonts/apple" "$pkgdir/usr/share/doc/$pkgname"
  # Which fonttune and settings produced these fonts (build provenance).
  _ft_rev > "$pkgdir/usr/share/doc/$pkgname/FONTTUNE_REV" 2>/dev/null || true
  install -m644 "$srcdir/fonttune.toml" "$pkgdir/usr/share/doc/$pkgname/fonttune.toml"

  local _f
  for _f in "$_src"/*.otf "$_src"/*.ttf; do
    [[ -f "$_f" ]] && install -m644 "$_f" "$pkgdir/usr/share/fonts/apple/"
  done
  # Fail loud: never silently ship a fontless package.
  if ! compgen -G "$pkgdir/usr/share/fonts/apple/*" >/dev/null; then
    echo "Error: no fonts were installed from $_src."; exit 1
  fi

  # Opt-in fontconfig snippet when the fonts carry ttfautohint bytecode.
  if grep -q '^hint = "[a-z]' "$srcdir/fonttune.toml"; then
    install -d "$pkgdir/usr/share/fontconfig/conf.avail"
    python "$(_ft)/bin/fonttune" hintconf --name "$pkgname" \
      -o "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf" \
      "$pkgdir"/usr/share/fonts/apple/*.ttf
    chmod 644 "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf"
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
