# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-geologica-hinted
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
_geover=1.010
_geocommit=685f38d7c9e86b0c8530204c97ddcaf6558dd17b
_nfver=3.5.1
pkgver="${_geover}"
pkgrel=9
pkgdesc='Geologica, a humanist-geometric sans with Sharp/Cursive/Slant/Weight axes, tuned with fonttune (optionally static / Nerd Fonts patched)'
arch=('any')
url='https://github.com/googlefonts/geologica'
license=('OFL-1.1')
makedepends=('git' 'python' 'python-fonttools' 'python-skia-pathops' 'fontforge' 'parallel' 'ttfautohint' 'libarchive')
options=(!strip)
provides=('ttf-geologica')
conflicts=('ttf-geologica')
source=(
  "GeologicaVariable.ttf::https://raw.githubusercontent.com/googlefonts/geologica/${_geocommit}/fonts/variable/Geologica%5BCRSV%2CSHRP%2Cslnt%2Cwght%5D.ttf"
  "OFL.txt::https://raw.githubusercontent.com/googlefonts/geologica/${_geocommit}/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "make_ui.py"
  "measure.py"
  "79-geologica-families.conf"
  "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('9124d9e88ac6c11d761f35241713a51d68e2c4ebedce0edaca834717a00959ec'
            '778186245840aea0e60bec6a46e7fb1442e0cd78e41afeadffcd3e8824b379e0'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '5844c645e7d4f9a445be4ec9c049d2b84fa450efbf0179b47add06533561c478'
            'cfc6aa1b72cd6649d102a0a97ad1be0fcfc12476fc75a9d8251b6afd2a724fe1'
            '26ca6fb7ec518025486ea28a059f7e6f37d2f6a10d0f7caaea3437323bc3a664'
            'SKIP')

# Geologica (Monokrom, 2023) ships as ONE variable font with four axes:
# wght 100-900 (default 100!), SHRP 0-100 (sharpness), CRSV 0-1 (cursive
# a/g), slnt 0..-12 (oblique). Upstream is archived and has no releases: the
# source is pinned to the commit Google Fonts took it from. It is unhinted.
# Tuning (hinting, gasp, features baked into calt, ...) is done by fonttune,
# which asks in prepare(); every key can be preset as FONTTUNE_<KEY>.
# Local testing: FONTTUNE_REPO=file:///path/to/fonttune. See README.md for what
# each tuning choice does to this family (its default master is Thin, which
# matters for the variable font's bytecode).
#
#   GEO_VARIANT=variable|static  default variable (asked on a TTY)
#                  variable  the single 4-axis font
#                  static    one TTF per weight, cut by `fonttune statics`
#                            and hinted on its own
#   STATIC_WEIGHTS="100 ... 900"  weights to cut (default: all nine)
#   STATIC_ITALIC=true|false      also cut the italic (CRSV=1, slnt=-12),
#                                 default true
#   STATIC_SHRP=0|100             normal or Sharp (SHRP=100) design; Sharp
#                                 statics become the family "Geologica Sharp"
#   GEO_UI_WEIGHT=none|100|200|300  (variable only, default none) also install
#                  "Geologica UI": a copy whose Regular draws this weight (an
#                  avar table shifts the wght scale, see make_ui.py and README
#                  section 1.4), for a light GTK desktop font
#   GEO_UI_FEATURES=ss01          GSUB features "Geologica UI" applies by
#                  default (cursive a/g), baked into its calt by make_ui.py
#   NERD_PATCH=true               patch with Nerd Fonts glyphs (default false);
#                                 implies GEO_VARIANT=static
#
# The variable build also ships 79-geologica-families.conf (not enabled),
# which names the Sharp/Cursive variants.

_check_fonttune() {
  local _api
  _api=$(sed -nE 's/^API *= *([0-9]+).*/\1/p' "$srcdir/fonttune/fonttune/__init__.py")
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
  _check_fonttune
  _ask NERD_PATCH "Patch with Nerd Fonts glyphs (implies static fonts)" n
  if [[ -z "${GEO_VARIANT:-}" && -t 0 && "$NERD_PATCH" != true ]]; then
    read -r -p "[GEO_VARIANT] variable or static [variable] " GEO_VARIANT
  fi
  GEO_VARIANT="${GEO_VARIANT:-variable}"
  case "$GEO_VARIANT" in variable|static) ;;
    *) echo "Error: GEO_VARIANT='$GEO_VARIANT' invalid (variable|static)." >&2; exit 1 ;; esac
  if [[ "$NERD_PATCH" == true && "$GEO_VARIANT" == variable ]]; then
    echo "==> Note: variable fonts cannot be Nerd-patched; using GEO_VARIANT=static."
    GEO_VARIANT=static
  fi
  rm -rf "$srcdir/selected" "$srcdir/font-patcher"; mkdir -p "$srcdir/selected"
  GEO_UI_WEIGHT="${GEO_UI_WEIGHT:-}"
  if [[ "$GEO_VARIANT" == variable ]]; then
    if [[ -z "$GEO_UI_WEIGHT" && -t 0 ]]; then
      read -r -p '[GEO_UI_WEIGHT] also install "Geologica UI" with Regular drawn at none|100|200|300 [none] ' GEO_UI_WEIGHT
    fi
    GEO_UI_WEIGHT="${GEO_UI_WEIGHT:-none}"
    case "$GEO_UI_WEIGHT" in none|100|200|300) ;;
      *) echo "Error: GEO_UI_WEIGHT='$GEO_UI_WEIGHT' invalid (none|100|200|300)." >&2; exit 1 ;; esac
    cp "$srcdir/GeologicaVariable.ttf" "$srcdir/selected/"
    if [[ "$GEO_UI_WEIGHT" != none ]]; then
      echo "==> Deriving Geologica UI..."
      # kept from the old package: fonttune statics has no avar/weight-remap step
      python "$srcdir/make_ui.py" --regular "$GEO_UI_WEIGHT" --features "${GEO_UI_FEATURES:-}" \
        -o "$srcdir/selected/GeologicaUIVariable.ttf" "$srcdir/GeologicaVariable.ttf"
    fi
  else
    [[ "$GEO_UI_WEIGHT" =~ ^(|none)$ ]] || echo "==> Note: GEO_UI_WEIGHT only applies to the variable build; ignored."
    _ask STATIC_ITALIC "Also cut the italic (CRSV=1, slnt=-12)" y
    local _weights="${STATIC_WEIGHTS:-100 200 300 400 500 600 700 800 900}"
    local _shrp="${STATIC_SHRP:-0}"
    local -a _sfx=()
    case "$_shrp" in
      0) ;;
      100) _sfx=(--suffix Sharp) ;;
      *) echo "Error: STATIC_SHRP='$_shrp' invalid (0|100)." >&2; exit 1 ;;
    esac
    echo "==> Cutting static instances (SHRP $_shrp, weights: $_weights)..."
    python "$srcdir/fonttune/bin/fonttune" statics -o "$srcdir/selected" --family Geologica \
      --axis SHRP="$_shrp" --axis CRSV=0 --axis slnt=0 "${_sfx[@]}" \
      --weights "$_weights" "$srcdir/GeologicaVariable.ttf"
    if [[ "$STATIC_ITALIC" == true ]]; then
      python "$srcdir/fonttune/bin/fonttune" statics -o "$srcdir/selected" --family Geologica \
        --axis SHRP="$_shrp" --axis CRSV=1 --axis slnt=-12 "${_sfx[@]}" \
        --weights "$_weights" "$srcdir/GeologicaVariable.ttf"
    fi
  fi
  compgen -G "$srcdir/selected/*" >/dev/null || { echo "Error: no fonts produced." >&2; exit 1; }
  printf '%s\n%s\n' "$NERD_PATCH" "$GEO_VARIANT" > "$srcdir/.opts"
  if [[ "$NERD_PATCH" == true ]]; then
    mkdir -p "$srcdir/font-patcher"
    bsdtar xf "$srcdir/font-patcher-${_nfver}.zip" -C "$srcdir/font-patcher"
  fi
  python "$srcdir/fonttune/bin/fonttune" configure --defaults clean \
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
    parallel --will-cite -j"$(nproc)" python "$srcdir/fonttune/fonttune/steps/fix_names.py" ::: "$srcdir/patched/"*
    _src="$srcdir/patched"
  fi
  python "$srcdir/fonttune/bin/fonttune" run --config "$srcdir/fonttune.toml" --in-place \
    --fonts-conf "${GEO_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}" \
    --features-match '^Geologica' "$_src/"*
  echo "$_src" > "$srcdir/.out"
}

package() {
  local _src; _src=$(< "$srcdir/.out")
  local _fontdir="$pkgdir/usr/share/fonts/geologica"
  install -Dm644 -t "$_fontdir" "$_src/"*.ttf
  install -Dm644 "$srcdir/OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  git -C "$srcdir/fonttune" describe --always --dirty > "$pkgdir/usr/share/doc/$pkgname/FONTTUNE_REV" 2>/dev/null || true
  install -m644 "$srcdir/fonttune.toml" "$pkgdir/usr/share/doc/$pkgname/fonttune.toml"

  # Family names for the SHRP/CRSV axes: variable build only (statics have no
  # axes; with STATIC_SHRP=100 they are already "Geologica Sharp").
  if [[ "$(sed -n 2p "$srcdir/.opts")" == variable ]]; then
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$srcdir/79-geologica-families.conf"
  fi

  if grep -q '^hint = "[a-z]' "$srcdir/fonttune.toml"; then
    install -d "$pkgdir/usr/share/fontconfig/conf.avail"
    python "$srcdir/fonttune/bin/fonttune" hintconf --name "$pkgname" \
      -o "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf" "$_fontdir/"*.ttf
    chmod 644 "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf"
  fi
}
