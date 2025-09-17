# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>
# Contributor: éclairevoyant
# Contributor: Wenxuan Zhang <wenxuangm at gmail dot com>

pkgname=csview
pkgver=1.3.4
pkgrel=1
pkgdesc='Pretty and fast csv viewer for cli with cjk/emoji support'
arch=('x86_64')
url='https://github.com/wfxr/csview'
license=('MIT OR Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('91fadcddef511265f4bf39897ce4a65c457ac89ffd8dd742dc209d30bf04d6aa')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --release --frozen
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "completions/bash/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "completions/fish/${pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm644 "completions/zsh/_${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
