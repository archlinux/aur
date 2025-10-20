# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname='treegrep-bin'
_pkgname="${pkgname/-bin}"
pkgver=1.3.0
pkgrel=1
pkgdesc='Frontend for ripgrep that presents results in a tree format (pre-compiled)'
arch=('aarch64' 'x86_64')
url='https://github.com/4imothy/treegrep'
license=('CC-BY-4.0')  # SPDX-License-Identifier: CC-BY-4.0
provides=('tgrep' 'treegrep')
conflicts=("${provides[@]}")
_rawurl='https://raw.githubusercontent.com/4imothy/treegrep/main'
_license="LICENSE-$pkgver::$_rawurl/LICENSE"
_linux='unknown-linux-musl'
_readme="README-$pkgver.md::$_rawurl/README.md"
_releases="$url/releases/download"
source_aarch64=(
  "$_pkgname-aarch64-$pkgver.tar.gz::$_releases/$pkgver/treegrep-aarch64-$_linux.tar.gz"
  "$_license" "$_readme"
)
source_x86_64=(
  "$_pkgname-x86_64-$pkgver.tar.gz::$_releases/$pkgver/treegrep-x86_64-$_linux.tar.gz"
  "$_license" "$_readme"
)

build() {
  cd "$_pkgname-$CARCH-$_linux"

  for _shell in bash elvish fish zsh; do
    ./tgrep --completions "$_shell" > "_completions.$_shell"
  done
}

package() {
  _install() {
    test -t 1 && _verbose='-v' || _verbose=''
    # shellcheck disable=SC2086
    install $_verbose "$@"
  }

  _install -Dm0644 "README-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  _install -Dm0644 "LICENSE-$pkgver"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$_pkgname-$CARCH-$_linux"

  _install -Dm0755 -t "$pkgdir/usr/bin" tgrep

  # Bash
  _install -Dm0644 _completions.bash \
    "$pkgdir/usr/share/bash-completion/completions/tgrep"
  # Elvish
  _install -Dm0644 _completions.elvish \
    "$pkgdir/usr/share/elvish/lib/tgrep.elv"
  # Fish
  _install -Dm0644 _completions.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/tgrep.fish"
  # Zsh
  _install -Dm0644 _completions.zsh  \
    "$pkgdir/usr/share/zsh/site-functions/_tgrep"
}

sha256sums_aarch64=(
  '413d5b0b4706c2e349284f75c70eb9d8eeb8be5b0b2f64cb9fc55672adb664d0'
  'SKIP' 'SKIP'  # Skip to my Lou!
)
sha256sums_x86_64=(
  '089da5052965dc0ea8c5513132aaed0cede47b4c30a5155abba264dac713a19c'
  'SKIP' 'SKIP'  # Skip to my Lou!
)

# eof
