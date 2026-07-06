# Maintainer: Xhelliom
pkgname=aurveto
pkgver=0.3.1
pkgrel=1
pkgdesc="Security gate for AUR updates: delay, whitelist, static scan and AI review of the PKGBUILD diff"
arch=('x86_64' 'aarch64')
url="https://github.com/Xhelliom/aurveto"
license=('MIT')
# gtk4 + libadwaita are used by the aurveto-gui binary (built by default)
depends=('gtk4' 'libadwaita' 'gcc-libs' 'glibc')
makedepends=('cargo' 'gettext')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Replaced by updpkgsums once the v$pkgver tag is published (CI does it automatically).
sha256sums=('289a605e83259f3379c3974e3666e84fe2eb75072f7e03f6e80fc0d454fee0ab')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # default features = tui + gui → produces both aurveto AND aurveto-gui
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/aurveto     "$pkgdir/usr/bin/aurveto"
  install -Dm755 target/release/aurveto-gui "$pkgdir/usr/bin/aurveto-gui"

  install -Dm644 data/fr.xhelliom.AurVeto.desktop \
    "$pkgdir/usr/share/applications/fr.xhelliom.AurVeto.desktop"
  install -Dm644 data/fr.xhelliom.AurVeto.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/fr.xhelliom.AurVeto.svg"

  # Translation catalogs — gettext domain "aurveto" (see po/install.sh).
  for po in po/*.po; do
    lang="$(basename "$po" .po)"
    install -dm755 "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
    msgfmt "$po" -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/aurveto.mo"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
