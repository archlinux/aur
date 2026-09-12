# Maintainer: Stefanie Jane <stef@hyperbliss.tech>
# https://github.com/hyperb1iss/hypercolor

pkgname=hypercolor-bin
pkgver=0.5.1
pkgrel=1
pkgdesc='Open-source RGB lighting orchestration engine for Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperb1iss/hypercolor'
license=('Apache-2.0')
depends=(
  'dbus'
  'systemd'
  'gcc-libs'
  'glibc'
  'gtk3'
  'webkit2gtk-4.1'
  'libappindicator-gtk3'
  'libayatana-appindicator'
)
optdepends=(
  'libusb: USB device support'
  'i2c-tools: SMBus/I2C RGB memory module support'
)
provides=('hypercolor')
conflicts=('hypercolor')
install=hypercolor.install

_base_url="https://github.com/hyperb1iss/hypercolor/releases/download/v${pkgver}"

source_x86_64=("${_base_url}/hypercolor-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${_base_url}/hypercolor-${pkgver}-linux-arm64.tar.gz")

# Template placeholders are replaced by the release workflow.
sha256sums_x86_64=('5f4102f3ea07d2cd96d019bd431fbddd7d8155ebbee1cb623ae2bbfe010cfd75')
sha256sums_aarch64=('29f71b267e118e4d43f42952427f135159c86b0f6b954fdb6444840c0c143e2f')

package() {
  local _srcdir

  if [[ "${CARCH}" == "x86_64" ]]; then
    _srcdir="hypercolor-${pkgver}-linux-amd64"
  else
    _srcdir="hypercolor-${pkgver}-linux-arm64"
  fi

  cd "${_srcdir}"

  # Binaries
  install -Dm755 bin/hypercolor-daemon "${pkgdir}/usr/bin/hypercolor-daemon"
  install -Dm755 bin/hypercolor        "${pkgdir}/usr/bin/hypercolor"
  install -Dm755 bin/hypercolor-app    "${pkgdir}/usr/bin/hypercolor-app"
  install -Dm755 bin/hypercolor-tui    "${pkgdir}/usr/bin/hypercolor-tui"
  install -Dm755 bin/hypercolor-open   "${pkgdir}/usr/bin/hypercolor-open"

  # Web UI + bundled assets
  install -dm755 "${pkgdir}/usr/share/hypercolor"
  cp -R share/hypercolor/ui      "${pkgdir}/usr/share/hypercolor/"
  cp -R share/hypercolor/effects "${pkgdir}/usr/share/hypercolor/"

  # Desktop entry
  install -Dm644 share/applications/hypercolor.desktop \
    "${pkgdir}/usr/share/applications/hypercolor.desktop"

  # Icons (the scalable SVG ships once the traced vector lands; see e1bd5c14)
  if [[ -f share/icons/hicolor/scalable/apps/hypercolor.svg ]]; then
    install -Dm644 share/icons/hicolor/scalable/apps/hypercolor.svg \
      "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hypercolor.svg"
  fi
  for size in 48 128 256; do
    if [[ -f "share/icons/hicolor/${size}x${size}/apps/hypercolor.png" ]]; then
      install -Dm644 "share/icons/hicolor/${size}x${size}/apps/hypercolor.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/hypercolor.png"
    fi
  done

  # Shell completions
  install -Dm644 share/bash-completion/completions/hypercolor \
    "${pkgdir}/usr/share/bash-completion/completions/hypercolor"
  install -Dm644 share/zsh/site-functions/_hypercolor \
    "${pkgdir}/usr/share/zsh/site-functions/_hypercolor"
  install -Dm644 share/fish/vendor_completions.d/hypercolor.fish \
    "${pkgdir}/usr/share/fish/vendor_completions.d/hypercolor.fish"

  # Systemd user service with system-package paths
  install -Dm644 lib/systemd/user/hypercolor.service.system \
    "${pkgdir}/usr/lib/systemd/user/hypercolor.service"

  # udev rules
  install -Dm644 lib/udev/rules.d/99-hypercolor.rules \
    "${pkgdir}/usr/lib/udev/rules.d/99-hypercolor.rules"
  install -Dm644 lib/udev/rules.d/70-hypercolor-input.rules \
    "${pkgdir}/usr/lib/udev/rules.d/70-hypercolor-input.rules"

  # i2c-dev module persistence
  install -Dm644 etc/modules-load.d/i2c-dev.conf \
    "${pkgdir}/usr/lib/modules-load.d/i2c-dev.conf"

  # License
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
