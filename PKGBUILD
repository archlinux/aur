# Maintainer: phylliade
pkgname=notion-cli
pkgver=0.21.2
pkgrel=1
pkgdesc="Official Notion CLI (beta) — access your Notion workspace from any terminal"
arch=('x86_64' 'aarch64')
url="https://developers.notion.com"
license=('MIT')
provides=('ntn')
options=('!debug')
# Upstream distributes via npm, but the tarball ships self-contained static
# binaries per platform — no Node.js needed at runtime.
source=("https://registry.npmjs.org/ntn/-/ntn-${pkgver}.tgz")
sha256sums=('cfb6ca323ed3459307df57083812beb8025b8c12f1fc9ac3dc38be4cac2a3a98')

_target() {
  case "$CARCH" in
    x86_64)  echo linux-x64 ;;
    aarch64) echo linux-arm64 ;;
  esac
}

package() {
  cd package
  install -Dm755 "dist/ntn-$(_target)/ntn" "$pkgdir/usr/bin/ntn"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Shell completions. clap's dynamic completions embed the invocation
  # path verbatim, so invoke the binary as plain `ntn` through PATH to get
  # scripts that reference /usr/bin/ntn via PATH lookup.
  install -d "$srcdir/completions-path"
  cp "dist/ntn-$(_target)/ntn" "$srcdir/completions-path/ntn"
  local _out="$srcdir/completions"
  install -d "$_out"
  PATH="$srcdir/completions-path:$PATH" HOME="$srcdir/build-home" \
    sh -c 'ntn completions bash > "$1/ntn.bash" &&
           ntn completions zsh  > "$1/_ntn" &&
           ntn completions fish > "$1/ntn.fish"' _ "$_out"
  install -Dm644 "$_out/ntn.bash" "$pkgdir/usr/share/bash-completion/completions/ntn"
  install -Dm644 "$_out/_ntn" "$pkgdir/usr/share/zsh/site-functions/_ntn"
  install -Dm644 "$_out/ntn.fish" "$pkgdir/usr/share/fish/vendor_completions.d/ntn.fish"
}
