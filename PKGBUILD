# Maintainer: Ron Asimi <ron.asimi@gmail.com>
pkgname=raveo-ttf-hinted
_raveover=1.1
_nfver=3.5.1
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
pkgver="${_raveover}"
pkgrel=7
pkgdesc='Raveo, a warmer modification of Inter with redrawn glyphs, tuned with fonttune, optionally Nerd Fonts patched'
arch=('any')
url='https://github.com/jakubfoglar/raveo'
license=('custom:OFL')
depends=('fontconfig')
makedepends=('git' 'python' 'python-fonttools' 'python-skia-pathops' 'fontforge' 'parallel' 'ttfautohint' 'libarchive')
conflicts=('raveo-ttf')
source=(
  "Raveo.${_raveover}.zip::https://github.com/jakubfoglar/raveo/releases/download/v${_raveover}/Raveo.${_raveover}.zip"
  "font-patcher-$_nfver.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v$_nfver/FontPatcher.zip"
  "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}")
noextract=("font-patcher-$_nfver.zip")
sha256sums=('9c2adf3bd7cbeb39d335bf0e70c588c9c20e404d247bff21c403340040b77dfd' 'SKIP' 'SKIP')

# Raveo ships static OTF (CFF) and one variable TTF (RaveoVF.ttf).
#   FONT_TYPE=variable|otf   default variable (asked on a TTY)
# Static OTF are converted to TrueType by fonttune (otf2ttf): under hintslight
# FreeType then autohints them instead of using the Adobe CFF engine.
# NERD_PATCH=true needs static fonts (font-patcher destroys variable axes), so
# it implies FONT_TYPE=otf. Everything else is asked by fonttune in prepare().

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
  local _api
  _api=$(sed -nE 's/^API *= *([0-9]+).*/\1/p' "$(_ft)/fonttune/__init__.py")
  if [[ "$_api" != "$_ftapi" ]]; then
    echo "Error: fonttune API is '${_api:-?}', this PKGBUILD expects $_ftapi." >&2
    echo "       Update the PKGBUILD or pin FONTTUNE_REF=tag=<last-good>." >&2
    exit 1
  fi
}

prepare() {
  _ft_local
  _check_fonttune
  if [[ -z "${NERD_PATCH:-}" && -t 0 ]]; then
    local _a
    read -r -p "[NERD_PATCH] Patch with Nerd Fonts glyphs [y/N] " _a
    [[ "$_a" =~ ^[yY] ]] && NERD_PATCH=true
  fi
  NERD_PATCH="${NERD_PATCH:-false}"
  if [[ "$NERD_PATCH" == true ]]; then
    FONT_TYPE=otf
  elif [[ -z "${FONT_TYPE:-}" && -t 0 ]]; then
    local _a
    read -r -p "[FONT_TYPE] variable or static otf (static: pixel grid possible) [V/o] " _a
    [[ "$_a" =~ ^[oO] ]] && FONT_TYPE=otf
  fi
  FONT_TYPE="${FONT_TYPE:-variable}"
  [[ "$FONT_TYPE" == static ]] && FONT_TYPE=otf
  [[ "$FONT_TYPE" == variable || "$FONT_TYPE" == otf ]] || { echo "Error: FONT_TYPE must be variable or otf" >&2; exit 1; }
  printf '%s\n%s\n' "$NERD_PATCH" "$FONT_TYPE" > "$srcdir/.opts"

  rm -rf "$srcdir/selected" "$srcdir/font-patcher"; mkdir -p "$srcdir/selected"
  if [[ "$FONT_TYPE" == variable ]]; then
    cp "$srcdir/raveo/fonts/variable/RaveoVF.ttf" "$srcdir/selected/"
  else
    cp "$srcdir/raveo/fonts/static/"*.otf "$srcdir/selected/"
  fi
  if [[ "$NERD_PATCH" == true ]]; then
    mkdir -p "$srcdir/font-patcher"
    bsdtar xf "$srcdir/font-patcher-$_nfver.zip" -C "$srcdir/font-patcher"
  fi
  python "$(_ft)/bin/fonttune" configure --defaults clean \
    --save-to "$srcdir/fonttune.toml" "$srcdir/selected/"*
}

build() {
  _check_fonttune
  local _src="$srcdir/selected"
  if [[ "$(sed -n 1p "$srcdir/.opts")" == true ]]; then
    printf "%b" "\e[1;33m==> WARNING:\e[0m Patching with Nerd Fonts glyphs, this takes a while...\n"
    rm -rf "$srcdir/patched"; mkdir -p "$srcdir/patched"
    find "$srcdir/selected" -name '*.otf' -print0 | sort -z | \
      parallel --will-cite -0 -j"$(nproc)" python "$srcdir/font-patcher/font-patcher" \
        --variable-width-glyphs -q -c {} -out "$srcdir/patched" '>/dev/null'
    compgen -G "$srcdir/patched/*.otf" >/dev/null || { echo "Error: font-patcher produced no output." >&2; exit 1; }
    parallel --will-cite -j"$(nproc)" python "$(_ft)/fonttune/steps/fix_names.py" ::: "$srcdir/patched/"*.otf
    _src="$srcdir/patched"
  fi
  python "$(_ft)/bin/fonttune" run --config "$srcdir/fonttune.toml" --in-place \
    --fonts-conf "${RAVEO_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}" \
    --features-match '^Raveo' "$_src/"*
  echo "$_src" > "$srcdir/.out"
}

package() {
  local _src; _src=$(< "$srcdir/.out")
  local _fontdir="$pkgdir/usr/share/fonts/raveo"
  local _f
  for _f in "$_src"/*.otf "$_src"/*.ttf; do
    [[ -f "$_f" ]] && install -Dm644 -t "$_fontdir" "$_f"
  done
  compgen -G "$_fontdir/*" >/dev/null || { echo "Error: no fonts installed from $_src." >&2; exit 1; }
  install -Dm644 "$srcdir/raveo/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  _ft_rev > "$pkgdir/usr/share/doc/$pkgname/FONTTUNE_REV" 2>/dev/null || true
  install -m644 "$srcdir/fonttune.toml" "$pkgdir/usr/share/doc/$pkgname/fonttune.toml"

  if grep -q '^hint = "[a-z]' "$srcdir/fonttune.toml"; then
    install -d "$pkgdir/usr/share/fontconfig/conf.avail"
    python "$(_ft)/bin/fonttune" hintconf --name "$pkgname" \
      -o "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf" "$_fontdir/"*.ttf
    chmod 644 "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf"
  fi
}
