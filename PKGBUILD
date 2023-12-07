# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

_name=selenium
pkgname=selenium-manager
pkgver=0.4.16
_pkgver=4.16.0
pkgrel=1
pkgdesc='Automated driver and browser maanagement for Selenium'
arch=(x86_64)
url="https://www.selenium.dev"
license=(Apache)
depends=(gcc-libs glibc bzip2)
makedepends=(cargo python)
checkdepends=()
source=("https://github.com/SeleniumHQ/${_name}/archive/refs/tags/${_name}-${_pkgver}.tar.gz")
sha256sums=('8aae1c45d6d8a20dc876503913a9c39766c3c506dcd6d9e4b5bd519be2c20f3f')
options=('!lto')

prepare() {
  cd "${_name}-${_name}-${_pkgver}/rust"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${_name}-${_name}-${_pkgver}/rust"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${_name}-${_name}-${_pkgver}/rust"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/$site_packages/selenium/webdriver/common/linux"
  ln -sf "/usr/bin/$pkgname" "$pkgdir/$site_packages/selenium/webdriver/common/linux"
}
