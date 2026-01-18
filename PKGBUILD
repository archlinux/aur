# Maintainer: Jai Brown (AUR: JaINTP) <dev [at] jaintp [dot] com>
# Contributor: elephantum :https://github.com/elephantum/devpod-community-bin

pkgname="devpod-community-bin"
pkgver=0.9.3
pkgrel=2
pkgdesc="Codespaces but open-source, client-only, and unopinionated - community fork (prebuilt .deb version)"
arch=("x86_64")
url="https://github.com/skevetter/devpod"
license=("MPL-2.0")
options=(!strip)

depends=(
  "gdk-pixbuf2"
  "webkit2gtk-4.1"
  "cairo"
  "glib2"
  "gtk3"
  "pango"
  "hicolor-icon-theme"
  "gcc-libs"
  "libsoup3"
  "glibc"
  "libayatana-appindicator"
)

# This fork installs the same binaries as upstream, so it MUST conflict.
provides=("devpod" "devpod-cli")
conflicts=("devpod" "devpod-bin" "devpod-cli-bin")

source=(
  "${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/DevPod_linux_amd64.deb"
)
sha256sums=('a2154cca50ba8caa710005fabaf6999e2680120c2c2ecf39a5d58d0dcb274d07')

# Naming convention as according to devpod-bin on the AUR: dev-pod-desktop
package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}"

  install -Dm755 "${srcdir}/usr/bin/devpod-cli" \
    "${pkgdir}/usr/bin/devpod-cli"
  install -Dm755 "${srcdir}/usr/bin/DevPod Desktop" \
    "${pkgdir}/usr/bin/dev-pod-desktop"

  install -Dm644 "${srcdir}/usr/share/applications/DevPod.desktop" \
    "${pkgdir}/usr/share/applications/DevPod.desktop"

  sed -i 's|Exec=.*|Exec=/usr/bin/dev-pod-desktop|g' \
    "${pkgdir}/usr/share/applications/DevPod.desktop"
  sed -i 's|Icon=DevPod Desktop|Icon=dev-pod-desktop|g' \
    "${pkgdir}/usr/share/applications/DevPod.desktop"

  # Amazing icon handling by elephantum.
  cd "${srcdir}/usr/share/icons/hicolor"
  find . -name "DevPod Desktop.png" | while read -r icon_path; do
    dir=$(dirname "$icon_path")
    install -Dm644 "$icon_path" "${pkgdir}/usr/share/icons/hicolor/$dir/dev-pod-desktop.png"
  done
}
