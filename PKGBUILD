# Maintainer: Tino Gohl <tuvbunn2@googlemail.com>
pkgname=jgrep
pkgver=1.0.10
pkgrel=1
pkgdesc="grep for JSON with jq-style filter expressions (built from source)"
arch=('x86_64')
url="https://github.com/subnix-work/jgrep-tinox"
license=('Apache-2.0')
depends=('glibc' 'gc' 'zlib' 'openssl')
makedepends=('tinox>=2.7.0')
# jgrep and jgrep-bin install the same binary at /usr/bin/jgrep.
# makepkg's auto-generated -debug subpackage is keyed by the installed
# binary's path, not the source package name, so jgrep-debug and
# jgrep-bin-debug both try to install
# /usr/lib/debug/usr/bin/jgrep.debug and conflict when installing one
# after the other was previously installed (as ygrep-aur/ygrep-bin
# already work around for the same reason). Disable it here too.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::https://github.com/subnix-work/jgrep-tinox/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('17bab8c796a58ed83cbec8e6a0b147015e7e7f8228bb2ded21e1aa0863b0a944')

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
