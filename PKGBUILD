# Maintainer: Needed!

pkgname=samrewritten-git
pkgver=1.4.1.r0.g4953d56
pkgrel=1
pkgdesc="Unlock achievements and stats on Steam, and more!"
url="https://github.com/PaulCombal/SamRewritten"
license=('GPL-3.0-only')
arch=('x86_64')
makedepends=('rust>=1.95' 'cargo' 'gtk4' 'pkg-config' 'git' 'gettext')
depends=('gtk4')
optdepends=('libadwaita: for Adwaita styling')
source=("git+https://github.com/PaulCombal/SamRewritten.git")
sha256sums=('SKIP')
provides=('samrewritten')
conflicts=('samrewritten')

prepare() {
  cd "${srcdir}/SamRewritten"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${srcdir}/SamRewritten"
  export CARGO_TARGET_DIR=target

  # Might break builds, just let cargo be in charge
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  cargo build --release --frozen
}

pkgver() {
    cd "${srcdir}/SamRewritten"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

package() {
  cd "${srcdir}/SamRewritten"

  install -Dm755 "target/release/samrewritten" "$pkgdir/usr/bin/samrewritten"
  install -Dm644 "assets/icon_64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/samrewritten.png"
  install -Dm644 "assets/icon_256.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/samrewritten.png"
  install -Dm644 "package/samrewritten.desktop" "$pkgdir/usr/share/applications/samrewritten.desktop"
  install -Dm644 "assets/org.samrewritten.SamRewritten.gschema.xml" \
      "$pkgdir/usr/share/glib-2.0/schemas/org.samrewritten.SamRewritten.gschema.xml"

  # Translations compiled by build.rs (locale/<lang>/LC_MESSAGES/samrewritten.mo)
  for mo in locale/*/LC_MESSAGES/samrewritten.mo; do
    [ -e "$mo" ] || continue
    install -Dm644 "$mo" "$pkgdir/usr/share/${mo}"
  done
}
