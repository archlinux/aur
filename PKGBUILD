# Maintainer: liv <aur@insects.institute>
pkgname=gg-jujutsu

pkgver=0.35.2
pkgrel=2
pkgdesc='A GUI for the version control system Jujutsu.'
arch=(x86_64 aarch64)
url='https://github.com/gulbanana/gg'
license=(Apache-2.0)
depends=(
  gdk-pixbuf2
  glibc
  glib2
  gtk3
  pango
  webkit2gtk-4.1
)
makedepends=(
  cargo
  git
  npm
)
provides=(gg-jujutsu)
conflicts=(
  gg-jujutsu-bin
)

source=("gg::git+https://github.com/gulbanana/gg.git#tag=v${pkgver}")
b2sums=('bcae3d9698ed21a612d6a02a3daedeb639e12a1fe8cd09cb841e2310560847a4d6936755a6ddbcf8a706be4afe772a4aa9fc1567e52d5768e0a9bf2050d9c35f')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "${srcdir}/gg/src-tauri/"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  export GG_VERSION="${pkgver}"
  export TAURI_APP_PATH="${srcdir}/gg/src-tauri/"

  cd "${srcdir}/gg/"
  npm ci
  npm run tauri build -- --bundles deb
}

package() {
  cp -a \
    "${srcdir}/gg/src-tauri/target/release/bundle/deb/gg_${pkgver}_"*/data/usr/ \
    "${pkgdir}/usr/"
  install -Dm644 \
    "${srcdir}/gg/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
