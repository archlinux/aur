# Maintainer: alchemmist <anton.ingrish@gmail.com>

pkgbase=lazy-tmux
pkgname=('lazy-tmux' 'lazy-tmux-fzf')
pkgver=0.3.6
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
sha256sums_x86_64=('5e6faa2850cc925b7729b46f32efd5d376d1e676deadfbf1a314fa940f04269a' 'a8446a8f6baf2fad7d77fb77259d253f8b1983651ae486a0f2aeb3f9dfbfc75d')
sha256sums_aarch64=('97812246a05d2c19e3523835419c74eb60669c989066a541b41da4ac37180b5f' '434471e665252f7b021e49c3c8d965e4431c0b8022e922d4da3ea0b96655213b')

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
