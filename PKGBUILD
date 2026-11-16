# Maintainer: alchemmist <anton.ingrish@gmail.com>

pkgbase=lazy-tmux
pkgname=('lazy-tmux' 'lazy-tmux-fzf')
pkgver=0.3.7
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
sha256sums_x86_64=('bc34339e84829a7353b5cbcb1e9b3a5470204bae5ff16a1965439a0fcc18ed6d' '929c9000f5fa81946f53db02041ed4a020b50223dff283b3abb676cdc99da08c')
sha256sums_aarch64=('6112965eab762004a3eb340e364eca30458a33d7926a1edb31e39e8d35c6b20d' 'f79f3b7fd3f01ad9ad563dd368f925997119cc9d2ff3b7ae7563852e3233fbf9')

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
