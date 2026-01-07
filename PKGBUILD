# Maintainer: liv <aur@insects.institute>
pkgname=gg-jujutsu

pkgver=0.36.4
pkgrel=1
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
b2sums=('f9b13e08d4142c42bac2b83bbb209e61fa123b1bab54a9d0329749f4d33f20310e527775bf2d91e6ff7b0ca4abec34d6d5a8267ec7a82a46d0f85fc35995f734')

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
