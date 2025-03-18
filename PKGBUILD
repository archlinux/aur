pkgname=softu2f
pkgver=0.4.2.r22.gda1c12d
pkgrel=2
pkgdesc="Software U2F HID token daemon (rust-u2f)"
url="https://github.com/danstiner/rust-u2f"
arch=(x86_64)
depends=(libdbus libsystemd openssl)
makedepends=(clang llvm rust)
options=('!lto')
_commit=da1c12db6167f51c46091d45a274a56ab67e45e7
source=("git+https://github.com/danstiner/rust-u2f#commit=$_commit"
        softu2f_system.preset)
sha256sums=('SKIP'
            '194758607e4d9dccd6a22382264db643aff5c08cfa9c2fa0a69caa4a2d03432e')
install=$pkgname.install

pkgver() {
  cd rust-u2f
  git describe --tags | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd rust-u2f/linux
  env CARGO_INCREMENTAL=0 cargo build --release --locked
  sed -i 's,/libexec/,/lib/,' *-daemon/softu2f.service
}

package() {
  cd rust-u2f

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

  install -Dm 644 "$srcdir"/softu2f_system.preset \
                  "$pkgdir"/usr/lib/systemd/system-preset/90-softu2f.preset
}

# vim: ts=2:sw=2:et
