# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-tiktok-sans-hinted
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
_gmver=4.000
_gfcommit=2750b521bd22ce141f12617194ab0e04cf5d12d5
_nfver=3.5.1
pkgver="${_gmver}"
pkgrel=3
pkgdesc='TikTok Sans (Google Fonts), a four-axis (opsz, slnt, wdth, wght) sans with Greek and Cyrillic, tuned with fonttune (optionally static / Nerd Fonts patched)'
arch=('any')
url='https://fonts.google.com/specimen/TikTok+Sans'
license=('OFL-1.1')
makedepends=('git' 'python' 'python-fonttools' 'python-skia-pathops' 'fontforge' 'parallel' 'ttfautohint' 'libarchive')
options=(!strip)
provides=('ttf-tiktok-sans')
conflicts=('ttf-tiktok-sans')
source=(
  "TikTokSansVF.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/tiktoksans/TikTokSans%5Bopsz%2Cslnt%2Cwdth%2Cwght%5D.ttf"
  "OFL.txt::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/tiktoksans/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "measure.py"
  "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('0e7f0a3e924c9a86478fc6fc2946de2e4ab8fc704ed72ee40434ade94bb9b0c6'
            '99e743f68f5eac487004c73aaca69c5d80d91ddb7b75c04bdf5f39331d9b7158'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '3ad4eb1296ca40b68d32fe5220fe03cb0c8b0d7725b1f179d3df2176430b0ff8'
            'SKIP')

# TikTok Sans (TikTok Inc.; Grilli Type, Contrast Foundry, Type Network) is
# shipped as ONE variable font with four axes: opsz 12-36 (default 36), slnt
# -6-0 (default 0, the italic), wdth 75-150 (default 100) and wght 300-900
# (default 300). Latin (incl. Vietnamese), Cyrillic and modern monotonic Greek.
# The source is pinned to the google/fonts commit above. Unlike most Google
# fonts it ships already hinted by ttfautohint (see README.md section 3 for how
# that compares with re-hinting). Tuning (hinting, gasp, features baked into
# calt, ...) is done by fonttune, which asks in prepare(); every key can be
# preset as FONTTUNE_<KEY>. Local testing: `FONTTUNE_DEV=true` (see _ft_local).
#
#   TS_VARIANT=variable|static  default variable (asked on a TTY)
#                  variable  the four-axis font (upright + slant)
#                  static    one TTF per weight x width x italic, cut by
#                            `fonttune statics` at a fixed opsz, hinted on its own
#   STATIC_WEIGHTS="300 ... 900"  weights to cut (default: all seven)
#   STATIC_WIDTHS="100"           wdth values 75 100 125 150 (default 100). Others
#                  become their own family (Condensed, Expanded, ExtraExpanded)
#   STATIC_ITALIC=true|false      also cut slnt=-6 italics (default true)
#   STATIC_OPSZ=N|auto            fixed optical size 12-36 (default auto: the GNOME
#                                 interface size in points, what Pango gives the VF)
#   NERD_PATCH=true               patch with Nerd Fonts glyphs (default false);
#                                 implies TS_VARIANT=static

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
  _ask NERD_PATCH "Patch with Nerd Fonts glyphs (implies static fonts)" n
  if [[ -z "${TS_VARIANT:-}" && -t 0 && "$NERD_PATCH" != true ]]; then
    read -r -p "[TS_VARIANT] variable or static (static: pixel grid possible) [variable] " TS_VARIANT
  fi
  TS_VARIANT="${TS_VARIANT:-variable}"
  case "$TS_VARIANT" in variable|static) ;;
    *) echo "Error: TS_VARIANT='$TS_VARIANT' invalid (variable|static)." >&2; exit 1 ;; esac
  if [[ "$NERD_PATCH" == true && "$TS_VARIANT" == variable ]]; then
    echo "==> Note: variable fonts cannot be Nerd-patched; using TS_VARIANT=static."
    TS_VARIANT=static
  fi
  rm -rf "$srcdir/selected" "$srcdir/font-patcher"; mkdir -p "$srcdir/selected"
  local _vf="$srcdir/TikTokSansVF.ttf"
  if [[ "$TS_VARIANT" == variable ]]; then
    cp "$_vf" "$srcdir/selected/TikTokSansVariable.ttf"
  else
    local _weights="${STATIC_WEIGHTS:-300 400 500 600 700 800 900}"
    local _widths="${STATIC_WIDTHS:-100}" _opsz="${STATIC_OPSZ:-auto}"
    _ask STATIC_ITALIC "Also cut the italic (slnt=-6)" y
    local _d _name
    local -a _sfx
    for _d in $_widths; do
      case "$_d" in
        75) _name=Condensed ;;  100) _name= ;;  125) _name=Expanded ;;  150) _name=ExtraExpanded ;;
        *) echo "Error: STATIC_WIDTHS: '$_d' is not 75, 100, 125 or 150." >&2; exit 1 ;;
      esac
      _sfx=(); [[ -n "$_name" ]] && _sfx=(--suffix "$_name")
      echo "==> Cutting static instances (wdth $_d, opsz $_opsz, weights: $_weights)..."
      python "$(_ft)/bin/fonttune" statics -o "$srcdir/selected" --family "TikTok Sans" \
        --axis wdth="$_d" --axis opsz="$_opsz" --axis slnt=0 "${_sfx[@]}" \
        --weights "$_weights" "$_vf"
      if [[ "$STATIC_ITALIC" == true ]]; then
        python "$(_ft)/bin/fonttune" statics -o "$srcdir/selected" --family "TikTok Sans" \
          --axis wdth="$_d" --axis opsz="$_opsz" --axis slnt=-6 "${_sfx[@]}" \
          --weights "$_weights" "$_vf"
      fi
    done
  fi
  compgen -G "$srcdir/selected/*" >/dev/null || { echo "Error: no fonts produced." >&2; exit 1; }
  printf '%s\n%s\n' "$NERD_PATCH" "$TS_VARIANT" > "$srcdir/.opts"
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
    --fonts-conf "${TS_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}" \
    --features-match '^TikTok' "$_src/"*
  echo "$_src" > "$srcdir/.out"
}

package() {
  local _src; _src=$(< "$srcdir/.out")
  local _fontdir="$pkgdir/usr/share/fonts/tiktok-sans"
  install -Dm644 -t "$_fontdir" "$_src/"*.ttf
  install -Dm644 "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
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
