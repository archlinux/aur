# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: grdgkjrpdihe

pkgname=softu2f-git
pkgver=0.4.2+9.ga19b0084d6
pkgrel=1
pkgdesc="Software U2F HID token daemon (rust-u2f) (git version)"
url="https://github.com/danstiner/rust-u2f"
arch=(x86_64)
depends=(libdbus libsystemd openssl)
makedepends=(git rust clang llvm)
source=("git+$url"
        softu2f_system.preset)
sha256sums=('SKIP'
            '194758607e4d9dccd6a22382264db643aff5c08cfa9c2fa0a69caa4a2d03432e')
install=$pkgname.install
provides=(softu2f=${pkgver%+*})
conflicts=(softu2f)

prepare() {
  cd rust-u2f
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
  sed -i 's,/libexec/,/lib/,' linux/{system,user}-daemon/softu2f.service
}

pkgver() {
  cd rust-u2f
  git describe --tags --abbrev=10 | sed 's/^v//; s/-/+/; s/-/./'
}

build() {
  cd rust-u2f
  RUSTUP_TOOLCHAIN=stable \
  CARGO_TARGET_DIR=target \
  cargo build --frozen --locked --release --all-features
}

package() {
  pushd rust-u2f

  install -Dm 755 target/release/softu2f-user-daemon \
                  "$pkgdir"/usr/lib/softu2f/user-daemon

  install -Dm 755 target/release/softu2f-system-daemon \
                  "$pkgdir"/usr/lib/softu2f/system-daemon

  install -Dm 644 linux/user-daemon/softu2f.service \
                  "$pkgdir"/usr/lib/systemd/user/softu2f.service

  install -Dm 644 linux/system-daemon/softu2f.service \
                  "$pkgdir"/usr/lib/systemd/system/softu2f.service

  install -Dm 644 linux/system-daemon/softu2f.socket \
                  "$pkgdir"/usr/lib/systemd/system/softu2f.socket

  install -Dm 644 linux/system-daemon/softu2f-tmpfiles.conf \
                  "$pkgdir"/usr/lib/tmpfiles.d/softu2f.conf

  popd

  install -Dm 644 softu2f_system.preset \
                  "$pkgdir"/usr/lib/systemd/system-preset/90-softu2f.preset
}
