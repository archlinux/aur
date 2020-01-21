pkgname=softu2f
pkgver=0.4.0.r3.g14a6ed0
pkgrel=1
pkgdesc="Software U2F HID token daemon (rust-u2f)"
arch=(x86_64)
depends=(libdbus libsystemd openssl)
makedepends=(clang llvm rust)
_commit=14a6ed0ffb63a4c440d27edd5ffc132f6f3ee623
source=("git+https://github.com/danstiner/rust-u2f#commit=$_commit")
sha256sums=(SKIP)

pkgver() {
  cd rust-u2f
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd rust-u2f/linux
  cargo build --release
}

package() {
  cd rust-u2f/linux

  install -Dm 755 target/release/softu2f-user-daemon \
                  "$pkgdir"/usr/libexec/softu2f/user-daemon

  install -Dm 755 target/release/softu2f-system-daemon \
                  "$pkgdir"/usr/libexec/softu2f/system-daemon

  install -Dm 644 user-daemon/softu2f.service \
                  "$pkgdir"/usr/lib/systemd/user/softu2f.service

  install -Dm 644 system-daemon/softu2f.service \
                  "$pkgdir"/usr/lib/systemd/system/softu2f.service

  install -Dm 644 system-daemon/softu2f.socket \
                  "$pkgdir"/usr/lib/systemd/system/softu2f.socket

  install -Dm 644 system-daemon/softu2f-tmpfiles.conf \
                  "$pkgdir"/usr/lib/tmpfiles.d/softu2f.conf
}

# vim: ts=2:sw=2:et
