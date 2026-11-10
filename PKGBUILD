# Maintainer: icyleaf <icyleaf.cn at gmail dot com>

pkgname=omawarden-app-git-bin
pkgver=0.4.0.dev.cfa3564
pkgrel=1
pkgdesc="Omawarden desktop app for Bitwarden/Vaultwarden (prebuilt development build)"
arch=('x86_64' 'aarch64')
url="https://github.com/omawarden/omawarden-app"
license=('MIT')
depends=('gtk4' 'webkitgtk-6.0' 'libsecret' 'polkit' 'wl-clipboard')
optdepends=('libfido2: WebAuthn / Passkey / FIDO2 security key support')
# The package was called omawarden-app-dev-bin before the rename. Naming the
# old package in conflicts makes pacman replace it on upgrade instead of
# failing with "exists in filesystem".
provides=('omawarden-app' 'omawarden-app-dev-bin')
conflicts=('omawarden-app' 'omawarden-app-dev-bin')
install='omawarden-policy.install'
source_x86_64=("omawarden-app-x86_64.tar.gz::https://github.com/omawarden/omawarden-app/releases/download/dev/omawarden-app-0.4.0-dev-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f6c1e6c8725ac81b838fc3a9282a483b58933ec2c89d242a286a4411349563a3')
source_aarch64=("omawarden-app-aarch64.tar.gz::https://github.com/omawarden/omawarden-app/releases/download/dev/omawarden-app-0.4.0-dev-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('2be27409437515c39ead1854b66f9cd7697b5afeaed3879ac1646abc806306b5')

package() {
  local appdir
  appdir=$(find "${srcdir}" -maxdepth 1 -type d -name 'omawarden-app-*' | head -n 1)
  if [[ -z "${appdir}" ]]; then
    error "omawarden-app package directory not found"
  fi

  install -Dm755 "${appdir}/Omawarden" "${pkgdir}/usr/lib/omawarden-app/Omawarden"
  cp -a "${appdir}/nsh" "${pkgdir}/usr/lib/omawarden-app/nsh"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/omawarden-app/Omawarden "${pkgdir}/usr/bin/Omawarden"

  install -Dm644 "${appdir}/com.icyleaf.omawarden.desktop"     "${pkgdir}/usr/share/applications/com.icyleaf.omawarden.desktop"
  install -Dm644 "${appdir}/com.icyleaf.omawarden.png"     "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/com.icyleaf.omawarden.png"
  # The polkit action belongs to the daemon, which is its subject, and
  # omawarden-bin already installs it. Installing it here too makes pacman
  # abort with a conflicting-files error.
  install -Dm644 "${appdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
