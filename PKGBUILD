# Maintainer: Tino Gohl <tuvbunn2@googlemail.com>
pkgname=jgrep
pkgver=1.0.4
pkgrel=1
pkgdesc="grep for JSON with jq-style filter expressions (built from source)"
arch=('x86_64')
url="https://github.com/subnix-work/jgrep-tinox"
license=('Apache-2.0')
depends=('glibc' 'gc')
makedepends=('tinox')
# jgrep and jgrep-bin install the same binary at /usr/bin/jgrep.
# makepkg's auto-generated -debug subpackage is keyed by the installed
# binary's path, not the source package name, so jgrep-debug and
# jgrep-bin-debug both try to install
# /usr/lib/debug/usr/bin/jgrep.debug and conflict when installing one
# after the other was previously installed (as ygrep-aur/ygrep-bin
# already work around for the same reason). Disable it here too.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/subnix-work/jgrep-tinox/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('160e94f7bd6703e0779d0bf0fb2c189a93b637d6cfa62dd0c92cbeff8c9ecfc0')

build() {
  cd "jgrep-tinox-$pkgver"
  tinox build
}

package() {
  cd "jgrep-tinox-$pkgver"
  install -Dm755 jgrep "$pkgdir/usr/bin/jgrep"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  ./jgrep completion bash > jgrep.bash
  ./jgrep completion zsh > _jgrep
  ./jgrep completion fish > jgrep.fish
  install -Dm644 jgrep.bash "$pkgdir/usr/share/bash-completion/completions/jgrep"
  install -Dm644 _jgrep "$pkgdir/usr/share/zsh/site-functions/_jgrep"
  install -Dm644 jgrep.fish "$pkgdir/usr/share/fish/vendor_completions.d/jgrep.fish"
}
