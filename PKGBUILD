# Maintainer: soloturn <soloturn@gmail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-comp-git
pkgver=r449.8f6ad62
pkgrel=1
pkgdesc="Compositor for the COSMIC desktop environment"
arch=('x86_64' 'aarch64')
url="https://github.com/pop-os/cosmic-comp"
license=('GPL3')
groups=('cosmic')
depends=('libseat.so' 'libinput' 'libxkbcommon' 'mesa' 'systemd' 'wayland')
makedepends=('cargo' 'git')
optdepends=('cosmic-session')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-comp.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  make all
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
