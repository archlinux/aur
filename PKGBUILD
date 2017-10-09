# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Tim Kleinschmidt <tim.kleinschmidt@gmail.com>
# Contributor: Amr Hassan <amr.hassan@gmail.com>
# Contributor: Michael Herold <arch@michaeljherold.com>
# Contributor: Ryan Marcus <ryan@rmarcus.info>

_date() {
  date +'%Y-%m-%d'
}

_xzname='cargo-nightly-x86_64-unknown-linux-gnu'

pkgname='cargo-nightly-bin'
pkgver=20171008
pkgrel=1
pkgdesc="Rust package manager"
url="https://crates.io/"
conflicts=('cargo')
provides=('cargo')
arch=('x86_64' 'i686')
license=('APACHE' 'MIT')
depends=('curl' 'rust')
source_i686=(
"${pkgname}-$(_date).xz::https://static.rust-lang.org/dist/$(_date)/cargo-nightly-i686-unknown-linux-gnu.tar.xz")
source_x86_64=(
"${pkgname}-$(_date).xz::https://static.rust-lang.org/dist/$(_date)/cargo-nightly-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_i686=('SKIP')
sha256sums_x86_64=('SKIP')


pkgver() {
  _date | sed 's/-//g'
}

package() {
  cd "${_xzname}"

  # cargo binary:
  install -d "${pkgdir}/usr/bin"
  install -m 755 cargo/bin/cargo "${pkgdir}/usr/bin/"

  # bash completions:
  install -d "${pkgdir}/etc/bash_completion.d"
  install -m 644 cargo/etc/bash_completion.d/cargo     \
    "${pkgdir}/etc/bash_completion.d/"

  # zsh completions: 
  install -d "${pkgdir}/usr/share/zsh/site-functions"
  install -m 644 cargo/share/zsh/site-functions/_cargo \
    "${pkgdir}/usr/share/zsh/site-functions/"
  
  # Miscellaneous documentation:
  install -d "${pkgdir}/usr/share/doc/cargo"
  install -m 644 cargo/share/doc/cargo/README.md       \
    "${pkgdir}/usr/share/doc/cargo/"

  # man-pages:
  install -d "${pkgdir}/usr/share/man/man1"
  for manpage in cargo/share/man/man1/*.1; do
    install -m 644 "${manpage}" "${pkgdir}/usr/share/man/man1/"
  done

  # Licenses:
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 LICENSE-APACHE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -m 644 LICENSE-MIT    \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -m 644 LICENSE-MIT    \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-THIRD-PARTY"
}

# vim: ts=2 sw=2 et:
