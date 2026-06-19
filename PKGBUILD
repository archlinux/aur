# Maintainer: Xhelliom
pkgname=aur-guard
pkgver=0.1.1
pkgrel=1
pkgdesc="Garde-fou de sécurité pour les mises à jour AUR : délai, whitelist, scan statique et review IA du diff PKGBUILD"
arch=('x86_64' 'aarch64')
url="https://github.com/Xhelliom/aur-guard"
license=('MIT')
# gtk4 + libadwaita servent au binaire aur-guard-gui (compilé par défaut)
depends=('gtk4' 'libadwaita' 'gcc-libs' 'glibc')
makedepends=('cargo' 'gettext')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
# Remplacé par updpkgsums une fois le tag v$pkgver publié (le CI le fait tout seul).
sha256sums=('c2065c3c78062a905ce5fbf57f3e92c93f9698b023d48793634eb2638d6782a4')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # features par défaut = tui + gui → produit aur-guard ET aur-guard-gui
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 target/release/aur-guard     "$pkgdir/usr/bin/aur-guard"
  install -Dm755 target/release/aur-guard-gui "$pkgdir/usr/bin/aur-guard-gui"

  install -Dm644 data/fr.xhelliom.AurGuard.desktop \
    "$pkgdir/usr/share/applications/fr.xhelliom.AurGuard.desktop"
  install -Dm644 data/fr.xhelliom.AurGuard.svg \
    "$pkgdir/usr/share/icons/hicolor/scalable/apps/fr.xhelliom.AurGuard.svg"

  # Catalogues de traduction — domaine gettext "aur-guard" (cf. po/install.sh).
  for po in po/*.po; do
    lang="$(basename "$po" .po)"
    install -dm755 "$pkgdir/usr/share/locale/$lang/LC_MESSAGES"
    msgfmt "$po" -o "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/aur-guard.mo"
  done

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
