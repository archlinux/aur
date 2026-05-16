pkgname=autolon
pkgver=0.1.4
pkgrel=1
pkgdesc='Native Linux autoclicker and local input automation controller'
arch=('x86_64')
url='https://github.com/daveottley/autolon'
license=('MIT')
depends=('acl' 'gtk4' 'libxtst')
makedepends=('cargo' 'git')
conflicts=('autolon-bin')
install=autolon.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('205c569a52fd153e4af0379f4b694cecb0ba4c89b7756ae075bbb960ddc41695')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTFLAGS="${RUSTFLAGS:-} -C target-cpu=native"
  cargo build --release --locked --offline
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  export RUSTFLAGS="${RUSTFLAGS:-} -C target-cpu=native"
  cargo test --locked --offline
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/autolon "$pkgdir/usr/bin/autolon"
  install -Dm644 packaging/linux/io.github.autolon.Autolon.desktop \
    "$pkgdir/usr/share/applications/io.github.autolon.Autolon.desktop"
  install -Dm644 packaging/linux/io.github.autolon.Autolon.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.autolon.Autolon.svg"
  install -Dm644 packaging/linux/io.github.autolon.Autolon.metainfo.xml \
    "$pkgdir/usr/share/metainfo/io.github.autolon.Autolon.metainfo.xml"
  install -Dm644 packaging/linux/autolon.service \
    "$pkgdir/usr/lib/systemd/user/autolon.service"
  install -Dm644 packaging/linux/70-autolon-uinput.rules \
    "$pkgdir/usr/lib/udev/rules.d/70-autolon-uinput.rules"
  install -Dm644 packaging/linux/autolon.sysusers \
    "$pkgdir/usr/lib/sysusers.d/autolon.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/autolon/LICENSE"
}
