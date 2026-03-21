# Maintainer: yuzujr <15568103056@163.com>

pkgname=coomer
pkgver=1.1.3
pkgrel=1
pkgdesc="Zoomer application for everyone on Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/yuzujr/coomer"
license=('MIT')

depends=(
  'glibc'
  'libglvnd'
  'libx11'
  'libxrandr'
  'wayland'
  'libxkbcommon'
  'dbus'
)
optdepends=(
  'xdg-desktop-portal: portal screenshot backend'
)
makedepends=(
  'xmake'
  'gcc'
  'pkgconf'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c68c86f4e10465e737d37b433573da0c70025552df2381102171f0db274ef578')

_xmake_env() {
  export XMAKE_GLOBALDIR="$srcdir/.xmake-global"
  export XMAKE_PKG_CACHEDIR="$srcdir/.xmake-cache"
  export XMAKE_PKG_INSTALLDIR="$srcdir/.xmake-packages"
}

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  _xmake_env

  xmake f -m release -y --x11=y --wayland=y --portal=y
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  _xmake_env
  xmake -y
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  local binary_path
  binary_path="$(find build -type f -path '*/release/coomer' -print -quit)"
  [[ -n "$binary_path" ]] || {
    echo "coomer binary not found under build/" >&2
    return 1
  }

  install -Dm755 "$binary_path" \
    "$pkgdir/usr/bin/coomer"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 completions/fish/coomer.fish \
    "$pkgdir/usr/share/fish/vendor_completions.d/coomer.fish"

  install -Dm644 completions/bash/coomer \
    "$pkgdir/usr/share/bash-completion/completions/coomer"

  install -Dm644 completions/zsh/_coomer \
    "$pkgdir/usr/share/zsh/site-functions/_coomer"
}
