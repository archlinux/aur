# Maintainer: Max Meinhold <mxmeinhold@gmail.com>

_pkgname=lazybar
pkgname=${_pkgname}-git
pkgver=0.5.1.r10.g2577768
pkgrel=1
pkgdesc="A lightweight, event-driven status bar for EWMH-compliant window managers on X11"
arch=('x86_64')
url="https://github.com/qelxiros/lazybar"
license=('MIT')
backup=("etc/lazybar/config.toml")
provides=("$pkgname")
makedepends=('git' 'cargo')
source=("git+https://github.com/Qelxiros/lazybar")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --match="lazybar-v*" --long --abbrev=7 | sed 's/^lazybar-v//;s/\([^-]*-g\)/r\1/;s/-/./g'
} 


build() {
  cd "${_pkgname}"
  
  cargo build --release --locked --all-features --target-dir=target
}

check () {
  cd "${_pkgname}"

  cargo test --release --locked --target-dir=target
}

package() {
  cd "${_pkgname}"

  install -Dm755 target/release/lazybar -t "${pkgdir}/usr/bin/"
  install -Dm755 target/release/lazybar-msg -t "${pkgdir}/usr/bin/"

  install -Dm644 lazybar-core/examples/config.toml "${pkgdir}/etc/${_pkgname}/config.toml"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim: et ts=2 sw=2
