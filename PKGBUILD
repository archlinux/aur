# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=apphub-git
pkgver=1.0.0.alpha.2.r26.g0879260
pkgrel=1
pkgdesc="Simplifies the installation and management of AppImages"
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/app-hub"
license=('MIT')
depends=(
  'hicolor-icon-theme'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'desktop-file-utils'
  'git'
  'just'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cosmic-utils/app-hub.git')
sha256sums=('SKIP')

pkgver() {
  cd app-hub
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd app-hub
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

  # Set StartupWMClass
  desktop-file-edit --set-key=StartupWMClass --set-value=com.app_hub.AppHub \
    "res/${pkgname%-git}.desktop"
}

build() {
  cd app-hub
  export RUSTUP_TOOLCHAIN=stable
  just build-release --frozen
}

package() {
  cd app-hub
  just rootdir="$pkgdir" install

  install -Dm644 "res/${pkgname%-git}.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/com.francescogaglione.${pkgname%-git}.metainfo.xml"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
