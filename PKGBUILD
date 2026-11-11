# Maintainer: Boris Brock <gabrielborisbrock@gmail.com>
pkgname=soundhive
_appname=SoundHive
pkgver=1.0.0
pkgrel=1
pkgdesc='Fast browser for large sound effect libraries: search, audition, tag and drag sounds'
arch=('x86_64' 'aarch64')
url='https://github.com/BorisBrock/SoundHive'
license=('MIT')
depends=('alsa-lib' 'cairo' 'dbus' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libsoup3' 'webkit2gtk-4.1')
makedepends=('cargo' 'nodejs' 'npm')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e44c1ca758ed8259d43cc8e18ff5a27f85a7d7efc071e19ab3b1d8e32baa2ef3')

prepare() {
  cd "$_appname-$pkgver"
  npm ci --no-audit --no-fund
  cargo fetch --locked --manifest-path src-tauri/Cargo.toml --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_appname-$pkgver"
  # The .deb bundle stages the binary, desktop file and icons in the /usr layout
  npm run tauri build -- --bundles deb
}

package() {
  cd "$_appname-$pkgver"
  cp -a src-tauri/target/release/bundle/deb/*/data/usr "$pkgdir/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
