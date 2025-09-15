# Maintainer: clove3am (aka: Caltlgin) <clove.dev.mailbox.org>
# Contributor: Wenxuan <wenxuangm@gmail.com>

_pkgname='csview'
pkgname='csview-git'
pkgver=1.3.4.r7.g8ac4de0
pkgrel=1
pkgdesc='Pretty and fast csv viewer for cli with cjk/emoji support'
arch=('x86_64')
url='https://github.com/wfxr/csview'
license=('MIT OR Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'cargo'
  'git'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}"
  cargo build --release --frozen
}

package() {
  cd "${pkgname}"
  install -Dm755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "completions/bash/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "completions/fish/${_pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d"
  install -Dm644 "completions/zsh/_${_pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 "LICENSE-MIT" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm644 "LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

