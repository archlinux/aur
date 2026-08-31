# shellcheck shell=bash
# -*- mode: sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

_pkgname='leaf-markdown-viewer'
pkgname="$_pkgname-bin"
pkgdesc='Leaf if a text-based markdown previewer for your terminal (pre-compiled)'
pkgver=1.28.1
pkgrel=1
url='https://github.com/RivoLink/leaf'
changelog="$_pkgname.changelog"
arch=('x86_64')
license=('MIT')  # SPDX-License-Identifier: MIT
depends=('glibc' 'libgcc')
provides=(leaf{,-markdown-viewer})
conflicts=("${provides[@]}")
_rawurl='https://raw.githubusercontent.com/RivoLink/leaf/refs/heads/main'
source=(
  "leaf-$pkgver-$CARCH.bin::$url/releases/download/$pkgver/leaf-linux-${CARCH/arm64/aarch64}"
  "LICENSE-MIT.txt::$_rawurl/LICENSE"
  "CHANGELOG-$pkgver.md::$_rawurl/CHANGELOG.md"
  "CONTRIBUTING-$pkgver.md::$_rawurl/CONTRIBUTING.md"
  "README-$pkgver.md::$_rawurl/README.md"
  "SECURITY-$pkgver.md::$_rawurl/SECURITY.md"
  "TESTING-$pkgver.md::$_rawurl/TESTING.md"
)
sha256sums=(
  '4c3fb454e28953e123d4a70bbe9f129ccdfcc1f0dc48f86ae11d4539bc854d0c'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

build() {
  ln -sf "leaf-$pkgver-$CARCH.bin" leaf
  chmod +x leaf

  for _shell in bash fish nushell zsh; do
    ./leaf --auto-complete "$_shell:dump" > "_completions.$_shell"
  done

  cat <<EOF >_completions.nu
module completions {

$(cat _completions.nushell)

}

export use completions *
EOF
}

package() {
  install -Dm0755 "leaf-$pkgver-$CARCH.bin" "$pkgdir/usr/bin/leaf"
  install -Dm0644 LICENSE-MIT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  for _doc in {CHANGELOG,CONTRIBUTING,README,SECURITY,TESTING}; do
    install -Dm0644 "$_doc-$pkgver.md" "$pkgdir/usr/share/doc/$pkgname/$_doc.md"
  done

  install -Dm0644 _completions.bash \
    "$pkgdir/usr/share/bash-completion/completions/leaf"
  install -Dm0644 _completions.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/leaf.fish"
  install -Dm0644 _completions.nu   \
    "$pkgdir/usr/share/nushell/vendor/autoload/leaf.nu"
  install -Dm0644 _completions.zsh  \
    "$pkgdir/usr/share/zsh/site-functions/_leaf"

  for _dir in doc licenses; do
    cd "$pkgdir/usr/share/$_dir" && ln -sr "$pkgname" "$_pkgname"
  done
}

# eof
