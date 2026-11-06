# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-didact-gothic-hinted
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
_gmver=2.101
_gfcommit=c741144416d5635d5de832dff8ba09292c112036
_nfver=3.5.1
pkgver="${_gmver}"
pkgrel=2
pkgdesc='Didact Gothic (Google Fonts), a single-weight geometric sans with Greek (incl. polytonic) and Cyrillic, tuned with fonttune, optionally Nerd Fonts patched'
arch=('any')
url='https://fonts.google.com/specimen/Didact+Gothic'
license=('OFL-1.1')
makedepends=('git' 'python' 'python-fonttools' 'fontforge' 'ttfautohint')
options=(!strip)
provides=('ttf-didact-gothic')
conflicts=('ttf-didact-gothic')
source=(
  "DidactGothic-Regular.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/didactgothic/DidactGothic-Regular.ttf"
  "OFL.txt::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/didactgothic/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}"
  "README.md"
  "FEATURES.md"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('b98f9e091b6337a86f4e0f69c94c31905e1e287782853f472e176b4e28d3f81f'
            '36e2f1debc9778bac79fac1a0cb5a5ef51c102f00b58ef7d8a05324144b68166'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            'SKIP'
            '1de31dc6b0d3f5d8c81754cfa0852b1e54137ef13fb2497ebecec00b16c98f2c'
            '0c913d31f504a3d28c2749411f03cbdba9f17b6b1181bacbcef1f2928e8479f7')

# Didact Gothic (Daniel Johnson, Cyreal; Google Fonts) is a single-weight
# (Regular) geometric sans with Latin, Greek (monotonic and polytonic) and
# Cyrillic. The source is pinned to the google/fonts commit above.
#
# Upstream already ships ttfautohint-style bytecode and re-hinting measured the
# same (README.md section 3), so the tuning questions default to leaving the
# font alone. A Nerd Fonts patch drops the bytecode: hint again afterwards.
#
# All tuning (features baked into calt, gasp, hinting, ...) is done by
# fonttune (https://github.com/gaou-piou/fonttune), which asks its questions in
# prepare() and prints advice for your desktop/browser before it starts.
# Every key can be preset: FONTTUNE_<KEY>=value (see `fonttune steps`).
# Local testing: `FONTTUNE_DEV=true` (see _ft_local).
#
#   NERD_PATCH=true   patch with Nerd Fonts glyphs (default false; asked on a TTY)

prepare() {
  _ft_local
  _check_fonttune
  mkdir -p "$srcdir/selected"
  install -m644 "$srcdir/DidactGothic-Regular.ttf" "$srcdir/selected/"
  if [[ -z "${NERD_PATCH:-}" && -t 0 ]]; then
    local _a
    read -r -p "[NERD_PATCH] Patch with Nerd Fonts glyphs [y/N] " _a
    [[ "$_a" =~ ^[yY] ]] && NERD_PATCH=true
  fi
  echo "${NERD_PATCH:-false}" > "$srcdir/.nerd"
  rm -rf "$srcdir/font-patcher"
  if [[ "$(< "$srcdir/.nerd")" == true ]]; then
    mkdir -p "$srcdir/font-patcher"
    bsdtar xf "$srcdir/font-patcher-${_nfver}.zip" -C "$srcdir/font-patcher"
  fi
  python "$(_ft)/bin/fonttune" configure --defaults clean \
    --save-to "$srcdir/fonttune.toml" "$srcdir/selected/"*
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
  local _api
  _api=$(sed -nE 's/^API *= *([0-9]+).*/\1/p' "$(_ft)/fonttune/__init__.py")
  if [[ "$_api" != "$_ftapi" ]]; then
    echo "Error: fonttune API is '${_api:-?}', this PKGBUILD expects $_ftapi." >&2
    echo "       Update the PKGBUILD for the new fonttune, or pin FONTTUNE_REF=tag=<last-good>." >&2
    exit 1
  fi
}

build() {
  _check_fonttune
  local _src="$srcdir/selected"
  if [[ "$(< "$srcdir/.nerd")" == true ]]; then
    echo "==> Patching with Nerd Fonts glyphs (this takes a while)..."
    rm -rf "$srcdir/patched"; mkdir -p "$srcdir/patched"
    python "$srcdir/font-patcher/font-patcher" --variable-width-glyphs -q -c \
      "$srcdir/selected/DidactGothic-Regular.ttf" -out "$srcdir/patched" >/dev/null
    compgen -G "$srcdir/patched/*.ttf" >/dev/null || { echo "Error: font-patcher produced no output." >&2; exit 1; }
    python "$(_ft)/fonttune/steps/fix_names.py" "$srcdir/patched/"*.ttf
    _src="$srcdir/patched"
  fi
  python "$(_ft)/bin/fonttune" run --config "$srcdir/fonttune.toml" --in-place \
    --fonts-conf "${DG_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}" \
    --features-match '^Didact Gothic' "$_src/"*.ttf
  echo "$_src" > "$srcdir/.out"
}

package() {
  local _src; _src=$(< "$srcdir/.out")
  local _fontdir="$pkgdir/usr/share/fonts/didact-gothic"
  install -Dm644 -t "$_fontdir" "$_src/"*.ttf
  install -Dm644 "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  _ft_rev > "$pkgdir/usr/share/doc/$pkgname/FONTTUNE_REV" 2>/dev/null || true
  install -m644 "$srcdir/fonttune.toml" "$pkgdir/usr/share/doc/$pkgname/fonttune.toml"
  install -m644 "$srcdir/README.md" "$srcdir/FEATURES.md" "$pkgdir/usr/share/doc/$pkgname/"

  # Opt-in fontconfig snippet when the fonts carry ttfautohint bytecode.
  if grep -q '^hint = "[a-z]' "$srcdir/fonttune.toml"; then
    install -d "$pkgdir/usr/share/fontconfig/conf.avail"
    python "$(_ft)/bin/fonttune" hintconf --name "$pkgname" \
      -o "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf" "$_fontdir/"*.ttf
    chmod 644 "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf"
  fi
}
