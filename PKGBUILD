# Maintainer: Hajos Attila <linux[dot]alucard[at]gmail[dot]com>

pkgname=somars-git
_pkgname=somars
pkgver=0.2.2.r0.g6b1d281
pkgrel=1
pkgdesc="Soma.fm player for your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/skammer/somars"
license=('MIT')
depends=('gcc-libs' 'glibc' 'alsa-lib')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' || printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  export CARGO_HOME="${srcdir}/cargo"
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  export CARGO_HOME="${srcdir}/cargo"
  cargo build --frozen --release || cargo build --offline --release
}

check() {
  cd "$_pkgname"
  export CARGO_HOME="${srcdir}/cargo"
  cargo test --offline
}

package() {
  cd "$_pkgname"
  install -Dm755 "target/release/$_pkgname" -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/" 2>/dev/null || true
}
