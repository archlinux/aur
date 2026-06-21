# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='treegrep-bin'
_pkgname="${pkgname/-bin}"
pkgdesc='Frontend for ripgrep that presents results in a tree format (pre-compiled)'
pkgver=2.2.0
pkgrel=1
url='https://github.com/4imothy/treegrep'
changelog="$_pkgname.changelog"
arch=('aarch64' 'x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
provides=('tgrep' 'treegrep')
conflicts=("${provides[@]}")
_rawurl='https://raw.githubusercontent.com/4imothy/treegrep/main'
_linux='unknown-linux-musl'
_readme="README-$pkgver.md::$_rawurl/README.md"
_releases="$url/releases/download"
source_aarch64=(
  "$_pkgname-aarch64-$pkgver.tar.gz::$_releases/$pkgver/treegrep-aarch64-$_linux.tar.gz"
  "$_readme"
)
source_x86_64=(
  "$_pkgname-x86_64-$pkgver.tar.gz::$_releases/$pkgver/treegrep-x86_64-$_linux.tar.gz"
  "$_readme"
)

build() {
  cd "$_pkgname-$CARCH-$_linux"

  for _shell in bash elvish fish zsh; do
    ./tgrep --completions "$_shell" > "_completions.$_shell"
  done
}

package() {
  install -Dm0644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm0644 ../LICENSES/MIT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for _dir in doc licenses; do
    pushd "$pkgdir/usr/share/$_dir" >/dev/null
    ln -sr "$pkgname" "$_pkgname"
    popd >/dev/null
  done

  cd "$_pkgname-$CARCH-$_linux"

  install -Dm0755 -t "$pkgdir/usr/bin" tgrep

  # Bash
  install -Dm0644 _completions.bash \
    "$pkgdir/usr/share/bash-completion/completions/tgrep"
  # Elvish
  install -Dm0644 _completions.elvish \
    "$pkgdir/usr/share/elvish/lib/tgrep.elv"
  # Fish
  install -Dm0644 _completions.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/tgrep.fish"
  # Zsh
  install -Dm0644 _completions.zsh  \
    "$pkgdir/usr/share/zsh/site-functions/_tgrep"
}

sha256sums_aarch64=(
  'b3e14917d27830e2b47c72cb51553a83076c4f720e2b30b09a5dacd2a83bafac'
  'SKIP'
)
sha256sums_x86_64=(
  '43a7fe7d9bdbed62840fa411c0ab2ed2d485e904e6d8d410edbbece00f6804f4'
  'SKIP'
)

# eof
