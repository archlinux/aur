# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-inter-hinted
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
_interver=4.1
_nfver=3.5.1
pkgver="${_interver}"
pkgrel=8
pkgdesc='Inter, a typeface designed for UI legibility, tuned with fonttune (optionally Nerd Fonts patched)'
arch=('any')
url='https://rsms.me/inter/'
license=('OFL-1.1')
makedepends=('git' 'python' 'python-fonttools' 'python-skia-pathops' 'fontforge' 'parallel' 'ttfautohint')
options=(!strip)
provides=('inter-font')
conflicts=('inter-font' 'interui-ttf-hinted')
replaces=('interui-ttf-hinted')
source=(
  "Inter-${_interver}.zip::https://github.com/rsms/inter/releases/download/v${_interver}/Inter-${_interver}.zip"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "LICENSE-${_interver}.txt::https://raw.githubusercontent.com/rsms/inter/v${_interver}/LICENSE.txt"
  "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            '262481e844521b326f5ecd053e59b98c8b2da78c8ee1bdbb6e8174305e54935a'
            'SKIP')

# Inter (Rasmus Andersson) from the upstream release zip. Tuning (hinting,
# gasp, features baked into calt, ...) is done by fonttune, which asks in
# prepare(); every key can be preset as FONTTUNE_<KEY>. Local testing:
# `fonttune dev on` (see _ft_local).
#
#   INTER_VARIANT=ttf|otf|variable  font set (default ttf; asked on a TTY)
#                                   otf is converted to TrueType by fonttune
#                                   (otf2ttf); variable is not Nerd-patchable
#   WANT_INTER=true|false           "Inter"          (default true)
#   WANT_DISPLAY=true|false         "Inter Display"  (default false)
#   NERD_PATCH=true                 patch with Nerd Fonts glyphs (default false)
#
# rsms ships the static TTFs hinted (ttfautohint, stem mode qqq); the point of
# the `hint` step is the stem mode (see fonttune's README). The old CFF
# hinting engine (HINT_ENGINE=cff, otfautohint/FontForge) is gone: converting
# to TrueType is what helps under hintslight.

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
  _ask NERD_PATCH "Patch with Nerd Fonts glyphs" n
  if [[ -z "${INTER_VARIANT:-}" && -t 0 && "$NERD_PATCH" != true ]]; then
    read -r -p "[INTER_VARIANT] ttf, otf or variable [ttf] " INTER_VARIANT
  fi
  INTER_VARIANT="${INTER_VARIANT:-ttf}"
  case "$INTER_VARIANT" in ttf|otf|variable) ;;
    *) echo "Error: INTER_VARIANT='$INTER_VARIANT' invalid (ttf|otf|variable)." >&2; exit 1 ;; esac
  if [[ "$NERD_PATCH" == true && "$INTER_VARIANT" == variable ]]; then
    echo "==> Note: variable fonts cannot be Nerd-patched; using INTER_VARIANT=ttf."
    INTER_VARIANT=ttf
  fi
  rm -rf "$srcdir/selected" "$srcdir/font-patcher"; mkdir -p "$srcdir/selected"
  if [[ "$INTER_VARIANT" == variable ]]; then
    cp "$srcdir"/InterVariable*.ttf "$srcdir/selected/"
  else
    _ask WANT_INTER "Include Inter" y
    _ask WANT_DISPLAY "Include Inter Display" n
    if [[ "$WANT_INTER$WANT_DISPLAY" != *true* ]]; then
      echo "Error: select at least one of WANT_INTER / WANT_DISPLAY." >&2; exit 1
    fi
    # Inter-4.1.zip: extras/ttf/{Inter,InterDisplay}-*.ttf, extras/otf/*.otf
    if [[ "$WANT_INTER" == true ]]; then
      find "$srcdir/extras/$INTER_VARIANT" -maxdepth 1 -name "Inter-*.$INTER_VARIANT" -exec cp {} "$srcdir/selected/" \;
    fi
    if [[ "$WANT_DISPLAY" == true ]]; then
      find "$srcdir/extras/$INTER_VARIANT" -maxdepth 1 -name "InterDisplay-*.$INTER_VARIANT" -exec cp {} "$srcdir/selected/" \;
    fi
  fi
  compgen -G "$srcdir/selected/*" >/dev/null || { echo "Error: no fonts matched. Has the zip layout changed?" >&2; exit 1; }
  printf '%s\n%s\n' "$NERD_PATCH" "$INTER_VARIANT" > "$srcdir/.opts"
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
    --fonts-conf "${INTER_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}" \
    --features-match '^Inter' "$_src/"*
  echo "$_src" > "$srcdir/.out"
}

package() {
  local _src; _src=$(< "$srcdir/.out")
  local _fontdir="$pkgdir/usr/share/fonts/inter"
  install -Dm644 -t "$_fontdir" "$_src/"*.[ot]tf
  install -Dm644 "$srcdir/LICENSE-${_interver}.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
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
