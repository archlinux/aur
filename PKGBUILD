# Maintainer: lazywalker <l4zywalk3r@gmail.com>

pkgname=rgrc
pkgver=0.5.1.r2.gdb80e65
pkgrel=1
pkgdesc='Rusty Generic Colouriser - like grc but faster and with more features'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://github.com/lazywalker/rgrc'
license=('MIT')
depends=(
  'glibc'
  'gcc-libs'
)
makedepends=(
  cargo
  git
)
checkdepends=(cargo)
source=("${pkgname}::git+${url}#branch=master")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "${pkgname}"

  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CFLAGS="${CFLAGS} -ffat-lto-objects"
  cargo build --frozen --release --no-default-features

  # Generate shell completions
  target/release/${pkgname} --completions=zsh > etc/zsh.compl
  target/release/${pkgname} --completions=bash > etc/bash.compl
  target/release/${pkgname} --completions=fish > etc/fish.compl

  # Generate man pages
  gzip -fk doc/rgrc.1
}

check() {
  cd "${pkgname}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CFLAGS="${CFLAGS} -ffat-lto-objects"
  cargo test --frozen --release --no-default-features
}

package() {
  cd "${pkgname}"

  # Install binary and config files
  install -Dm 0755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin/"
	install -Dm 0644 etc/rgrc.conf -t "${pkgdir}/etc/"
	install -Dm 0644 share/conf.* -t "${pkgdir}/usr/share/${pkgname}/"

  # Install shell completions
  install -Dm 0644 etc/zsh.compl -t "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}/"
  install -Dm 0644 etc/bash.compl -t "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm 0644 etc/fish.compl -t "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"

  # Install man pages
	install -Dm 0644 doc/rgrc.1.gz -t "${pkgdir}/usr/share/man/man1/"

  # Install license
	install -Dm 0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
