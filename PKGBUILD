# Maintainer: Tino Gohl <tuvbunn2@googlemail.com>
pkgname=ygrep
pkgver=1.0.3
pkgrel=1
pkgdesc="grep for YAML with jq-style filter expressions (built from source)"
arch=('x86_64')
url="https://github.com/subnix-work/jgrep-tinox"
license=('Apache-2.0')
depends=('glibc' 'gc')
makedepends=('tinox')
# ygrep is byte-identical to jgrep (same binary, behavior switches on
# argv[0] -- see jgrep-tinox/build.sh); both packages compile the same
# source with the same toolchain, so their binaries share the same ELF
# build-id. makepkg's auto-generated -debug subpackage is keyed by
# build-id, not filename, so jgrep-debug and ygrep-debug would both try
# to install the same /usr/lib/debug/.build-id/... path and conflict
# when both are installed together. Disable it here; jgrep-debug alone
# is sufficient for debugging either binary.
options=('!debug')
source=("jgrep-tinox-$pkgver.tar.gz::https://github.com/subnix-work/jgrep-tinox/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('93f9cb66498441a4829f43cdc2ffc28e225ebdbb856b0061c39241eaaa150181')

build() {
  cd "jgrep-tinox-$pkgver"
  tinox build
  # ygrep is the same binary as jgrep; behavior switches on argv[0]
  cp -f jgrep ygrep
}

package() {
  cd "jgrep-tinox-$pkgver"
  install -Dm755 ygrep "$pkgdir/usr/bin/ygrep"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  ./ygrep completion bash > ygrep.bash
  ./ygrep completion zsh > _ygrep
  ./ygrep completion fish > ygrep.fish
  install -Dm644 ygrep.bash "$pkgdir/usr/share/bash-completion/completions/ygrep"
  install -Dm644 _ygrep "$pkgdir/usr/share/zsh/site-functions/_ygrep"
  install -Dm644 ygrep.fish "$pkgdir/usr/share/fish/vendor_completions.d/ygrep.fish"
}
