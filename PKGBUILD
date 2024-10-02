# Maintainer: a821
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: Marcin Kulik <m@kulik.com>

pkgname=asciinema-git
pkgver=3.0.0rc.3.r26.g2728a10
pkgrel=2
pkgdesc="Record and share your terminal sessions"
arch=('x86_64')
url="https://github.com/asciinema/asciinema"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')
options=(!lto !debug)

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -r 's/^v//;s/-([0-9]+)-g(.+)/.r\1.g\2/;s/-//g'
}

prepare() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  ASCIINEMA_GEN_DIR="$srcdir" cargo build --frozen --release --all-features
}

package() {
  install -Dm755 $pkgname/target/release/asciinema -t "${pkgdir}/usr/bin"
  install -Dm644 man/*.1 -t "${pkgdir}/usr/share/man/man1"

  pushd completion
  install -Dm644 asciinema.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
  install -Dm644 asciinema.bash "${pkgdir}/usr/share/bash-completion/completions/asciinema"
  install -Dm644 _asciinema -t "${pkgdir}/usr/share/zsh/site-functions/"
  install -Dm644 asciinema.elv -t "${pkgdir}/usr/share/elvish/lib"
  # not sure where these files should go; copying them to the dir below
  install -Dm644 *.ps1 -t "${pkgdir}/usr/share/${pkgname}/completion"
  popd
}

# vim:set ts=2 sw=2 et:
