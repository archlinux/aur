# Maintainer: Damian Nowak <spam at nowaker dot net>
# Upstream: Jguer <pkgbuilds at jguer.space>
pkgname=yayp
pkgver=13.0.0.nowaker.1
pkgrel=1
pkgdesc="yay fork with parallel AUR builds within a single dependency layer"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://gitlab.com/nowaker/yay-parallel"
options=(!lto)
license=('GPL-3.0-or-later')
depends=('pacman>6.1' 'git')
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=('go>=1.21' 'git')
provides=("yay-parallel=${pkgver}")
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"

  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1

  # Build the upstream Makefile target. The Makefile produces a binary
  # named `yay` regardless of fork; we rename it to `yayp` at install
  # time so it coexists with upstream yay.
  make VERSION="${pkgver}" PREFIX="/usr" build
}

package() {
  cd "$srcdir/$pkgname"

  # Install the binary under the fork's name (yayp) so this package can
  # coexist with the upstream `yay` package side-by-side.
  install -Dm755 yay "${pkgdir}/usr/bin/yayp"

  # Man page, shell completions, locale files: install under `yayp` so
  # `man yayp`, `yayp <Tab>`, etc. all resolve to this fork's bits.
  install -Dm644 doc/yay.8 "${pkgdir}/usr/share/man/man8/yayp.8"
  install -Dm644 completions/bash "${pkgdir}/usr/share/bash-completion/completions/yayp"
  install -Dm644 completions/zsh  "${pkgdir}/usr/share/zsh/site-functions/_yayp"
  install -Dm644 completions/fish "${pkgdir}/usr/share/fish/vendor_completions.d/yayp.fish"

  for mofile in po/*.mo; do
    [ -e "$mofile" ] || continue
    lang=$(basename "$mofile" .mo)
    install -Dm644 "$mofile" "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/yayp.mo"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
