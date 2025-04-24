# Maintainer: Grayson Hieb <graysonhieb21@gmail.com> 

pkgname=bevy_audioviz
_pkgname_crate=bevy_audioviz # Crate name matches package name
pkgver=0.1.1 # Will be updated for new releases
pkgrel=1
pkgdesc="High-performance, configurable, shader-based audio visualizer using Bevy."
arch=('x86_64') # Add others if supported, e.g., aarch64
url="https://github.com/Lowband21/bevy_audioviz"
license=('MIT')
depends=('alsa-lib' 'libxkbcommon' 'wayland' 'vulkan-icd-loader') # Runtime dependencies
makedepends=('cargo') # Build-time dependencies
provides=("${pkgname}")
conflicts=("${pkgname}-git") # Avoid conflicts with a potential VCS package

# Source URLs: GitHub tarball based on tag, local icon, local desktop file
# Assumes you create git tags like v0.1.0, v0.1.1 etc.
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "AppIcon.png"
        "bevy_audioviz.desktop"
        "bevy_audioviz.sh") # Wrapper script
sha256sums=('44f3d226780752b930099714b6491668bef1004ecbbae0119c01a2518f687f12'
            'e0bd54269236010266a0df40e91c6eca2caf5467bbdbbcb381ace68d365f8c0d'
            '710eb70e1b209482f8ebb79cee84b5835160b848977140628c53ac1939350cd8'
            '4ba4c52c4de822c3cf38bb5a87cfd3c5ef2c34c94a80273aaca8083bcb38ea5e')

prepare() {
  cd "${pkgname}-${pkgver}"
  # No patching needed currently
}

build() {
  cd "${pkgname}-${pkgver}"
  # Build with cargo, using locked dependencies for reproducibility
  # Consider adding --all-features if applicable
  cargo build --release --locked --frozen
}

# Optional but recommended: Run tests if available
# check() {
#   cd "${pkgname}-${pkgver}"
#   cargo test --release --locked --frozen
# }

package() {
  cd "${pkgname}-${pkgver}"

  # Install the actual binary to /usr/lib
  install -Dm755 "target/release/${_pkgname_crate}" "${pkgdir}/usr/lib/${pkgname}/${pkgname}_bin"

  # Install the wrapper script to /usr/bin
  install -Dm755 "../bevy_audioviz.sh" "${pkgdir}/usr/bin/${pkgname}"

  # Install assets
  install -d "${pkgdir}/usr/share/${pkgname}"
  cp -r "assets" "${pkgdir}/usr/share/${pkgname}/"

  # Install license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install icon (using 512x512 as a common size, adjust if needed)
  # Consider resizing the source PNG if it's very large
  install -Dm644 "../AppIcon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

  # Install desktop entry
  install -Dm644 "../bevy_audioviz.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
