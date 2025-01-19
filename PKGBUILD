# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: amesgen <amesgen AT amesgen DOT de>
# Based on ghcup-hs-bin by amesgen

pkgname=ghcup-hs-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.1.40.0.r24.gecd41e0a
pkgrel=3
pkgdesc='GHC toolchain installer'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url='https://www.haskell.org/ghcup/'
license=('LGPL-3.0-only')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
depends=('gmp' 'bzip2' 'zlib')
makedepends=('git' 'stack' 'yq')
optdepends=('curl'
            'wget'
            'ncurses: for the TUI'
            "ncurses5-compat-libs: using older ghc's linking against libtinfo.so.5")
_url=https://github.com/haskell/ghcup-hs
source=("$pkgname::git+$_url.git")
sha256sums=('SKIP')
install="$_pkgname.install"

pkgver() {
  cd "$pkgname"
  git describe --tags --long \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  # enable tests
  yq -i --yaml-output \
      '.build."test-arguments"."no-run-tests" = false' stack.yaml
}

build() {
  cd "$pkgname"
  stack build
}

check() {
  cd "$pkgname"
  stack test
}

package() {
  cd "$pkgname"
  stack install --local-bin-path "$pkgdir/usr/bin"

  _install_completion_script bash bash-completion/completions/ghcup
  _install_completion_script zsh zsh/site-functions/_ghcup
  _install_completion_script fish fish/vendor_completions.d/ghcup.fish
}

_install_completion_script() {
  install -Dm644 \
    <("$pkgdir/usr/bin/ghcup" --$1-completion-script /usr/bin/ghcup) \
    "$pkgdir/usr/share/$2"
}

# vim:set ts=2 sw=2 et
