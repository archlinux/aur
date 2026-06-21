# Maintainer: Hannes Hapke <hannes.hapke@gmail.com>
pkgname=yaak-cli-bin
_pkgname=yaak
pkgver=0.1.5
pkgrel=1
pkgdesc="Translate natural language to bash commands using any OpenAI-compatible LLM (prebuilt binary)"
arch=('x86_64')
url="https://github.com/hanneshapke/yaak"
license=('Apache-2.0')
provides=('yaak' 'yaak-cli')
conflicts=('yaak' 'yaak-cli')
depends=('gcc-libs')
source=("$_pkgname-$pkgver-x86_64.tar.gz::https://github.com/hanneshapke/yaak/releases/download/v$pkgver/yaak-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
# Regenerate with `updpkgsums` after bumping pkgver.
sha256sums=('3bd2ddaa6c2c8240446553eea44671d540440e3d33031165eb2c70c397c452ab')

package() {
  cd "$srcdir/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # License and docs (best-effort; upstream tarball may not contain them).
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  fi
  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  fi

  # Shell completions generated at runtime by the yaak binary itself.
  "$pkgdir/usr/bin/$_pkgname" --completions bash | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/bash-completion/completions/$_pkgname"
  "$pkgdir/usr/bin/$_pkgname" --completions zsh | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/zsh/site-functions/_$_pkgname"
  "$pkgdir/usr/bin/$_pkgname" --completions fish | install -Dm644 /dev/stdin \
    "$pkgdir/usr/share/fish/vendor_completions.d/$_pkgname.fish"
}
