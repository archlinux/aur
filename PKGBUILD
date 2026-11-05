# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-commissioner-hinted
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
_commver=1.012
_nfver=3.5.1
pkgver="${_commver}"
pkgrel=6
pkgdesc='Commissioner, a low-contrast humanist sans with Flare/Volume/Weight axes and a separate italic, tuned with fonttune (optionally static / Nerd Fonts patched)'
arch=('any')
url='https://github.com/kosbarts/Commissioner'
license=('OFL-1.1')
makedepends=('git' 'python' 'python-fonttools' 'python-skia-pathops' 'fontforge' 'parallel' 'ttfautohint' 'libarchive')
options=(!strip)
provides=('ttf-commissioner')
conflicts=('ttf-commissioner' 'ttf-commissioner-variable' 'otf-commissioner')
source=(
  "Commissioner-Roman.ttf::https://raw.githubusercontent.com/kosbarts/Commissioner/${_commver}/fonts/variable/Commissioner%5BFLAR%2CVOLM%2Cwght%5D.ttf"
  "Commissioner-Italic.ttf::https://raw.githubusercontent.com/kosbarts/Commissioner/${_commver}/fonts/variable/Commissioner-Italic%5BFLAR%2CVOLM%2Cwght%5D.ttf"
  "OFL.txt::https://raw.githubusercontent.com/kosbarts/Commissioner/${_commver}/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "79-commissioner-families.conf"
  "measure.py"
  "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('63ce7044195585bc41476193be7be0312e07ec6685921eb141c6eabfb0aee3b6'
            'f14e729502d1bcb7873830791d1de58c366d403846eb680a4a1e1e293d6953f6'
            '4a7d88c77b4bc39ff84f2e058ba8f015636c50ce33588a86d9da97defe519933'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            'f09f7f4a7dbcc2b18c1bafeae56c5611d995066f0b1cbcfe84bb9890edc66d4f'
            '373d859f527adcf80933f9741af0595e708f591bdde5f2f01896aebd7d488750'
            'SKIP')

# Commissioner (Kostas Bartsokas) ships as two variable fonts, roman and italic
# (FLAR, VOLM, wght). Its three "voices" are axis settings: the default,
# Flare (FLAR 100) and Loud (FLAR 100 + VOLM 100). Upstream's variable fonts
# are unhinted. Tuning (hinting, gasp, features baked into calt, ...) is done
# by fonttune, which asks in prepare(); every key can be preset as
# FONTTUNE_<KEY>. Local testing: `fonttune dev on` (see _ft_local).
# See README.md for what each tuning choice does to this family.
#
#   COMM_VARIANT=variable|static  default variable (asked on a TTY)
#                  variable  the roman and the italic variable font
#                  static    one TTF per weight, cut by `fonttune statics`
#                            and hinted on its own
#   STATIC_WEIGHTS="100 ... 900"  weights to cut (default: all nine)
#   STATIC_ITALIC=true|false      also cut the italic (default true)
#   STATIC_VOICES="default flare loud"  voices to cut (default "default"):
#                  default  FLAR 0,   VOLM 0    family "Commissioner"
#                  flare    FLAR 100, VOLM 0    family "Commissioner Flare"
#                  loud     FLAR 100, VOLM 100  family "Commissioner Loud"
#   NERD_PATCH=true               patch with Nerd Fonts glyphs (default false);
#                                 font-patcher drops variable axes, so this
#                                 implies COMM_VARIANT=static
#
# The variable build also ships 79-commissioner-families.conf (not enabled),
# which gives the voices family names.

# Local fonttune, uncommitted edits included: `/path/to/fonttune/bin/fonttune dev on`
# (once; `dev off` undoes it) or FONTTUNE_DEV=/path/to/fonttune for one build
# (FONTTUNE_DEV=off ignores the saved one). The tree is copied to
# $srcdir/fonttune-local; the git source and .SRCINFO stay as they are.
_ft() { if [[ -d "$srcdir/fonttune-local" ]]; then echo "$srcdir/fonttune-local"; else echo "$srcdir/fonttune"; fi; }

_ft_local() {  # in prepare(): pick the local tree, if one is set
  local _dev=${FONTTUNE_DEV-} _cf=${XDG_CONFIG_HOME:-$HOME/.config}/fonttune/dev
  if [[ -z ${FONTTUNE_DEV+x} && -r "$_cf" ]]; then _dev=$(<"$_cf"); fi
  rm -rf "$srcdir/fonttune-local"
  if [[ -z "$_dev" || "$_dev" == off ]]; then return 0; fi
  if [[ ! -f "$_dev/fonttune/__init__.py" ]]; then
    echo "Error: local fonttune '$_dev' (FONTTUNE_DEV or $_cf) is not a fonttune tree." >&2
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
  _ask NERD_PATCH "Patch with Nerd Fonts glyphs (implies static fonts)" n
  if [[ -z "${COMM_VARIANT:-}" && -t 0 && "$NERD_PATCH" != true ]]; then
    read -r -p "[COMM_VARIANT] variable or static [variable] " COMM_VARIANT
  fi
  COMM_VARIANT="${COMM_VARIANT:-variable}"
  case "$COMM_VARIANT" in variable|static) ;;
    *) echo "Error: COMM_VARIANT='$COMM_VARIANT' invalid (variable|static)." >&2; exit 1 ;; esac
  if [[ "$NERD_PATCH" == true && "$COMM_VARIANT" == variable ]]; then
    echo "==> Note: variable fonts cannot be Nerd-patched; using COMM_VARIANT=static."
    COMM_VARIANT=static
  fi
  rm -rf "$srcdir/selected" "$srcdir/font-patcher"; mkdir -p "$srcdir/selected"
  if [[ "$COMM_VARIANT" == variable ]]; then
    cp "$srcdir/Commissioner-Roman.ttf" "$srcdir/Commissioner-Italic.ttf" "$srcdir/selected/"
  else
    _ask STATIC_ITALIC "Also cut the italic" y
    local _weights="${STATIC_WEIGHTS:-100 200 300 400 500 600 700 800 900}"
    local _voices="${STATIC_VOICES:-default}"
    local _voice _src
    local -a _args _srcs=("$srcdir/Commissioner-Roman.ttf")
    [[ "$STATIC_ITALIC" == true ]] && _srcs+=("$srcdir/Commissioner-Italic.ttf")
    for _voice in $_voices; do
      case "$_voice" in
        default) _args=(--axis FLAR=0   --axis VOLM=0) ;;
        flare)   _args=(--axis FLAR=100 --axis VOLM=0   --suffix Flare) ;;
        loud)    _args=(--axis FLAR=100 --axis VOLM=100 --suffix Loud) ;;
        *) echo "Error: STATIC_VOICES: '$_voice' is not default, flare or loud." >&2; exit 1 ;;
      esac
      echo "==> Cutting static instances (voice $_voice, weights: $_weights)..."
      python "$(_ft)/bin/fonttune" statics -o "$srcdir/selected" --family Commissioner \
        "${_args[@]}" --weights "$_weights" "${_srcs[@]}"
    done
  fi
  compgen -G "$srcdir/selected/*" >/dev/null || { echo "Error: no fonts produced." >&2; exit 1; }
  printf '%s\n%s\n' "$NERD_PATCH" "$COMM_VARIANT" > "$srcdir/.opts"
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
    --fonts-conf "${COMM_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}" \
    --features-match '^Commissioner' "$_src/"*
  echo "$_src" > "$srcdir/.out"
}

package() {
  local _src; _src=$(< "$srcdir/.out")
  local _fontdir="$pkgdir/usr/share/fonts/commissioner"
  install -Dm644 -t "$_fontdir" "$_src/"*.ttf
  install -Dm644 "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  _ft_rev > "$pkgdir/usr/share/doc/$pkgname/FONTTUNE_REV" 2>/dev/null || true
  install -m644 "$srcdir/fonttune.toml" "$pkgdir/usr/share/doc/$pkgname/fonttune.toml"

  # Family names for the FLAR/VOLM voices: variable build only (statics have
  # no axes; with STATIC_VOICES="default flare loud" they are real families).
  if [[ "$(sed -n 2p "$srcdir/.opts")" == variable ]]; then
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$srcdir/79-commissioner-families.conf"
  fi

  if grep -q '^hint = "[a-z]' "$srcdir/fonttune.toml"; then
    install -d "$pkgdir/usr/share/fontconfig/conf.avail"
    python "$(_ft)/bin/fonttune" hintconf --name "$pkgname" \
      -o "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf" "$_fontdir/"*.ttf
    chmod 644 "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf"
  fi
}
