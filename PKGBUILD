# Maintainer: Michał Moczulski <michalmoczulski at fastmail dot com>

pkgname="moniuszko"
pkgdesc="Music player for GNOME (or any GTK env), inspired by Amarok 1 and Strawberry"
url="https://github.com/michalmoc/moniuszko/"
pkgver="1.2.1"
pkgrel=1
arch=("x86_64")
license=("GPL-3.0-or-later")

depends=(gtk4 libadwaita alsa-lib)
makedepends=(cargo)
source=("https://github.com/michalmoc/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('38bf767600bf94d4120a17b3559f97f20777dfe26d97a2a31ad40d7e8dfc41e2')

options=(!debug !lto)

prepare() {
  cd "$pkgname-$pkgver" || exit

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver" || exit

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export LOCALE_DIR=/usr/share/locale
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver" || exit

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "assets/org.moniuszko.desktop"
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" "assets/org.moniuszko.svg"

  for lang in pl en
  do
    install -Dm0644 -t "$pkgdir/usr/share/locale/$lang/LC_MESSAGES/" "assets/gettext/$lang/LC_MESSAGES/moniuszko.mo"
  done
}