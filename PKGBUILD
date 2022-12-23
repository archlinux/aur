# Maintainer: Jonas Grawe <shemneidev at gmail dot com>
# Maintainer: Michael Lohr <michael at lohr dot dev>
# shellcheck disable=SC2034,SC2154

pkgname=punktf
pkgver=3.0.0
pkgrel=1
pkgdesc='A cross-platform multi-target dotfiles manager'
arch=(x86_64)
url='https://github.com/Shemnei/punktf'
license=('MIT' 'Apache')
depends=('gcc-libs')
# Version required for `strip`: '1.45.0-nightly' (https://github.com/rust-lang/rust/issues/72110)
makedepends=(cargo)
source=("${pkgname}-${pkgver//_/-}.tar.gz::${url}/archive/v${pkgver//_/-}.tar.gz")
sha512sums=('a926f34f87e1089c4968cb2feec0adfe238ac6d0d6123ed1d20a2e17ebff56483f954bc46a067a8ec3eae542e79469b5b432236d8baafa8dbaaff9200cf16abf')
provides=('punktf')
conflicts=('punktf')

build() {
  cd "${pkgname}-${pkgver//_/-}" || exit 2

  msg "Building binary"

  RUSTFLAGS="-C target-cpu=native" \
    cargo build --release --target-dir "target/"

  msg "Generating man page"

  "target/release/${pkgname}" man

  msg "Generating shell completions"

  "target/release/${pkgname}" completions bash
  "target/release/${pkgname}" completions zsh
  "target/release/${pkgname}" completions fish
}

package() {
  cd "${pkgname}-${pkgver//_/-}" || exit 2

  # Binary
  install -D "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # Documentation
  install -Dm 644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Licenses
  install -Dm 644 "LICENSE-MIT"    -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  # Man Page
  install -Dm 644 "${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

  # Completions
  install -Dm 644 "_${pkgname}"     "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm 644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm 644 "${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}"
}
