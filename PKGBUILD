# Maintainer: Simeon Schaub <simeondavidschaub99@gmail.com>
pkgname=juliaup
pkgver=1.18.8
pkgrel=1
pkgdesc="An experimental Julia version manager"
arch=('x86_64' 'x86' 'aarch64')
url="https://github.com/JuliaLang/juliaup"
license=('MIT')
depends=()
makedepends=('rust')
checkdepends=()
optdepends=()
provides=('julia')
conflicts=('julia' 'julia-bin')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('0dfd538e1b4955ce1c9eae5d396ea788')
options=(!lto) # ref https://github.com/briansmith/ring/issues/1444

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  cargo build --release --bin juliaup --bin julialauncher --features binjulialauncher --target-dir ./target
}

package() {
  install -Dm644 "${srcdir}/$pkgname-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/juliaup/LICENSE"
  install -Dm755 "${srcdir}/$pkgname-$pkgver/target/release/juliaup" "${pkgdir}/usr/bin/juliaup"
  install -Dm755 "${srcdir}/$pkgname-$pkgver/target/release/julialauncher" "${pkgdir}/usr/bin/julialauncher"
  ln --relative -s "${pkgdir}/usr/bin/julialauncher" "${pkgdir}/usr/bin/julia"

  # Generate completion files.
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir"/usr/bin/juliaup completions bash > "$pkgdir/usr/share/bash-completion/completions/juliaup"
  mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
  "$pkgdir"/usr/bin/juliaup completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/juliaup.fish"
  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir"/usr/bin/juliaup completions zsh > "$pkgdir/usr/share/zsh/site-functions/_juliaup"
}

# vim: ts=2 sw=2 et:
