# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-zen-maru-gothic-hinted
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
_zmver=1.002
_gfcommit=92503f07b74eab956c1abf4956fbf46170716caa
_nfver=3.5.1
pkgver="${_zmver}"
pkgrel=3
pkgdesc='Zen Maru Gothic (Google Fonts), a rounded Japanese gothic with Latin/Greek/Cyrillic, tuned with fonttune (optionally Nerd Fonts patched)'
arch=('any')
url='https://fonts.google.com/specimen/Zen+Maru+Gothic'
license=('OFL-1.1')
makedepends=('git' 'python' 'python-fonttools' 'fontforge' 'ttfautohint')
options=(!strip)
provides=('ttf-zen-maru-gothic')
conflicts=('ttf-zen-maru-gothic')
source=(

  "ZenMaruGothic-Light.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/zenmarugothic/ZenMaruGothic-Light.ttf"
  "ZenMaruGothic-Regular.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/zenmarugothic/ZenMaruGothic-Regular.ttf"
  "ZenMaruGothic-Medium.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/zenmarugothic/ZenMaruGothic-Medium.ttf"
  "ZenMaruGothic-Bold.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/zenmarugothic/ZenMaruGothic-Bold.ttf"
  "ZenMaruGothic-Black.ttf::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/zenmarugothic/ZenMaruGothic-Black.ttf"
  "OFL.txt::https://raw.githubusercontent.com/google/fonts/${_gfcommit}/ofl/zenmarugothic/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "README.md"
  "FEATURES.md"
  "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}"
  "README.md"
  "FEATURES.md"
)
noextract=("font-patcher-${_nfver}.zip")
sha256sums=('c4e6fa10ff517df37cb0c13038fe2813f3c47afe6577fa4a5573200e4508b2c1'
            'a0c0b53543e0993ae2225e629c833f3d51495ad31720694ff112ce4ce11111ef'
            '3cfdb98a13571ede17fcc769f5093a97c38b80a7b9b2ab754a26b4d822092b3b'
            'fe24426b9c8b5523a0146a8235c8674eccf0493af354a53ec895c3596d9eb745'
            '6bd74fe76cd39ee0ec18775c3661d845343fb3f6f8fa09a3076638417baf741f'
            '2a20cf7ce1909d8ee1e949095d340f7d7656705f7c810a2d6faf56800ad0cb3d'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            'SKIP'
            'c562a812ce7e1442eb2e1414d5a70cddde5e4ceb454d4b5fba68d45617431f81'
            '442b36978d2ed5c9e555adef20e2ba70a3775e7e66e6a11b3a0bd2d8df5d0032')

# Zen Maru Gothic (Yoshimichi Ohira / Kazunari Tsuchiya, Google Fonts) is a
# rounded Japanese gothic with Latin, Greek and Cyrillic, in five static
# weights. Sources are pinned to the google/fonts commit above.
#
# All tuning (otf2ttf-free here, hinting, gasp, features baked into calt, ...)
# is done by fonttune (https://github.com/gaou-piou/fonttune), which asks its
# questions in prepare(). Every key can be preset: FONTTUNE_<KEY>=value.
# Local testing: `fonttune dev on` (see _ft_local).
#
#   NERD_PATCH=true   patch with Nerd Fonts glyphs (default false; asked on a TTY)
#   WEIGHTS="Light Regular Medium Bold Black"   files to install (default all)

prepare() {
  _ft_local
  _check_fonttune
  mkdir -p "$srcdir/selected"
  local _w
  for _w in ${WEIGHTS:-Light Regular Medium Bold Black}; do
    install -m644 "$srcdir/ZenMaruGothic-$_w.ttf" "$srcdir/selected/" \
      || { echo "Error: unknown weight '$_w'" >&2; exit 1; }
  done
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

build() {
  _check_fonttune
  local _src="$srcdir/selected"
  if [[ "$(< "$srcdir/.nerd")" == true ]]; then
    echo "==> Patching with Nerd Fonts glyphs (this takes a while)..."
    rm -rf "$srcdir/patched"; mkdir -p "$srcdir/patched"
    find "$srcdir/selected" -name '*.ttf' | sort | \
      parallel --will-cite -j"$(nproc)" python "$srcdir/font-patcher/font-patcher" \
        --variable-width-glyphs -q -c {} -out "$srcdir/patched" '>/dev/null'
    compgen -G "$srcdir/patched/*.ttf" >/dev/null || { echo "Error: font-patcher produced no output." >&2; exit 1; }
    parallel --will-cite -j"$(nproc)" python "$(_ft)/fonttune/steps/fix_names.py" ::: "$srcdir/patched/"*.ttf
    _src="$srcdir/patched"
  fi
  python "$(_ft)/bin/fonttune" run --config "$srcdir/fonttune.toml" --in-place \
    --fonts-conf "${ZM_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}" \
    --features-match '^Zen Maru Gothic' "$_src/"*.ttf
  echo "$_src" > "$srcdir/.out"
}

package() {
  local _src; _src=$(< "$srcdir/.out")
  local _fontdir="$pkgdir/usr/share/fonts/zen-maru-gothic"
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
