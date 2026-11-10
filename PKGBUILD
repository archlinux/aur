# Maintainer: icyleaf <icyleaf.cn at gmail dot com>

pkgname=omawarden-app-git-bin
pkgver=0.4.0.dev.6ac6d25
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
sha256sums_x86_64=('cdb096c2b55b6e0336cef77ee352f28372bc5ecc5fc69bbc676aebe9cd35991f')
source_aarch64=("omawarden-app-aarch64.tar.gz::https://github.com/omawarden/omawarden-app/releases/download/dev/omawarden-app-0.4.0-dev-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('69d644e9c4a74c47213a2672b9fd92480dd5871ce0af76bccbdb0bd02e83b588')

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
