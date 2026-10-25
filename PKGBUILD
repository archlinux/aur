# Maintainer: smiley <smiley@archlinux.org>
pkgname=caffeine-applet
pkgver=0.1.2
pkgrel=1
pkgdesc="COSMIC panel applet that keeps the system awake via a logind inhibitor lock"
arch=('x86_64' 'aarch64')
url="https://github.com/codevardhan/caffeine-applet"
license=('MIT')
depends=('cosmic-panel' 'glibc' 'libgcc' 'libglvnd' 'libxkbcommon' 'systemd' 'wayland')
makedepends=('cargo' 'git' 'just')
conflicts=("$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5e3657e04dac7e810d2f13cc5a7587f89bd3ba99f1bcb9a0d11a50def954aa1f')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  just build-release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  just rootdir="$pkgdir" install

  # AppStream metadata belongs in /usr/share/metainfo, not the legacy appdata dir
  install -d "$pkgdir/usr/share/metainfo"
  mv "$pkgdir/usr/share/appdata/com.github.codevardhan.caffeine-applet.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/"
  rmdir "$pkgdir/usr/share/appdata"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
