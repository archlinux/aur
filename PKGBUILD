# Maintainer: smiley <smiley@aur.archlinux.org>

pkgname=cosmic-ext-applet-caffeine-berchi-git
_pkgname=caffeine-cosmic
pkgver=r7.83fdd93
pkgrel=1
pkgdesc='Caffeine for COSMIC – Prevent screen sleep, display timeout, and system suspend. Native Rust applet with timer options and multiple inhibit modes.'
arch=('x86_64' 'aarch64')
url='https://github.com/Oussamaberchi/caffeine-cosmic'
license=('MIT')
depends=('cosmic-applets')
makedepends=('cargo' 'git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  just build
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  install -Dm755 "target/release/cosmic-caffeine" "$pkgdir/usr/bin/cosmic-caffeine"
  install -Dm644 "assets/com.github.cosmic-caffeine.desktop" "$pkgdir/usr/share/applications/com.github.cosmic-caffeine.desktop"
  install -Dm644 "assets/oussama-berchi-caffeine-cosmic.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/oussama-berchi-caffeine-cosmic.svg"
}
