# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-roboto-flex-hinted
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
_flexver=3.200
_nfver=3.5.1
pkgver="${_flexver}"
pkgrel=8
pkgdesc='Roboto Flex, the 13-axis variable Roboto, tuned with fonttune, with working italics and fontconfig axis presets (optionally static / Nerd Fonts patched)'
arch=('any')
url='https://github.com/googlefonts/roboto-flex'
license=('OFL-1.1')
makedepends=('git' 'python' 'python-fonttools' 'python-skia-pathops' 'fontforge' 'parallel' 'ttfautohint' 'libarchive')
options=(!strip)
provides=('ttf-roboto-flex')
conflicts=('ttf-roboto-flex')
source=(
  "roboto-flex-fonts-${_flexver}.zip::https://github.com/googlefonts/roboto-flex/releases/download/${_flexver}/roboto-flex-fonts.zip"
  "OFL-${_flexver}.txt::https://raw.githubusercontent.com/googlefonts/roboto-flex/${_flexver}/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "measure.py"
  "79-roboto-flex-families.conf"
  "81-roboto-flex-italic.conf"
  "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('6b2b14e11308c7d3e8388b623cf740c46b872e7519198e0cff8062e52b75239b'
            '454ec26838f2b8f2e2588e759dd3742577e0d305d3359a7b81c86641fcab7d21'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '23990b43dc1c77aaee8c78fc7b9886109dac6142dd1ada9c06e3a77734223fcb'
            '7cafc2f26e6490e58987f13f2a4f25334f2b30a28f89741f1eaa5bf144e3f51c'
            '38abb99dc9daaa04f43441f3036baff81270f2636c52772fba72c7454c44e2f9'
            'SKIP')

# Roboto Flex 3.200 ships as ONE unhinted variable font with 13 axes (opsz,
# wght, GRAD, wdth, slnt and eight parametric axes). There is no italic file:
# italic is slnt=-10. Tuning (hinting, gasp, features baked into calt, ...) is
# done by fonttune, which asks in prepare(); every key can be preset as
# FONTTUNE_<KEY>. Local testing: `FONTTUNE_DEV=true` (see _ft_local).
# fonttune hints only the statics: the variable font stays unhinted, since
# hints fit its default instance and distort the others under hintfull.
# See README.md for the measurements and FEATURES.md for the axis reference.
#
#   FLEX_VARIANT=variable|static  default variable (asked on a TTY)
#                  variable  the single 13-axis font
#                  static    one TTF per weight x width x italic, cut by
#                            `fonttune statics` at a fixed opsz, hinted on its own
#   STATIC_WEIGHTS="100 ... 1000" weights to cut (default: all ten)
#   STATIC_WIDTHS="100"           wdth values: 25 50 62.5 75 87.5 100 112.5 125
#                  150 151. Non-100 widths become their own family
#                  ("Roboto Flex Condensed"). Default 100
#   STATIC_ITALIC=true|false      also cut slnt=-10 italics (default true)
#   STATIC_OPSZ=N|auto            fixed optical size 8-144 (default auto: the GNOME
#                                 interface size in points, what Pango gives the VF,
#                                 read when it builds: a clean chroot or a non-GNOME
#                                 desktop reads GNOME's default, 11; set N for a fixed
#                                 cut). The value used is in /usr/share/doc/$pkgname/STATIC_OPSZ
#   NERD_PATCH=true               patch with Nerd Fonts glyphs (default false);
#                                 implies FLEX_VARIANT=static
#   ITALIC_FIX=true|false         enable 81-roboto-flex-italic.conf by default
#                  through conf.default (variable only, default true): pango
#                  resets slnt to 0 on a variable font, so without it "Roboto
#                  Flex Italic" renders upright. false still ships it in conf.avail
#
# The variable build also ships 79-roboto-flex-families.conf (not enabled).

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
  if [[ -z "${FLEX_VARIANT:-}" && -t 0 && "$NERD_PATCH" != true ]]; then
    read -r -p "[FLEX_VARIANT] variable or static (static: pixel grid possible) [variable] " FLEX_VARIANT
  fi
  FLEX_VARIANT="${FLEX_VARIANT:-variable}"
  case "$FLEX_VARIANT" in variable|static) ;;
    *) echo "Error: FLEX_VARIANT='$FLEX_VARIANT' invalid (variable|static)." >&2; exit 1 ;; esac
  if [[ "$NERD_PATCH" == true && "$FLEX_VARIANT" == variable ]]; then
    echo "==> Note: variable fonts cannot be Nerd-patched; using FLEX_VARIANT=static."
    FLEX_VARIANT=static
  fi
  rm -rf "$srcdir/selected" "$srcdir/font-patcher"; mkdir -p "$srcdir/selected"
  local _opsz=          # static only: the optical size cut, recorded in the package
  # roboto-flex-fonts.zip: roboto-flex-fonts/fonts/variable/RobotoFlex[GRAD,XOPQ,...,wght].ttf
  local _vf
  _vf=$(find "$srcdir/roboto-flex-fonts/fonts/variable" -maxdepth 1 -name 'RobotoFlex*.ttf' | head -n1)
  [[ -n "$_vf" ]] || { echo "Error: variable font not found in the zip. Has the layout changed?" >&2; exit 1; }
  if [[ "$FLEX_VARIANT" == variable ]]; then
    # A plain filename: brackets in file names upset some tools and globs.
    cp "$_vf" "$srcdir/selected/RobotoFlex-Variable.ttf"
  else
    local _weights="${STATIC_WEIGHTS:-100 200 300 400 500 600 700 800 900 1000}"
    local _widths="${STATIC_WIDTHS:-100}"
    _opsz="${STATIC_OPSZ:-auto}"
    if [[ "${_opsz,,}" == auto ]]; then
      _opsz=$(PYTHONPATH="$(_ft)" python -c 'from fonttune.system import font_pt; print(f"{font_pt():g}")') ||
        { echo "Error: this fonttune cannot resolve STATIC_OPSZ=auto; update it or set STATIC_OPSZ=N." >&2; exit 1; }
      echo "==> STATIC_OPSZ auto: $_opsz pt (this machine's GNOME interface font size)"
    fi
    _ask STATIC_ITALIC "Also cut the italic (slnt=-10)" y
    local _d _name
    local -a _sfx
    for _d in $_widths; do
      case "$_d" in
        25) _name=SuperCondensed ;;  50) _name=UltraCondensed ;;  62.5) _name=ExtraCondensed ;;
        75) _name=Condensed ;;       87.5) _name=SemiCondensed ;; 100) _name= ;;
        112.5) _name=SemiExpanded ;; 125) _name=Expanded ;;       150|151) _name=ExtraExpanded ;;
        *) echo "Error: STATIC_WIDTHS: '$_d' is not 25 50 62.5 75 87.5 100 112.5 125 150 151." >&2; exit 1 ;;
      esac
      _sfx=(); [[ -n "$_name" ]] && _sfx=(--suffix "$_name")
      echo "==> Cutting static instances (wdth $_d, opsz $_opsz, weights: $_weights)..."
      python "$(_ft)/bin/fonttune" statics -o "$srcdir/selected" --family "Roboto Flex" \
        --axis wdth="$_d" --axis opsz="$_opsz" --axis slnt=0 "${_sfx[@]}" \
        --weights "$_weights" "$_vf"
      if [[ "$STATIC_ITALIC" == true ]]; then
        python "$(_ft)/bin/fonttune" statics -o "$srcdir/selected" --family "Roboto Flex" \
          --axis wdth="$_d" --axis opsz="$_opsz" --axis slnt=-10 "${_sfx[@]}" \
          --weights "$_weights" "$_vf"
      fi
    done
  fi
  compgen -G "$srcdir/selected/*" >/dev/null || { echo "Error: no fonts produced." >&2; exit 1; }
  printf '%s\n%s\n%s\n' "$NERD_PATCH" "$FLEX_VARIANT" "$_opsz" > "$srcdir/.opts"
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
    --fonts-conf "${FLEX_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}" \
    --features-match '^Roboto' "$_src/"*
  echo "$_src" > "$srcdir/.out"
}

package() {
  local _src; _src=$(< "$srcdir/.out")
  local _fontdir="$pkgdir/usr/share/fonts/roboto-flex"
  install -Dm644 -t "$_fontdir" "$_src/"*.ttf
  install -Dm644 "$srcdir/OFL-${_flexver}.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  _ft_rev > "$pkgdir/usr/share/doc/$pkgname/FONTTUNE_REV" 2>/dev/null || true
  install -m644 "$srcdir/fonttune.toml" "$pkgdir/usr/share/doc/$pkgname/fonttune.toml"
  local _opsz; _opsz=$(sed -n 3p "$srcdir/.opts")
  [[ -z "$_opsz" ]] || echo "$_opsz" > "$pkgdir/usr/share/doc/$pkgname/STATIC_OPSZ"

  # The variable font only: italics through slnt (enabled by default, see the
  # header) and the opt-in width/grade family presets.
  if [[ "$(sed -n 2p "$srcdir/.opts")" == variable ]]; then
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" \
      "$srcdir/81-roboto-flex-italic.conf" "$srcdir/79-roboto-flex-families.conf"
    if [[ "${ITALIC_FIX:-true}" == true ]]; then
      install -d "$pkgdir/usr/share/fontconfig/conf.default"
      ln -s ../conf.avail/81-roboto-flex-italic.conf \
        "$pkgdir/usr/share/fontconfig/conf.default/81-roboto-flex-italic.conf"
    fi
  fi

  # fonttune leaves variable fonts unhinted, so only statics get the snippet
  if [[ "$(sed -n 2p "$srcdir/.opts")" == static ]] && grep -q '^hint = "[a-z]' "$srcdir/fonttune.toml"; then
    install -d "$pkgdir/usr/share/fontconfig/conf.avail"
    python "$(_ft)/bin/fonttune" hintconf --name "$pkgname" \
      -o "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf" "$_fontdir/"*.ttf
    chmod 644 "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf"
  fi
}
