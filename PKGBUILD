# Maintainer: liv <aur@insects.institute>
pkgname=gg-jujutsu

pkgver=0.36.2
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
b2sums=('7d866724822ea53e263450d167a199bbeeaddbfa784bfd67e68ec88bd07a303bcd779fe27ce7d4f1c1216bf903e474f59d90c97087a6b3b563b56d121075aa98')

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
