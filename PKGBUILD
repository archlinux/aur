# Maintainer: Diptesh Choudhuri <ignisda2001@gmail.com>
# Maintainer: Bartosz Komosiński <contact@montidaproot.xyz>

pkgname=devpod
pkgver=0.5.21
pkgrel=1
pkgdesc="Codespaces but open-source, client-only, and unopinionated - unofficial package"
arch=('x86_64' 'arm64' 'aarch64')
url="https://github.com/loft-sh/devpod"
license=('MPL-2.0')
provides=('devpod' 'devpod-cli')
conflicts=('devpod-bin')
depends=(
    'gdk-pixbuf2'
    'webkit2gtk'
    'cairo'
    'glib2'
    'gtk3'
    'pango'
    'hicolor-icon-theme'
    'gcc-libs'
    'libsoup'
    'glibc'
)
makedepends=(
    'go'
    'rust'
    'nodejs'
    'yarn'
    'base-devel'
    'libappindicator-gtk3'
    'appmenu-gtk-module'
    'libbsd'
    'libxdmcp'
    'libwmf'
    'librsvg'
    'libvips'
    'git'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/loft-sh/devpod/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '873b5b2bb143d2b8fbd40c20b988c264ba2a29f748cf4f7ee94349ec66f29833'
)

prepare() {
    tar -xf ${pkgname}-${pkgver}.tar.gz
    cd "${pkgname}-${pkgver}/desktop/src-tauri"

    # https://github.com/time-rs/time/issues/681
    cargo update time --precise 0.3.36
}

build() {
    cd "${pkgname}-${pkgver}"

    # Build CLI
    CGO_ENABLED=0 go build -v -ldflags "-s -w" -o devpod-cli
    cp devpod-cli desktop/src-tauri/bin/devpod-cli-${CARCH}-unknown-linux-gnu # That took quite a bit to figure out

    cd desktop
    yarn install
    # `-b deb` is used to tell tauri to build only .deb bundle
    yarn tauri build --config src-tauri/tauri-dev.conf.json -b deb
}

package() {
  cd "$srcdir"

  if [ "$CARCH" = "x86_64" ]; then
    local buildplatform="amd64";
  else
    local buildplatform="$CARCH";
  fi

  local builddir="${pkgname}-${pkgver}/desktop/src-tauri/target/release/bundle/deb/dev-pod_0.0.0_${buildplatform}/data"

  install -Dm755 "${builddir}/usr/bin/dev-pod" "${pkgdir}/usr/bin/dev-pod"
  install -Dm755 "${builddir}/usr/bin/devpod-cli" "${pkgdir}/usr/bin/devpod-cli"
  install -Dm755 "${builddir}/usr/share/applications/dev-pod.desktop" "${pkgdir}/usr/share/applications/dev-pod.desktop"
  install -Dm644 "${builddir}/usr/share/icons/hicolor/32x32/apps/dev-pod.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/dev-pod.png"
  install -Dm644 "${builddir}/usr/share/icons/hicolor/128x128/apps/dev-pod.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/dev-pod.png"
  install -Dm644 "${builddir}/usr/share/icons/hicolor/256x256@2/apps/dev-pod.png" "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/dev-pod.png"

}
