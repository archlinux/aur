# Maintainer: Tai Zeming <tai.zeming@pithos.net>

pkgname=wkeys-git
pkgver=0.1.0.r21.ga4aaf8b
pkgrel=1
pkgdesc="An on-screen keyboard for wayland desktop and a corresponding Cosmic applet written by rust."
arch=(x86_64 aarch64)
url="https://github.com/ptazithos/wkeys"
license=(MIT)
depends=(gtk4 gtk4-layer-shell)
makedepends=(rust git makepkg-git-lfs-proto)
provides=(${pkgname%-git}=${pkgver})
source=(${pkgname%-git}::git-lfs+$url.git)
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd ${pkgname%-git}
  # Tuning cargo
  export CARGO_HOME=${srcdir}/${pkgname%-git}/.cargo    # Download all to src directory, not in ~/.cargo

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd ${pkgname%-git}

  # Tuning cargo
  export CARGO_HOME=${srcdir}/${pkgname%-git}/.cargo    # Use downloaded earlier from src directory, not from ~/.cargo
  export CARGO_TARGET_DIR=target                        # Place the output in target relative to the current directory

  cargo build --frozen --release
}

package() {
  cd ${pkgname%-git}
  install -Dm755 target/release/${pkgname%-git}                       -t ${pkgdir}/usr/bin/
  install -Dm755 target/release/cosmic-applet-wkeys                   -t ${pkgdir}/usr/bin/
  install -Dm644 cosmic-applet/assets/wkeys-applet.desktop            -t ${pkgdir}/usr/share/applications
}
