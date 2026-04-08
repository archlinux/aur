# Maintainer: Jai Brown (AUR: JaINTP) <dev [at] jaintp [dot] com>
# Contributor: elephantum :https://github.com/elephantum/devpod-community-bin

pkgname="devpod-community-bin"
pkgver=0.18.6
pkgrel=1
pkgdesc="Codespaces but open-source, client-only, and unopinionated - community fork (prebuilt .deb version)"
arch=("x86_64")
url="https://github.com/skevetter/devpod"
license=("MPL-2.0")
install=devpod-community-bin.install
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
  "openssl"
  "libxkbcommon"
  "dbus"
  "libgudev"
)

# This fork installs the same binaries as upstream, so it MUST conflict.
provides=("devpod" "devpod-cli")
conflicts=("devpod" "devpod-bin" "devpod-cli-bin")

source=(
  "${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/DevPod_linux_amd64.deb"
)
sha256sums=('3cb3a799508434c65ed3ca53b723cae37274cb509911f0dcd6f7c4d19458febb')

# Naming convention as according to devpod-bin on the AUR: devpod-desktop
package() {
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}"

  install -Dm755 "${srcdir}/usr/bin/devpod" \
    "${pkgdir}/usr/bin/devpod"
  ln -s /usr/bin/devpod "${pkgdir}/usr/bin/devpod-cli"
  install -Dm755 "${srcdir}/usr/bin/DevPod Desktop" \
    "${pkgdir}/usr/bin/devpod-desktop"

  install -Dm644 "${srcdir}/usr/share/applications/DevPod.desktop" \
    "${pkgdir}/usr/share/applications/DevPod.desktop"

  sed -i 's|Exec=.*|Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 /usr/bin/devpod-desktop|g' \
    "${pkgdir}/usr/share/applications/DevPod.desktop"
  sed -i 's|Icon=DevPod Desktop|Icon=devpod-desktop|g' \
    "${pkgdir}/usr/share/applications/DevPod.desktop"

  # Amazing icon handling by elephantum.
  cd "${srcdir}/usr/share/icons/hicolor"
  find . -name "DevPod Desktop.png" | while read -r icon_path; do
    dir=$(dirname "$icon_path")
    install -Dm644 "$icon_path" "${pkgdir}/usr/share/icons/hicolor/$dir/devpod-desktop.png"
  done
}