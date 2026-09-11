# Maintainer: Tino Gohl <tuvbunn2@googlemail.com>
pkgname=jgrep-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="grep for JSON with jq-style filter expressions (prebuilt binary)"
arch=('x86_64')
url="https://github.com/subnix-work/jgrep-tinox"
license=('Apache-2.0')
depends=('glibc' 'gc')
provides=('jgrep')
conflicts=('jgrep')
# jgrep-bin and jgrep install the same binary at /usr/bin/jgrep.
# makepkg's auto-generated -debug subpackage is keyed by the installed
# binary's path, not the source package name, so jgrep-bin-debug and
# jgrep-debug both try to install /usr/lib/debug/usr/bin/jgrep.debug
# and conflict when installing one after the other was previously
# installed (as ygrep-aur/ygrep-bin already work around for the same
# reason). Disable it here too.
options=('!debug')
source=("https://github.com/subnix-work/jgrep-tinox/releases/download/v${pkgver}/jgrep-${pkgver}-linux-x86_64.tar.gz")
sha256sums=('3d88dc967730102914a0e2971a99f80bf034d5ceeaf951779dfb3009e72b7567')

package() {
  cd "$srcdir"
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
