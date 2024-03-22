_pkgname=mqttui
pkgname=mqttui-git
pkgver=v0.20.0.r12.g494eece
pkgrel=1
pkgdesc="Subscribe to a MQTT Topic or publish something quickly from the terminal"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/${_pkgname}"
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
options=('!lto')
conflicts=('mqttui' 'mqttui-bin')

source=("git+https://github.com/EdJoPaTo/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features
}

package() {
  cd $_pkgname
  install -Dm755 target/release/$_pkgname -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"

  install -Dm644 "target/completions/${_pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}.bash"
  install -Dm644 "target/completions/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "target/completions/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
}
