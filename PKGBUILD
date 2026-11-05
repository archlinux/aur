# Maintainer: gaou-piou <i.am.piou@gmail.com>
# Contributor: GCMarvin <GCMarvin@users.noreply.github.com>

pkgname=ttf-google-sans-hinted
_ftapi=1       # fonttune API this PKGBUILD was written for; the build stops if main moved to another one
_nfver=3.5.1
pkgver=1.020
pkgrel=3
pkgdesc='Google Sans and Google Sans Display, tuned with fonttune (optionally Nerd Fonts patched)'
url='https://flutter.googlesource.com/gallery-assets'
arch=('any')
license=('LicenseRef-Google-Sans')
makedepends=('git' 'python' 'python-fonttools' 'parallel' 'fontforge' 'ttfautohint')
options=(!strip !zipman)
conflicts=('ttf-google-sans')
provides=('ttf-google-sans')

source=(
  'fonts.tar.gz::https://flutter.googlesource.com/gallery-assets/+archive/refs/heads/master/lib/fonts.tar.gz'
  "font-patcher-${_nfver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${_nfver}/FontPatcher.zip"
  "fonttune::git+${FONTTUNE_REPO:-https://github.com/gaou-piou/fonttune.git}#${FONTTUNE_REF:-branch=main}"
)
noextract=("font-patcher-${_nfver}.zip")
# gitiles builds the archive on every request and stamps each entry with the
# download time, so its checksum changes every time - even for a pinned commit.
# The archive is SKIPped here; prepare() checks the fonts themselves instead.
sha256sums=('SKIP'
            '42bcb32145499a35732274c7fc48deb434ad0d2e0e118f98527c1479c6fa251a'
            'SKIP')

# sha256 of the upstream TTFs (see the note above sha256sums). When Google
# updates the fonts, prepare() fails here: refresh this list and set pkgver to
# the new name ID 5 version.
_font_sums=(
  '804fdad80c0a5bf7ea7a2396f7368abbcb4d948f31f0ac88b199dc4c18ef3391  GoogleSans-Bold.ttf'
  'c22e02ace4469ff22340fc1c90c10e9414910f3dadf51e91c50445000b843bea  GoogleSans-BoldItalic.ttf'
  '011fbabfe51a86e81401ffa3eb87df74dec15ad38e75b9ade8460f6ca630e657  GoogleSans-Italic.ttf'
  '8e72f9df72eddef9a75aa93b0972c35491bab52d65c32714fe004b75bd7b5271  GoogleSans-Medium.ttf'
  'cefc41078b3da17b5c1aa9ccf8507b911e50b42005f70f18a7128eb47d3285f7  GoogleSans-MediumItalic.ttf'
  'f8914b020e2c78fe86ca14198095455139f08047b8b52ab69003cb5af35cbbc0  GoogleSans-Regular.ttf'
  '842e6578c478336a0ecd49ed7779bb67cd2dfb4188aff9a7e24fd6ed868eac2a  GoogleSansDisplay-Bold.ttf'
  '603682b81c56ddd52af4a22eb5e1f9d82cea836ea5d0016f1611a447b0a39569  GoogleSansDisplay-BoldItalic.ttf'
  '4af7c400d97c640a2e12155734637f65beacc0a4c51853b676e785faae1af417  GoogleSansDisplay-Italic.ttf'
  '40c1436cb0e94370dee18db4f09e3eb8e199713919adb33295536e6c26d9b74d  GoogleSansDisplay-Medium.ttf'
  '2419ca16947c7e974a537f8e887a73d67ec2c8ac7dd1f6fc47b1a22f4d56a68f  GoogleSansDisplay-MediumItalic.ttf'
  'c1b3bd356f209f250345f33413fe659d8f0634fb15bb2b640b2eee24708978fd  GoogleSansDisplay-Regular.ttf'
)

# Google Sans and Google Sans Display (Google, Flutter gallery assets): six
# static TTFs each (Regular, Medium, Bold and their italics). Tuning (hinting,
# gasp, features baked into calt, ...) is done by fonttune, which asks in
# prepare(); every key can be preset as FONTTUNE_<KEY>. Local testing:
# FONTTUNE_REPO=file:///path/to/fonttune.
#
#   WANT_GOOGLE_SANS=true|false          "Google Sans"         (default true)
#   WANT_GOOGLE_SANS_DISPLAY=true|false  "Google Sans Display" (default true)
#   NERD_PATCH=true                      patch with Nerd Fonts glyphs (default false)

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
  printf '%s\n' "${_font_sums[@]}" | sha256sum -c --quiet - || {
    echo "Error: the upstream fonts changed - update _font_sums and pkgver." >&2; exit 1
  }
  _check_fonttune
  _ask WANT_GOOGLE_SANS "Include Google Sans" y
  _ask WANT_GOOGLE_SANS_DISPLAY "Include Google Sans Display" y
  _ask NERD_PATCH "Patch with Nerd Fonts glyphs" n
  if [[ "$WANT_GOOGLE_SANS$WANT_GOOGLE_SANS_DISPLAY" != *true* ]]; then
    echo "Error: select at least one family." >&2; exit 1
  fi
  printf '%s\n' "$NERD_PATCH" > "$srcdir/.nerd"

  rm -rf "$srcdir/selected" "$srcdir/font-patcher"; mkdir -p "$srcdir/selected"
  if [[ "$WANT_GOOGLE_SANS" == true ]]; then cp "$srcdir"/GoogleSans-*.ttf "$srcdir/selected/"; fi
  if [[ "$WANT_GOOGLE_SANS_DISPLAY" == true ]]; then cp "$srcdir"/GoogleSansDisplay-*.ttf "$srcdir/selected/"; fi
  if [[ "$NERD_PATCH" == true ]]; then
    mkdir -p "$srcdir/font-patcher"
    bsdtar xf "$srcdir/font-patcher-${_nfver}.zip" -C "$srcdir/font-patcher"
  fi
  python "$srcdir/fonttune/bin/fonttune" configure --defaults clean \
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
    parallel --will-cite -j"$(nproc)" python "$srcdir/fonttune/fonttune/steps/fix_names.py" ::: "$srcdir/patched/"*.ttf
    _src="$srcdir/patched"
  fi
  python "$srcdir/fonttune/bin/fonttune" run --config "$srcdir/fonttune.toml" --in-place \
    --fonts-conf "${GS_FONTS_CONF:-${XDG_CONFIG_HOME:-$HOME/.config}/fontconfig/fonts.conf}" \
    --features-match '^Google Sans' "$_src/"*.ttf
  echo "$_src" > "$srcdir/.out"
}

package() {
  local _src; _src=$(< "$srcdir/.out")
  local _fontdir="$pkgdir/usr/share/fonts/google-sans"
  install -Dm644 -t "$_fontdir" "$_src/"*.ttf

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
Google Sans fonts are proprietary fonts owned by Google LLC.
They are distributed as part of Google's Flutter gallery assets.
See https://flutter.googlesource.com/gallery-assets for details.

Nerd Fonts glyphs are licensed under their respective open-source licenses.
See https://github.com/ryanoasis/nerd-fonts for details.
EOF

  install -d "$pkgdir/usr/share/doc/$pkgname"
  git -C "$srcdir/fonttune" describe --always --dirty > "$pkgdir/usr/share/doc/$pkgname/FONTTUNE_REV" 2>/dev/null || true
  install -m644 "$srcdir/fonttune.toml" "$pkgdir/usr/share/doc/$pkgname/fonttune.toml"

  if grep -q '^hint = "[a-z]' "$srcdir/fonttune.toml"; then
    install -d "$pkgdir/usr/share/fontconfig/conf.avail"
    python "$srcdir/fonttune/bin/fonttune" hintconf --name "$pkgname" \
      -o "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf" "$_fontdir/"*.ttf
    chmod 644 "$pkgdir/usr/share/fontconfig/conf.avail/80-$pkgname.conf"
  fi
}
