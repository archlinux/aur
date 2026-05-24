# Maintainer: Ruby Morgan Voigt <rmv@rmv.fyi>

pkgname=delphitools-cli-bin
_pkgname=delphitools-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="indie toolkit for designers — colour, image, PDF, type, calc, all in one offline CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/1612elphi/delphitools-cli"
license=('0BSD')
provides=('delphitools-cli')
conflicts=('delphitools-cli')
depends=('curl')  # used by `delphi rmbg` for the one-time model download

source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.xz")

sha256sums_x86_64=('96a11360914c552282053aa517703b5a6025ce8658b55fd8ed82dcf939c1be08')
sha256sums_aarch64=('b07f4eb1820eb41e6a3f7d3ebb547d61399aca446a52562132ddfc8c78da2ab3')

package() {
  case "$CARCH" in
    x86_64)  _srcdir="${_pkgname}-x86_64-unknown-linux-gnu" ;;
    aarch64) _srcdir="${_pkgname}-aarch64-unknown-linux-gnu" ;;
  esac

  cd "$srcdir/$_srcdir"

  # Three identical binaries, three names.
  for bin in delphi delphitools dt; do
    install -Dm755 "$bin" "$pkgdir/usr/bin/$bin"
  done

  # Generate and install man pages via the binary's own `install-man` command.
  # This keeps the AUR package free of stale pre-generated pages.
  "$pkgdir/usr/bin/delphi" install-man --dir "$pkgdir/usr/share/man/man1"

  install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
