# Maintainer: Mücahit Şahin <mucahitsahin786@gmail.com>
pkgname=kick-lite
pkgver=0.2.0
pkgrel=1
pkgdesc='A lightweight Kick.com livestream and replay player'
arch=('x86_64')
url='https://github.com/mucahit-sahin/kick-linux'
license=('MIT')
depends=('gtk4' 'libadwaita' 'mpv' 'libglvnd' 'hicolor-icon-theme')
# gtk4/libadwaita provide the pkg-config files used by the Rust GTK crates;
# mpv provides libmpv and libglvnd provides libEGL/libGL, all needed at link time.
makedepends=('rust' 'cargo' 'pkgconf' 'gtk4' 'libadwaita' 'mpv' 'libglvnd')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('12788822b30cb07c8de1354f29a433f558267bb17312d200ae2bc72df6221988')

build() {
  cd "$srcdir/kick-linux-$pkgver"
  # Some distros (e.g. CachyOS) add -flto to the default CFLAGS. The `ring`
  # crate (rustls -> ureq) compiles a C static library which would then contain
  # GCC LTO bytecode that rust-lld cannot read, causing undefined ring_core_*
  # symbols at link time. Strip LTO from the flags passed to the `cc` crate.
  export CFLAGS="$(printf '%s' "$CFLAGS" | sed -E 's/(^| )-flto[^ ]*//g')"
  cargo build --release --locked
}

package() {
  cd "$srcdir/kick-linux-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 io.github.kicklite.KickLite.desktop \
    "$pkgdir/usr/share/applications/io.github.kicklite.KickLite.desktop"
  install -Dm644 io.github.kicklite.KickLite.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.kicklite.KickLite.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
