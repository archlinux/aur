# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
pkgname=pacdef-git
_pkgname=pacdef
pkgver=1.6.0+r12.g7e85bc3
pkgrel=1
pkgdesc='multi-backend declarative package manager for Linux'
url="https://github.com/steven-omaha/${_pkgname}"
source=("git+https://github.com/steven-omaha/${_pkgname}")
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
conflicts=('pacdef' 'pacdef-bin')
provides=('pacdef')
makedepends=('git' 'rust')
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  cargo build --release --features arch
}

check() {
  cd "${srcdir}/${_pkgname}"
  cargo test --release --workspace --features arch
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 target/release/pacdef "${pkgdir}/usr/bin/pacdef"
  install -Dm644 _completion.zsh "${pkgdir}/usr/share/zsh/site-functions/_pacdef"

  install -Dm644 man/pacdef.8 "${pkgdir}/usr/share/man/man8/pacdef.8"
  install -Dm644 man/pacdef.toml.5 "${pkgdir}/usr/share/man/man5/pacdef.toml.5"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --match "v*" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/+/;s/-/./g'
}

