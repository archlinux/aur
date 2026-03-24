# Maintainer: Juan Simon <play4pro at proton dot me>

pkgname=krokiet-git
pkgver=r714.7680c071
pkgrel=1
pkgdesc='Multi functional app to find duplicates, empty folders, similar images etc. (Desktop App, Slint frontend)'
url='https://github.com/qarmin/czkawka/tree/master/krokiet'
arch=(x86_64)
license=('LicenseRef-MIT AND GPL-3.0-only AND CC-BY-4.0')
provides=(krokiet)
conflicts=(krokiet)
depends=(
  libgcc
  glibc
  libheif
  hicolor-icon-theme
)
makedepends=(
  cargo
  git
  rust
)
source=("git+https://github.com/qarmin/czkawka.git")
b2sums=('SKIP')

pkgver() {
  cd czkawka
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd czkawka

  export CARGO_HOME="${srcdir}/cargo"

  cargo build \
    --bin krokiet \
    --features "heif,winit_skia_opengl" \
    --release
}

package() {
  install -Dm644 "${srcdir}/czkawka/krokiet/LICENSE_CC_BY_4_ICONS" \
        "${pkgdir}/usr/share/licenses/krokiet/LICENSE_CC_BY_4_ICONS"
  install -Dm644 "${srcdir}/czkawka/krokiet/LICENSE_GPL_APP" \
        "${pkgdir}/usr/share/licenses/krokiet/LICENSE_GPL_APP"
  install -Dm644 "${srcdir}/czkawka/krokiet/LICENSE_MIT_CODE" \
        "${pkgdir}/usr/share/licenses/krokiet/LICENSE_MIT_CODE"

  install -Dm755 "${srcdir}/czkawka/target/release/krokiet" \
        "${pkgdir}/usr/bin/krokiet"

  install -Dm644 "${srcdir}/czkawka/data/io.github.qarmin.krokiet.desktop" \
        "${pkgdir}/usr/share/applications/io.github.qarmin.krokiet.desktop"

  install -Dm644 "${srcdir}/czkawka/data/io.github.qarmin.krokiet.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/io.github.qarmin.krokiet.metainfo.xml"

  install -Dm644 "${srcdir}/czkawka/data/icons/io.github.qarmin.krokiet.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.qarmin.krokiet.svg"
}
