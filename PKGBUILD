# Maintainer: gaou-piou <i.am.piou@gmail.com>
# Contributor: GCMarvin <GCMarvin@users.noreply.github.com>

pkgname=ttf-google-sans-hinted
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
_nfver=3.5.1
_ofl_commit=fc0842ce25d003e57a2fc72cd4c4a6af6175a2cc   # google/fonts: ofl/googlesans/OFL.txt
pkgver=14.000
pkgrel=1
pkgdesc='Google Sans and Google Sans Text, tuned with fonttune (optionally Nerd Fonts patched)'
url='https://github.com/googlefonts/googlesans'
arch=('any')
license=('OFL-1.1')
makedepends=('git' 'python' 'python-fonttools' 'python-freetype-py' 'parallel' 'fontforge' 'ttfautohint')
options=(!strip !zipman)
conflicts=('ttf-google-sans')
provides=('ttf-google-sans')

source=(
  "GoogleSans-v${pkgver}.zip::${url}/releases/download/v${pkgver}/GoogleSans-v${pkgver}.zip"
  "OFL-${pkgver}.txt::https://raw.githubusercontent.com/google/fonts/${_ofl_commit}/ofl/googlesans/OFL.txt"
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}"
)
noextract=("GoogleSans-v${pkgver}.zip" "font-patcher-${_nfver}.zip")
# The upstream repository's own OFL.txt still carries the Google Sans Flex
# copyright line, so the licence comes from google/fonts (pinned commit).
sha256sums=('d338f0e74f5eabead86a85b87edf4cc50cd6561196dbe173d1db4139e95b3ca7'
            '2b75ef20f13d83a7514aee452c4782c20cdc9ff2dee17600f44d37a06d4fb958'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            'SKIP')

# Google Sans and Google Sans Text (Google, OFL, github.com/googlefonts/googlesans
# releases): six static TTFs each (Regular, Medium, Bold and their italics), the
# desktop build/GoogleSans/static/ set of the release zip. "Google Sans" is the
# opsz 18 (display) cut, "Google Sans Text" the opsz 17 cut for small sizes; the
# old "Google Sans Display" family no longer exists. Tuning (hinting, gasp,
# features baked into calt, ...) is done by fonttune, which asks in prepare();
# every key can be preset as FONTTUNE_<KEY>. Local testing: `FONTTUNE_DEV=true`
# (see _ft_local).
#
#   WANT_GOOGLE_SANS=true|false       "Google Sans"      (default true)
#   WANT_GOOGLE_SANS_TEXT=true|false  "Google Sans Text" (default true)
#   NERD_PATCH=true                   patch with Nerd Fonts glyphs (default false)

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
  rm -rf "$srcdir/static"; mkdir "$srcdir/static"
  bsdtar xf "GoogleSans-v${pkgver}.zip" -C "$srcdir/static" --strip-components 3 'build/GoogleSans/static/*.ttf'
  compgen -G "$srcdir/static/GoogleSans*.ttf" >/dev/null || { echo "Error: no static TTFs in the release zip." >&2; exit 1; }
  _ft_local
  _check_fonttune
  _ask WANT_GOOGLE_SANS "Include Google Sans" y
  _ask WANT_GOOGLE_SANS_TEXT "Include Google Sans Text" y
  _ask NERD_PATCH "Patch with Nerd Fonts glyphs" n
  if [[ "$WANT_GOOGLE_SANS$WANT_GOOGLE_SANS_TEXT" != *true* ]]; then
    echo "Error: select at least one family." >&2; exit 1
  fi
  printf '%s\n' "$NERD_PATCH" > "$srcdir/.nerd"

  rm -rf "$srcdir/selected" "$srcdir/font-patcher"; mkdir -p "$srcdir/selected"
  if [[ "$WANT_GOOGLE_SANS" == true ]]; then cp "$srcdir"/static/GoogleSans-*.ttf "$srcdir/selected/"; fi
  if [[ "$WANT_GOOGLE_SANS_TEXT" == true ]]; then cp "$srcdir"/static/GoogleSansText-*.ttf "$srcdir/selected/"; fi
  if [[ "$NERD_PATCH" == true ]]; then
    mkdir -p "$srcdir/font-patcher"
    bsdtar xf "$srcdir/font-patcher-${_nfver}.zip" -C "$srcdir/font-patcher"
  fi
  python "$(_ft)/bin/fonttune" configure --defaults clean \
    --save-to "$srcdir/fonttune.toml" "$srcdir/selected/"*.ttf
}

build() {
  _check_fonttune
  local _src="$srcdir/selected"
  if [[ "$(< "$srcdir/.nerd")" == true ]]; then
    printf "%b" "\e[1;33m==> WARNING:\e[0m Patching with Nerd Fonts glyphs, this takes a while...\n"
    rm -rf "$srcdir/patched"; mkdir -p "$srcdir/patched"
    find "$srcdir/selected" -name '*.ttf' | sort | \
      parallel --will-cite -j"$(nproc)" python "$srcdir/font-patcher/font-patcher" \
        --variable-width-glyphs -q -c {} -out "$srcdir/patched" '>/dev/null'
    compgen -G "$srcdir/patched/*.ttf" >/dev/null || { echo "Error: font-patcher produced no output." >&2; exit 1; }
    parallel --will-cite -j"$(nproc)" python "$(_ft)/fonttune/steps/fix_names.py" ::: "$srcdir/patched/"*.ttf
    _src="$srcdir/patched"
  fi
  python "$(_ft)/bin/fonttune" run --config "$srcdir/fonttune.toml" --in-place \
    --fonts-conf "${GS_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}" \
    --features-match '^Google Sans' "$_src/"*.ttf
  echo "$_src" > "$srcdir/.out"
}

package() {
  local _src; _src=$(< "$srcdir/.out")
  local _fontdir="$pkgdir/usr/share/fonts/google-sans"
  install -Dm644 -t "$_fontdir" "$_src/"*.ttf

  install -Dm644 "$srcdir/OFL-${pkgver}.txt" "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
  if [[ "$(< "$srcdir/.nerd")" == true ]]; then
    printf '%s\n' 'Nerd Fonts glyphs are licensed under their respective open-source licenses.' \
      'See https://github.com/ryanoasis/nerd-fonts for details.' \
      > "$pkgdir/usr/share/licenses/$pkgname/NERD-FONTS"
  fi

  install -d "$pkgdir/usr/share/doc/$pkgname"
  _ft_rev > "$pkgdir/usr/share/doc/$pkgname/FONTTUNE_REV" 2>/dev/null || true
  install -m644 "$srcdir/fonttune.toml" "$pkgdir/usr/share/doc/$pkgname/fonttune.toml"

  if grep -q '^hint = "[a-z]' "$srcdir/fonttune.toml"; then
    install -d "$pkgdir/usr/share/fontconfig/conf.avail"
    python "$(_ft)/bin/fonttune" hintconf --name "$pkgname" \
      -o "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf" "$_fontdir/"*.ttf
    chmod 644 "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf"
  fi

  # Opt-in hintnone snippet (fonttune nohint): these families drawn unhinted, the
  # outlines as designed and only anti-aliased (as macOS draws them). Every
  # built font is named, variable ones too. Enable it by linking it into conf.d.
  if grep -q '^nohint = true' "$srcdir/fonttune.toml"; then
    install -d "$pkgdir/usr/share/fontconfig/conf.avail"
    python "$(_ft)/bin/fonttune" hintconf --style none --name "$pkgname" \
      -o "$pkgdir/usr/share/fontconfig/conf.avail/81-$pkgname-nohint.conf" "$_fontdir/"*.[ot]tf
    chmod 644 "$pkgdir/usr/share/fontconfig/conf.avail/81-$pkgname-nohint.conf"
    echo "==> nohint: ships conf.avail/81-$pkgname-nohint.conf (hintstyle=hintnone for these families; off until enabled):"
    echo "    sudo ln -s /usr/share/fontconfig/conf.avail/81-$pkgname-nohint.conf /etc/fonts/conf.d/ && fc-cache -f"
  fi
}
