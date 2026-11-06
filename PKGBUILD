# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-xmind-hinted
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
_xmver=1.001
_gfcommit=79b80491c6d04c1868c482af411e6e13b530b4b8
_nfver=3.5.1
pkgver="${_xmver}"
pkgrel=3
pkgdesc='Xmind (Google Fonts), a humanist sans with a wght axis and Greek/Cyrillic, tuned with fonttune (optionally static / Nerd Fonts patched)'
arch=('any')
url='https://fonts.google.com/specimen/Xmind'
license=('OFL-1.1')
makedepends=('git' 'python' 'python-fonttools' 'python-skia-pathops' 'fontforge' 'parallel' 'ttfautohint')
options=(!strip)
provides=('ttf-xmind')
conflicts=('ttf-xmind')
source=(
  "XmindVF.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/xmind/Xmind%5Bwght%5D.ttf"
  "XmindItalicVF.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/xmind/Xmind-Italic%5Bwght%5D.ttf"
  "OFL.txt::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/xmind/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "measure.py"
  "README.md"
  "FEATURES.md"
  "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('64cd402ec7bb4f9343bad5e6fe63556ee16dcd74ed94e8ccfa248eaee327c3b5'
            '2b598d050e703870183637e7fa6fe70e40fcfa6fbad96e99e688de61462f1b72'
            '1a88595220aa4de9f2dd8c471298820bd7e7c1dbc2a8eab78356790a999e58d2'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '93b62a59ba50bfbee53f1825a1be7f340806d92b33a9b5849fc728f40585766f'
            '01812d072145b454930dd9e118f6acb0dca663b5d91438efab4634b838bb5524'
            '8d83096ef134cb140fbc4059100d96d21e5821ef250ff6dd53cce44183498834'
            'SKIP')

# Xmind (the Xmind Project Authors, Google Fonts) is shipped as two one-axis variable fonts (upright and -12 degree
# oblique italic), wght 100-900: Latin, Greek and Cyrillic.
# The source is pinned to the google/fonts commit above.
#
# Upstream ships NO hinting. Tuning (ttfautohint, gasp, kerning/spacing, pixel
# grid, features baked into calt, ...) is done by fonttune, which asks in
# prepare(); every key can be preset as FONTTUNE_<KEY> (e.g. FONTTUNE_HINT=natural).
# Local testing: `FONTTUNE_DEV=true` (see _ft_local). See README.md for the
# measurements and FEATURES.md for what the font can do.
#
# Package options (environment; asked on a TTY when unset):
#
#   XM_VARIANT=variable|static   font set (default variable)
#                                variable  the variable font
#                                          (upright + italic)
#                                static    one TTF per weight, cut by `fonttune statics`
#   STATIC_WEIGHTS="100 200 300 400 500 600 700 800 900"  wght values to cut (default: all)
#   STATIC_ITALIC=true|false     also cut the italic (default true)
#   NERD_PATCH=true             patch with Nerd Fonts glyphs (default false);
#                                font-patcher drops fvar/gvar, so this forces static
#
# Examples:
#   makepkg -si                             (asks, when run from a terminal)
#   makepkg -si </dev/null                  (never asks: defaults only)
#   XM_VARIANT=static makepkg -si
#   FONTTUNE_HINT=natural makepkg -si
#   NERD_PATCH=true STATIC_WEIGHTS="400 700" makepkg -si

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

_ask() {  # _ask VAR "question" default(y|n): only on a TTY and when VAR is unset
  local _v="$1" _a
  [[ -n "${!_v:-}" ]] && return 0
  if [[ -t 0 ]]; then
    read -r -p "[$_v] $2 [$3] " _a
    _a="${_a:-$3}"
  else
    _a="$3"
  fi
  [[ "$_a" =~ ^[yYtT] ]] && printf -v "$_v" true || printf -v "$_v" false
}

prepare() {
  cd "$srcdir"
  _ft_local
  _check_fonttune
  _ask NERD_PATCH "Patch with Nerd Fonts glyphs (forces static fonts)" n
  if [[ -z "${XM_VARIANT:-}" && "$NERD_PATCH" != true && -z "${REGULAR_WGHT:-}" && -t 0 ]]; then
    read -r -p "[XM_VARIANT] variable or static (static: pixel grid possible) [variable] " XM_VARIANT
  fi
  XM_VARIANT="${XM_VARIANT:-variable}"
  case "$XM_VARIANT" in variable|static) ;;
    *) echo "Error: XM_VARIANT='$XM_VARIANT' invalid (variable|static)." >&2; exit 1 ;; esac
  if [[ "$NERD_PATCH" == true && "$XM_VARIANT" == variable ]]; then
    echo "==> Note: the variable font cannot be Nerd-patched; using XM_VARIANT=static."
    XM_VARIANT=static
  fi
  STATIC_WEIGHTS="${STATIC_WEIGHTS:-100 200 300 400 500 600 700 800 900}"
  STATIC_ITALIC="${STATIC_ITALIC:-true}"
  case "$STATIC_ITALIC" in true|false) ;;
    *) echo "Error: STATIC_ITALIC must be true or false." >&2; exit 1 ;; esac

  rm -rf "$srcdir/selected" "$srcdir/font-patcher"; mkdir -p "$srcdir/selected"
  if [[ "$XM_VARIANT" == variable ]]; then
    install -m644 "$srcdir/XmindVF.ttf" "$srcdir/selected/XmindVariable.ttf"
    install -m644 "$srcdir/XmindItalicVF.ttf" "$srcdir/selected/XmindItalicVariable.ttf"
  else
    local -a _st=(--family "Xmind" --weights "$STATIC_WEIGHTS")
    echo "==> Cutting static instances..."
    python "$(_ft)/bin/fonttune" statics -o "$srcdir/selected" "${_st[@]}" "$srcdir/XmindVF.ttf"
    if [[ "$STATIC_ITALIC" == true ]]; then
      python "$(_ft)/bin/fonttune" statics -o "$srcdir/selected" "${_st[@]}" "$srcdir/XmindItalicVF.ttf"
    fi
  fi
  compgen -G "$srcdir/selected/*.ttf" >/dev/null || { echo "Error: no fonts produced." >&2; exit 1; }
  printf '%s\n%s\n' "$NERD_PATCH" "$XM_VARIANT" > "$srcdir/.opts"
  if [[ "$NERD_PATCH" == true ]]; then
    mkdir -p "$srcdir/font-patcher"
    bsdtar xf "$srcdir/font-patcher-${_nfver}.zip" -C "$srcdir/font-patcher"
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
    find "$srcdir/selected" -type f | sort | \
      parallel --will-cite -j"$(nproc)" python "$srcdir/font-patcher/font-patcher" \
        --variable-width-glyphs -q -c {} -out "$srcdir/patched" '>/dev/null'
    compgen -G "$srcdir/patched/*" >/dev/null || { echo "Error: font-patcher produced no output." >&2; exit 1; }
    parallel --will-cite -j"$(nproc)" python "$(_ft)/fonttune/steps/fix_names.py" ::: "$srcdir/patched/"*
    _src="$srcdir/patched"
  fi
  python "$(_ft)/bin/fonttune" run --config "$srcdir/fonttune.toml" --in-place \
    --fonts-conf "${XM_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}" \
    --features-match '^Xmind' "$_src/"*
  echo "$_src" > "$srcdir/.out"
}

package() {
  local _src; _src=$(< "$srcdir/.out")
  local _fontdir="$pkgdir/usr/share/fonts/xmind"
  install -Dm644 -t "$_fontdir" "$_src/"*.ttf
  install -Dm644 "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/README.md" "$srcdir/FEATURES.md"
  _ft_rev > "$pkgdir/usr/share/doc/$pkgname/FONTTUNE_REV" 2>/dev/null || true
  install -m644 "$srcdir/fonttune.toml" "$pkgdir/usr/share/doc/$pkgname/fonttune.toml"

  if grep -q '^hint = "[a-z]' "$srcdir/fonttune.toml"; then
    install -d "$pkgdir/usr/share/fontconfig/conf.avail"
    python "$(_ft)/bin/fonttune" hintconf --name "$pkgname" \
      -o "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf" "$_fontdir/"*.ttf
    chmod 644 "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf"
  fi
}
