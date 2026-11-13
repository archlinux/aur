# Maintainer: Boris Brock <gabrielborisbrock@gmail.com>
pkgname=soundhive
_appname=SoundHive
pkgver=1.3.0
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
sha256sums=('ca7c1c1cc63871ad0a18c82e8ebbf5addda918df5c66f80e2ed188ee5c288c59')

prepare() {
  cd "$_appname-$pkgver"
  # The source tarball doesn't carry the version, the release tag does
  tools/set-version.sh "$pkgver"
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
