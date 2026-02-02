# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

_name=selenium
pkgname=selenium-manager
pkgver=0.4.40
_pkgver=4.40.0
pkgrel=2
pkgdesc='Automated driver and browser management for Selenium'
arch=(x86_64)
url="https://www.selenium.dev"
license=(Apache-2.0)
depends=(gcc-libs glibc bzip2 zlib)
makedepends=(cargo python)
checkdepends=()
source=("https://github.com/SeleniumHQ/${_name}/archive/refs/tags/${_name}-${_pkgver}.tar.gz")
sha256sums=('58b4ed9bb4ee32af993e8e72fc29bf74ee5f3b67979d63b391b83b054d959f5e')
options=('!lto')

prepare() {
  cd "${_name}-${_pkgver}/${_name}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${_name}-${_pkgver}/${_name}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${_name}-${_pkgver}/${_name}"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir/$site_packages/selenium/webdriver/common/linux"
  ln -sf "/usr/bin/$pkgname" "$pkgdir/$site_packages/selenium/webdriver/common/linux"
}
