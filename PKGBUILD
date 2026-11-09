# Maintainer: icyleaf <icyleaf.cn at gmail dot com>

pkgname=omawarden-app-git-bin
pkgver=0.4.0.dev.324f875
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
sha256sums_x86_64=('8b55f645cd1ece2ccd227863d965c67018b40a9814a317d54022e3e5acf9806c')
source_aarch64=("omawarden-app-aarch64.tar.gz::https://github.com/omawarden/omawarden-app/releases/download/dev/omawarden-app-0.4.0-dev-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('5ba1c56293cc6e5fa01da377ae00b07451b71fdbf45c34590dca22130814a3b7')

package() {
  local appdir
  appdir=$(find "${srcdir}" -maxdepth 1 -type d -name 'omawarden-app-*' | head -n 1)
  if [[ -z "${appdir}" ]]; then
    error "omawarden-app package directory not found"
  fi

  install -Dm755 "${appdir}/omawardenApp" "${pkgdir}/usr/lib/omawarden-app/omawardenApp"
  cp -a "${appdir}/nsh" "${pkgdir}/usr/lib/omawarden-app/nsh"
  install -d "${pkgdir}/usr/bin"
  ln -s /usr/lib/omawarden-app/omawardenApp "${pkgdir}/usr/bin/omawardenApp"

  install -Dm644 "${appdir}/com.icyleaf.omawarden.desktop"     "${pkgdir}/usr/share/applications/com.icyleaf.omawarden.desktop"
  install -Dm644 "${appdir}/com.icyleaf.omawarden.png"     "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/com.icyleaf.omawarden.png"
  # The polkit action belongs to the daemon, which is its subject, and
  # omawarden-bin already installs it. Installing it here too makes pacman
  # abort with a conflicting-files error.
  install -Dm644 "${appdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
