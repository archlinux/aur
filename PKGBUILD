# Maintainer: gaou-piou <i.am.piou@gmail.com>
pkgname=ttf-misans-latin-hinted
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
pkgver=4.007
pkgrel=9
pkgdesc="MiSans Latin (Latin, Greek, Cyrillic) by Xiaomi, tuned with fonttune (fontconfig-friendly weight classes, optional hinting)"
arch=(any)
url="https://hyperos.mi.com/font/en/download/"
license=(LicenseRef-MiSans)
makedepends=(git python python-fonttools ttfautohint)
provides=(ttf-misans-latin)
conflicts=(ttf-misans-latin)
options=(!strip)
# Xiaomi re-uploads the zip in place without a version in the URL, so the
# local file name carries pkgver and the checksum is pinned: a silent upstream
# re-spin fails the checksum instead of slipping through. prepare() also checks
# that the fonts really are version $pkgver.
source=("MiSans_Latin-${pkgver}.zip::https://hyperos.mi.com/font-download/MiSans_Latin.zip"
        "LICENSE.pdf::https://hyperos.mi.com/font-download/MiSans字体知识产权许可协议.pdf"
        "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}")
sha256sums=('d24091ccd409a4152ffcc12cd659c16df9cdcdb4c702d8ae355b321e711f0004'
            '4a93a27cd2bd81b3b5ecfd0a853144a876fa26938a93a68443c67d74172fcb86'
            'SKIP')

# ── Licensing note ──────────────────────────────────────────────────────────
#
# The MiSans license (§2.2) forbids adapting or redeveloping the fonts. This
# PKGBUILD distributes no font files: it downloads Xiaomi's originals and hints
# (and, only if you ask, bakes OpenType features into) them locally on your own
# machine, for your own use. You are responsible for deciding whether that is
# acceptable to you.
#
# ── What this package does ──────────────────────────────────────────────────
#
# Upstream MiSans Latin ships effectively unhinted (an 8-byte 'prep', no glyph
# instructions). This package takes the ten static TTF weights (Thin … Heavy)
# and runs fonttune on them; prepare() asks the questions:
#
#   * weights  normalise usWeightClass. Stock weights make fontconfig pick
#              Medium for "regular" and Heavy for "bold"
#   * hint     ttfautohint (bytecode runs only at hintmedium/hintfull; the
#              package ships an opt-in 80-*.conf for that)
#   * gasp, features baked into calt, ... (`fonttune steps`)
#
# Every key can be preset: FONTTUNE_<KEY>=value. Local testing:
# `FONTTUNE_DEV=true` (see _ft_local). Each weight takes its blue zones from
# its own outlines (no --reference): Bold's x-height is taller than Regular's.

_fontdir="MiSans Latin/ttf"

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

prepare() {
  _ft_local
  _check_fonttune
  # The checksum already pins the zip; this catches a bumped pkgver.
  local _ver
  _ver="$(python -c 'import sys
from fontTools.ttLib import TTFont
print(str(TTFont(sys.argv[1], lazy=True)["name"].getDebugName(5)).split()[-1])' \
    "$srcdir/$_fontdir/MiSansLatin-Regular.ttf")"
  if [[ "$_ver" != "$pkgver" ]]; then
    echo "Error: fonts report version '$_ver' but pkgver is '$pkgver'." >&2
    exit 1
  fi
  rm -rf "$srcdir/work"; mkdir -p "$srcdir/work"
  cp "$srcdir/$_fontdir/"*.ttf "$srcdir/work/"
  local _count
  _count=$(find "$srcdir/work" -name '*.ttf' | wc -l)
  if (( _count != 10 )); then
    echo "Error: expected 10 static TTF weights, found $_count. Has the zip layout changed?" >&2
    exit 1
  fi
  python "$(_ft)/bin/fonttune" configure --defaults clean \
    --save-to "$srcdir/fonttune.toml" "$srcdir/work/"*.ttf
}

build() {
  _check_fonttune
  python "$(_ft)/bin/fonttune" run --config "$srcdir/fonttune.toml" --in-place \
    --fonts-conf "${MISANS_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}" \
    --features-match '^MiSans Latin' "$srcdir/work/"*.ttf
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" "$srcdir/work/"*.ttf
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE.pdf"
  install -d "$pkgdir/usr/share/doc/$pkgname"
  _ft_rev > "$pkgdir/usr/share/doc/$pkgname/FONTTUNE_REV" 2>/dev/null || true
  install -m644 "$srcdir/fonttune.toml" "$pkgdir/usr/share/doc/$pkgname/fonttune.toml"

  # Opt-in fontconfig snippet when the fonts carry ttfautohint bytecode.
  if grep -q '^hint = "[a-z]' "$srcdir/fonttune.toml"; then
    install -d "$pkgdir/usr/share/fontconfig/conf.avail"
    python "$(_ft)/bin/fonttune" hintconf --name "$pkgname" \
      -o "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf" \
      "$pkgdir/usr/share/fonts/$pkgname/"*.ttf
    chmod 644 "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf"
  fi
}
