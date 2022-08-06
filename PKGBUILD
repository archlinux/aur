# Maintainer: unknowndev (unknowndevQwQ at pm dot me)

_pkgname='youki'
pkgname="${_pkgname}-git"
pkgver=0.0.3.r495.g27c6ba3
pkgrel=1
pkgdesc="A container runtime written in rust"
arch=('x86_64')
url='https://github.com/containers/youki'
license=('Apache')
sha512sums=('SKIP')
source=("git+${url}")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('dbus' 'gcc-libs' 'libseccomp')
makedepends=('git' 'dbus-glib' 'libelf' 'pkg-config' 'rust' 'systemd')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # download dependencies
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --all-features --frozen --release ${OPTION} --bin youki

  # generate shell completions
  for shell in bash fish zsh; do
    ./target/release/youki completion --shell "$shell" > "target/$shell-completion"
  done

}

check() {
  cd "${srcdir}/${_pkgname}"
  cargo test --all-features --frozen
}

package() {
  cd "${srcdir}/${_pkgname}"

  install -vDm0755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm0644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # shell completions
  install -vDm644 "target/bash-completion" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -vDm644 "target/fish-completion" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -vDm644 "target/zsh-completion" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
