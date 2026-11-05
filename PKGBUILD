# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-geom-hinted
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
_gmver=1.102
_gfcommit=a60a77e14f28abd4ef243a1b5dfc48df0cec5205
_nfver=3.5.1
pkgver="${_gmver}"
pkgrel=3
pkgdesc='Geom (Google Fonts), a geometric sans with a wght axis and Greek, tuned with fonttune (optionally static / Nerd Fonts patched)'
arch=('any')
url='https://fonts.google.com/specimen/Geom'
license=('OFL-1.1')
makedepends=('git' 'python' 'python-fonttools' 'python-skia-pathops' 'fontforge' 'parallel' 'ttfautohint')
options=(!strip)
provides=('ttf-geom')
conflicts=('ttf-geom' 'geom-ttf-hinted')
source=(
  "GeomVF.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/geom/Geom%5Bwght%5D.ttf"
  "GeomItalicVF.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/geom/Geom-Italic%5Bwght%5D.ttf"
  "OFL.txt::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/geom/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "measure.py"
  "README.md"
  "FEATURES.md"
  "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('4509ad62e97c2e07c7fbc51180caba092b66fb2967e4de7dcba149ab3beb3b15'
            'f448d04a281a0e8198a109e1809e145ffd5567a26299c8b2b772297de17500ad'
            '614e89d16af045c1c32716f67d1e826c692cf643c549cba46b38d41d6919d77b'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '3d45aadde50db7e27a9ff33a00de44dc8bada3f5cd6b9afb2e5344dc86efae1f'
            'bd1db456d50690581606dbe66190be2d62165004b855b3b18d0fbf1721af60e4'
            '303d46f1f6ab05d9ab4c190c20f16590221e3e5407186ed311ef74623f35f6db'
            'SKIP')

# Geom (Thanos Poulakidas, Google Fonts) is a geometric sans shipped as two one-axis variable fonts (upright and
# -10 degree italic), wght 300-900: Latin and monotonic Greek, no Cyrillic.
# The source is pinned to the google/fonts commit above.
#
# Upstream ships NO hinting. Tuning (ttfautohint, gasp, kerning/spacing, pixel
# grid, features baked into calt, ...) is done by fonttune, which asks in
# prepare(); every key can be preset as FONTTUNE_<KEY> (e.g. FONTTUNE_HINT=natural).
# Local testing: `fonttune dev on` (see _ft_local). See README.md for the
# measurements and FEATURES.md for what the font can do.
#
# Package options (environment; asked on a TTY when unset):
#
#   GM_VARIANT=variable|static   font set (default variable)
#                                variable  the variable font
#                                          (upright + italic)
#                                static    one TTF per weight, cut by `fonttune statics`
#   STATIC_WEIGHTS="300 400 500 600 700 800 900"  wght values to cut (default: all)
#   STATIC_ITALIC=true|false     also cut the italic (default true)
#   NERD_PATCH=true             patch with Nerd Fonts glyphs (default false);
#                                font-patcher drops fvar/gvar, so this forces static
#
# Examples:
#   makepkg -si                             (asks, when run from a terminal)
#   makepkg -si </dev/null                  (never asks: defaults only)
#   GM_VARIANT=static makepkg -si
#   FONTTUNE_HINT=natural makepkg -si
#   NERD_PATCH=true STATIC_WEIGHTS="400 700" makepkg -si

# Local fonttune, uncommitted edits included: `/path/to/fonttune/bin/fonttune dev on`
# (once; `dev off` undoes it), or for one build FONTTUNE_DEV=true (that saved
# tree, else ../fonttune next to this PKGBUILD) or =/path/to/fonttune; =false
# ignores the saved one. The tree is copied to
# $srcdir/fonttune-local; the git source and .SRCINFO stay as they are.
_ft() { if [[ -d "$srcdir/fonttune-local" ]]; then echo "$srcdir/fonttune-local"; else echo "$srcdir/fonttune"; fi; }

_ft_local() {  # in prepare(): pick the local tree, if one is set
  # FONTTUNE_DEV: a path, true|1|yes|on (saved tree, else ../fonttune next to
  # this PKGBUILD) or false|0|no|off; unset: the saved tree, if any
  local _dev=${FONTTUNE_DEV-} _cf=${XDG_CONFIG_HOME:-$HOME/.config}/fonttune/dev
  rm -rf "$srcdir/fonttune-local"
  case "${_dev,,}" in
    false|0|no|off) return 0 ;;
    true|1|yes|on|'')
      if [[ -r "$_cf" ]]; then _dev=$(<"$_cf")
      elif [[ -n "$_dev" ]]; then _dev=$(realpath -m "$startdir/../fonttune")
      else return 0
      fi ;;
  esac
  if [[ ! -f "$_dev/fonttune/__init__.py" ]]; then
    echo "Error: local fonttune '$_dev' is not a fonttune tree. Set FONTTUNE_DEV to the" >&2
    echo "       fonttune checkout, or run 'fonttune dev on' there (saves it to $_cf)." >&2
    exit 1
  fi
  mkdir "$srcdir/fonttune-local"
  tar -C "$_dev" --exclude=.git --exclude=__pycache__ -cf - . | tar -C "$srcdir/fonttune-local" -xf -
  echo "local:$(git -C "$_dev" describe --always --dirty 2>/dev/null || echo "$_dev")" \
    > "$srcdir/fonttune-local/.rev"
  echo "==> fonttune: LOCAL tree $_dev ($(<"$srcdir/fonttune-local/.rev"))" >&2
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
  if [[ -z "${GM_VARIANT:-}" && "$NERD_PATCH" != true && -z "${REGULAR_WGHT:-}" && -t 0 ]]; then
    read -r -p "[GM_VARIANT] variable or static (static: pixel grid possible) [variable] " GM_VARIANT
  fi
  GM_VARIANT="${GM_VARIANT:-variable}"
  case "$GM_VARIANT" in variable|static) ;;
    *) echo "Error: GM_VARIANT='$GM_VARIANT' invalid (variable|static)." >&2; exit 1 ;; esac
  if [[ "$NERD_PATCH" == true && "$GM_VARIANT" == variable ]]; then
    echo "==> Note: the variable font cannot be Nerd-patched; using GM_VARIANT=static."
    GM_VARIANT=static
  fi
  STATIC_WEIGHTS="${STATIC_WEIGHTS:-300 400 500 600 700 800 900}"
  STATIC_ITALIC="${STATIC_ITALIC:-true}"
  case "$STATIC_ITALIC" in true|false) ;;
    *) echo "Error: STATIC_ITALIC must be true or false." >&2; exit 1 ;; esac

  rm -rf "$srcdir/selected" "$srcdir/font-patcher"; mkdir -p "$srcdir/selected"
  if [[ "$GM_VARIANT" == variable ]]; then
    install -m644 "$srcdir/GeomVF.ttf" "$srcdir/selected/GeomVariable.ttf"
    install -m644 "$srcdir/GeomItalicVF.ttf" "$srcdir/selected/GeomItalicVariable.ttf"
  else
    local -a _st=(--family "Geom" --weights "$STATIC_WEIGHTS")
    echo "==> Cutting static instances..."
    python "$(_ft)/bin/fonttune" statics -o "$srcdir/selected" "${_st[@]}" "$srcdir/GeomVF.ttf"
    if [[ "$STATIC_ITALIC" == true ]]; then
      python "$(_ft)/bin/fonttune" statics -o "$srcdir/selected" "${_st[@]}" "$srcdir/GeomItalicVF.ttf"
    fi
  fi
  compgen -G "$srcdir/selected/*.ttf" >/dev/null || { echo "Error: no fonts produced." >&2; exit 1; }
  printf '%s\n%s\n' "$NERD_PATCH" "$GM_VARIANT" > "$srcdir/.opts"
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
    --fonts-conf "${GM_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}" \
    --features-match '^Geom' "$_src/"*
  echo "$_src" > "$srcdir/.out"
}

package() {
  local _src; _src=$(< "$srcdir/.out")
  local _fontdir="$pkgdir/usr/share/fonts/geom"
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
