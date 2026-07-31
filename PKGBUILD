# Maintainer: Gabriel <horizzon3507>
pkgname=usagenometer
# Arch forbids hyphens in pkgver; keep the real SemVer+channel in _pkgver.
_surface=cli
_pkgver=0.1.1-beta
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='AI usage meters in the terminal (Codex, Cursor, Antigravity, Claude, Grok)'
arch=('x86_64' 'aarch64')
url='https://github.com/horizzon3507/usagenometer'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('libnotify: desktop notifications for usg --notify / --alert')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/${_surface}/v${_pkgver}.tar.gz")
sha256sums=('899e13de72411d0687e938d15a0a86ddb7853e9a19106b94f029f7328f862447')

prepare() {
  cd "$pkgname-${_surface}-v${_pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-${_surface}-v${_pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-${_surface}-v${_pkgver}"
  install -Dm755 target/release/usagenometer "$pkgdir/usr/bin/usagenometer"
  install -Dm755 target/release/usg          "$pkgdir/usr/bin/usg"
  install -Dm644 LICENSE                     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md                   "$pkgdir/usr/share/doc/$pkgname/README.md"
}
