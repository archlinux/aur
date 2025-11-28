# Maintainer: lazywalker <l4zywalk3r@gmail.com>

pkgname=rgrc
pkgver=0.4.3.r0.g4197800
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

  # Install man pages
	install -Dm 0644 doc/rgrc.1 -t "${pkgdir}/usr/share/man/man1/"

  # Install license
	install -Dm 0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
