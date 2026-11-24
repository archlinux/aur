# Maintainer: alchemmist <anton.ingrish@gmail.com>

pkgbase=lazy-tmux
pkgname=('lazy-tmux' 'lazy-tmux-fzf')
pkgver=0.3.8
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
sha256sums_x86_64=('644ec945b91c660e0a8ab119598af83c0ff454b99f5274313b679d46bc2969e2' 'c0808fc0d5b5804e1ee284f47c1d9a3ee6d8c0a72d91352a86053fe602b620b4')
sha256sums_aarch64=('bfcb7fbac36396557da5977cd7e3126222daf93623e769526d2804b5220ec755' '2c5095db3a02793d5febb20cbcbc4116f2fe63011a1cbe94dfb6f53157d5705b')

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
