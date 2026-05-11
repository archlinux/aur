# Maintainer: Carlos Prieto <prietus@live.com>
pkgname=mopytui-git
_pkgname=mopytui
pkgver=r1.0000000
pkgrel=1
pkgdesc="A feature-rich TUI client for Mopidy with cover art rendering "
arch=('x86_64' 'aarch64')
url="https://github.com/prietus/mopytui"
license=('MIT')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'git'
  'rust'
  'cargo'
)
optdepends=(
  'mopidy: server this client connects to'
  'chafa: better halfblocks rendering on terminals without Kitty/iTerm2/Sixel'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
options=('!lto')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="${srcdir}/target"
  cargo build --release --locked
}

package() {
  cd "${_pkgname}"

  install -Dm755 "${srcdir}/target/release/${_pkgname}" \
    "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 README.md \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
