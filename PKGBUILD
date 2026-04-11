pkgname=taskers-git
pkgver=0.6.0.r0.g6ad8cc4
pkgrel=1
pkgdesc='Agent-first terminal workspace (dev branch build)'
arch=('x86_64')
url='https://github.com/OneNoted/taskers'
license=('MIT')
options=('!lto')
depends=('glibc' 'gtk4' 'libadwaita' 'webkitgtk-6.0')
makedepends=('git' 'rust' 'zig' 'meson' 'ninja' 'blueprint-compiler')
optdepends=(
  'niri: focus an existing Taskers window from desktop launches'
  'xdg-desktop-portal-gtk: improve desktop portal support'
)
provides=('taskers')
conflicts=('taskers' 'taskers-bin')
source=(
  'git+https://github.com/OneNoted/taskers.git#branch=dev'
  'taskers-build-runtime.patch'
  'taskers.desktop'
  'taskers-wrapper.sh'
  'taskers.svg'
  'LICENSE'
)
sha256sums=(
  'SKIP'
  '566466fd7ce12b196e8e66fd9bd5302d78d804ca37cdfa186df102011df2de36'
  '2902765627b7976f589ea4edf50f2468b45900225197b452e70f9bbae4eaa476'
  '83c76f0c92d4c1a2f13e70fb1f18da089a01726ecbb2b7a67bae9ad0a677778b'
  '019a8646c7b6b93cb375ca012e5e8cf615f2d6b164f404e8b2a99b0d7d1a2936'
  'b0dde23d2f2c9d247848720ae985ef83e40d4eeb6b2b6b662423a1bad390019b'
)

prepare() {
  cd taskers
  if ! grep -q 'TASKERS_GHOSTTY_SKIP_BUILD_RUNTIME_EMBED' crates/taskers-ghostty/build.rs; then
    patch -Np1 -i "${srcdir}/taskers-build-runtime.patch"
  fi
}

pkgver() {
  cd taskers
  git describe --long --tags --abbrev=7 --match 'v[0-9]*' | sed 's/^v//; s/-/.r/; s/-/./'
}

build() {
  cd taskers
  bash scripts/build_linux_bundle.sh x86_64-unknown-linux-gnu "${srcdir}/dist"
}

package() {
  local upstream_ver bundle_asset

  upstream_ver="$(sed -n 's/^version = "\(.*\)"/\1/p' "${srcdir}/taskers/Cargo.toml" | head -n1)"
  bundle_asset="${srcdir}/dist/taskers-linux-bundle-v${upstream_ver}-x86_64-unknown-linux-gnu.tar.xz"

  install -dm755 "${pkgdir}/opt/taskers" \
    "${pkgdir}/usr/bin" \
    "${pkgdir}/usr/share/applications" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps" \
    "${pkgdir}/usr/share/licenses/${pkgname}"

  bsdtar -xf "${bundle_asset}" -C "${pkgdir}/opt/taskers"

  install -Dm755 "${srcdir}/taskers-wrapper.sh" "${pkgdir}/usr/bin/taskers"
  install -Dm755 "${srcdir}/taskers-wrapper.sh" "${pkgdir}/usr/bin/taskersctl"
  install -Dm755 "${srcdir}/taskers-wrapper.sh" "${pkgdir}/usr/bin/taskers-terminald"
  install -Dm644 "${srcdir}/taskers.desktop" \
    "${pkgdir}/usr/share/applications/dev.taskers.app.desktop"
  install -Dm644 "${srcdir}/taskers.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/taskers.svg"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
