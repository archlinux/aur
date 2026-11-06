# Maintainer: alchemmist <anton.ingrish@gmail.com>

pkgbase=lazy-tmux
pkgname=('lazy-tmux' 'lazy-tmux-fzf')
pkgver=0.3.5
pkgrel=2
pkgdesc="Fast tmux session manager"
arch=('x86_64' 'aarch64')
url="https://github.com/alchemmist/lazy-tmux"
license=('MIT')
depends=()

source_x86_64=(
  "lazy-tmux_${pkgver}_linux_amd64.tar.gz::https://github.com/alchemmist/lazy-tmux/releases/download/v${pkgver}/lazy-tmux_linux_amd64.tar.gz"
  "lazy-tmux_${pkgver}_linux_amd64_fzf.tar.gz::https://github.com/alchemmist/lazy-tmux/releases/download/v${pkgver}/lazy-tmux_linux_amd64_fzf.tar.gz"
)
source_aarch64=(
  "lazy-tmux_${pkgver}_linux_arm64.tar.gz::https://github.com/alchemmist/lazy-tmux/releases/download/v${pkgver}/lazy-tmux_linux_arm64.tar.gz"
  "lazy-tmux_${pkgver}_linux_arm64_fzf.tar.gz::https://github.com/alchemmist/lazy-tmux/releases/download/v${pkgver}/lazy-tmux_linux_arm64_fzf.tar.gz"
)
sha256sums_x86_64=('b6b1207d44b6eae5497324cfbe79bd5045b22b6a0bb0dd9eed42584ec8ff96ee' 'b1d53fd73b0593001e2947b91adc480d7aa8e8fb2949dba3bba05f789c87a206')
sha256sums_aarch64=('49e3ae242d0fe4dbbbb1e841436fa45b9503c046852bf4944cd78208d8c3e0a5' 'a00828a65e0f441085a55795012e4d2e0cd81b8ae74969175784d1f1482af328')

_package_arch_suffix() {
  case "$CARCH" in
    x86_64) echo "amd64" ;;
    aarch64) echo "arm64" ;;
    *) echo "unsupported arch: $CARCH" >&2; return 1 ;;
  esac
}

_package_release() {
  local suffix="$1" binary="$2" archsuffix staging
  archsuffix="$(_package_arch_suffix)"
  staging="$(mktemp -d)"
  tar -xzf "$srcdir/lazy-tmux_${pkgver}_linux_${archsuffix}${suffix}.tar.gz" -C "$staging"
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/licenses/$binary" "$pkgdir/usr/share/doc/$binary"
  install -m755 "$staging/lazy-tmux" "$pkgdir/usr/bin/$binary"
  install -m644 "$staging/LICENSE" "$pkgdir/usr/share/licenses/$binary/LICENSE"
  install -m644 "$staging/README.md" "$pkgdir/usr/share/doc/$binary/README.md"
  rm -rf "$staging"
}

package_lazy-tmux() {
  _package_release "" "lazy-tmux"
}

package_lazy-tmux-fzf() {
  _package_release "_fzf" "lazy-tmux-fzf"
}
