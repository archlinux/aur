# Maintainer: Tino Gohl <tuvbunn2@googlemail.com>
pkgname=ygrep-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="grep for YAML with jq-style filter expressions (prebuilt binary)"
arch=('x86_64')
url="https://github.com/subnix-work/jgrep-tinox"
license=('Apache-2.0')
depends=('glibc' 'gc')
provides=('ygrep')
conflicts=('ygrep')
# ygrep is byte-identical to jgrep (same binary, behavior switches on
# argv[0] -- see jgrep-tinox/build.sh) and both are built the same way,
# so they share the same ELF build-id. makepkg's auto-generated -debug
# subpackage is keyed by build-id, not filename, so jgrep-bin-debug and
# ygrep-bin-debug would both try to install the exact same
# /usr/lib/debug/.build-id/... path and conflict when both are installed
# together. Disable it here; jgrep-bin-debug alone is sufficient for
# debugging either binary (gdb resolves debug info by build-id, not by
# which package installed it).
options=('!debug')
source=("https://github.com/subnix-work/jgrep-tinox/releases/download/v${pkgver}/ygrep-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('bbc6e99d93b09c8b8a18457037993fa507750d24535f26f4a206348ff557b9ac')

package() {
  cd "$srcdir"
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
