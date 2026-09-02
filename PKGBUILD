# Maintainer: Jon Kinney
#
# Source of truth for the AUR `mousehop` package. The aur-publish.yml
# workflow copies this file, pins pkgver/pkgrel to the release,
# refreshes sha256sums with updpkgsums, regenerates .SRCINFO, and
# pushes to the AUR. Edit depends / package() etc. here — never in the
# AUR repo directly.
pkgname=mousehop
pkgver=0.17.0
pkgrel=1
pkgdesc='Software KVM Switch / mouse & keyboard sharing software for Local Area Networks'
arch=('x86_64')
url='https://github.com/jondkinney/mousehop'
license=('GPL-3.0-or-later')
depends=('libadwaita' 'gtk4' 'libx11' 'libxtst' 'glib2' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
makedepends=('rust')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6409f213deefe8e3133ad903a54f916ba5e58fa3fcaa65eaaa59d65af00bf8f0')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/mousehop "$pkgdir/usr/bin/mousehop"
  install -Dm644 mousehop/com.mousehop.Mousehop.desktop "$pkgdir/usr/share/applications/com.mousehop.Mousehop.desktop"
  install -Dm644 mousehop-gtk/resources/com.mousehop.Mousehop.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.mousehop.Mousehop.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
}
