# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>

pkgname='zellij-bin'
_pkgname=${pkgname%-bin}
pkgver=0.19.0
pkgrel=1
pkgdesc='A multiplexing terminal workspace with batteries included (binary release)'
arch=('x86_64')
url='https://github.com/zellij-org/zellij'
_rawurl='https://raw.githubusercontent.com/zellij-org/zellij/main'
license=('MIT')
provides=('zellij')
conflicts=('zellij' 'zellij-git')
source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-musl.tar.gz"
  "CHANGELOG.md::$_rawurl/CHANGELOG.md"
  "CODE_OF_CONDUCT.md::$_rawurl/CODE_OF_CONDUCT.md"
  "CONTRIBUTING.md::$_rawurl/CONTRIBUTING.md"
  "GOVERNANCE.md::$_rawurl/GOVERNANCE.md"
  "LICENSE.md::$_rawurl/LICENSE.md"
  "README.md::$_rawurl/README.md"
)

sha256sums=(
  'dc039b6ef19e9269da626932923a88d229aac4a066dedb975c0bd69f291d130f'
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

build() {
  cd "$srcdir"

  for shell in bash fish zsh; do
    ./zellij setup --generate-completion "$shell" > "zellij.$shell"
  done
}

package() {
  cd "$srcdir"

  install -Dm0755 zellij "$pkgdir/usr/bin/zellij"

  documents=(
    CHANGELOG.md CODE_OF_CONDUCT.md CONTRIBUTING.md GOVERNANCE.md README.md
  )
  for doc in "${documents[@]}"; do
    install -Dm0644 "$doc"    "$pkgdir/usr/share/doc/$pkgname/$doc"
  done

  install -Dm0644 LICENSE.md  "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

  install -Dm0644 zellij.bash "${pkgdir}/usr/share/bash-completion/completions/zellij"
  install -Dm0644 zellij.fish "${pkgdir}/usr/share/fish/vendor_completions.d/zellij.fish"
  install -Dm0644 zellij.zsh  "${pkgdir}/usr/share/zsh/site-functions/_zellij"
}
