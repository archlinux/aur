# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=caffeine-applet-git
pkgver=0.1.3.r0.g43c44c2
pkgrel=1
pkgdesc="An applet for the COSMIC desktop that prevents your system from going idle"
arch=('x86_64' 'aarch64')
url="https://github.com/codevardhan/caffeine-applet"
license=('MIT')
depends=('cosmic-applets')
makedepends=(
  'cargo'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/codevardhan/caffeine-applet.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
