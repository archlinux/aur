# Maintainer: duanluan <duanluan@outlook.com>

pkgname=reasonix-desktop-bin
_pkgname=reasonix-studio
pkgver=2.61.0
pkgrel=1
pkgdesc='Electron desktop GUI for the Reasonix terminal-native AI coding agent (repackaged from upstream .deb)'
arch=('x86_64' 'aarch64')
url='https://github.com/esengine/DeepSeek-Reasonix'
license=('MIT')
# The bundle ships its own pinned Electron runtime; these are only the
# shared-library / desktop-integration dependencies it loads at runtime.
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'libcloudproviders'
  'libcups'
  'libdrm'
  'libepoxy'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'util-linux-libs'
  'wayland'
  'xdg-utils'
)
optdepends=(
  'bubblewrap: sandboxed shell execution for the agent host'
  'libappindicator-gtk3: system tray icon support'
)
# The former desktop package name keeps resolving, and the Studio names are
# claimed so this package never lands beside another copy of the same app.
provides=('reasonix-desktop' 'reasonix-studio')
conflicts=('reasonix-desktop' 'reasonix-studio' 'deepseek-reasonix-desktop'
           'deepseek-reasonix-desktop-bin')
options=('!strip' '!debug')
source=('LICENSE')
source_x86_64=(
  "ReasonixStudio-${pkgver}-amd64.deb::${url}/releases/download/studio-v${pkgver}/ReasonixStudio-linux-amd64.deb"
)
source_aarch64=(
  "ReasonixStudio-${pkgver}-arm64.deb::${url}/releases/download/studio-v${pkgver}/ReasonixStudio-linux-arm64.deb"
)
noextract=(
  "ReasonixStudio-${pkgver}-amd64.deb"
  "ReasonixStudio-${pkgver}-arm64.deb"
)
sha256sums=('dc024237821ac82056c37f8d82e3be919bd51e39a4529ec12a8ab3e2a346dc4c')
sha256sums_x86_64=('c8ee9d27725df44a476f20e2bb407f0d5f2ebf836ea3b25b2257200c64ec2d19')
sha256sums_aarch64=('19587c6e3147c2b499fc98e9a1025dbc502f0bb896500ce6f9d9ab564ea9959a')

prepare() {
  local deb_arch
  case "${CARCH}" in
    x86_64) deb_arch='amd64' ;;
    aarch64) deb_arch='arm64' ;;
    *)
      echo "Unsupported architecture: ${CARCH}" >&2
      return 1
      ;;
  esac

  mkdir -p "${srcdir}/debroot"
  bsdtar -xf "${srcdir}/ReasonixStudio-${pkgver}-${deb_arch}.deb" -C "${srcdir}/debroot"
  # Upstream has shipped data.tar.gz and data.tar.xz at different points;
  # extract whichever member the .deb actually carries.
  bsdtar -xf "${srcdir}/debroot"/data.tar.* -C "${srcdir}/debroot"
}

package() {
  cd "${srcdir}/debroot"

  # Upstream installs into /opt/Reasonix Studio (the directory name carries a
  # space and is referenced by the apparmor profile and the app's own path
  # lookups), so the bundle is copied verbatim instead of being renamed.
  install -d "${pkgdir}/opt"
  cp -a --no-preserve=ownership 'opt/Reasonix Studio' "${pkgdir}/opt/"

  # Electron's sandbox helper keeps its renderer sandbox only when setuid root.
  chmod 4755 "${pkgdir}/opt/Reasonix Studio/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s '/opt/Reasonix Studio/reasonix-studio-electron' \
    "${pkgdir}/usr/bin/reasonix-studio"

  # Upstream's desktop entry points at the absolute /opt path and already
  # declares StartupWMClass "Reasonix Studio" for native Wayland windows.
  # Icon= keeps upstream's launcher name, so the icons below carry that name
  # too; the entry itself is renamed to match the package.
  install -Dm644 usr/share/applications/reasonix-studio-electron.desktop \
    "${pkgdir}/usr/share/applications/reasonix-studio.desktop"

  # Icons; upstream ships one 512x512 png keyed to its own launcher name.
  local _icon _dir
  for _icon in usr/share/icons/hicolor/*/apps/reasonix-studio-electron.*; do
    _dir="$(basename "$(dirname "$(dirname "${_icon}")")")"
    install -Dm644 "${_icon}" \
      "${pkgdir}/usr/share/icons/hicolor/${_dir}/apps/$(basename "${_icon}")"
  done

  # Licenses: upstream's MIT text plus the Electron/Chromium notices shipped
  # inside the bundle.
  install -Dm644 "${srcdir}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 'opt/Reasonix Studio/LICENSE.electron.txt' \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 'opt/Reasonix Studio/LICENSES.chromium.html' \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"

  # Deliberately not installed: reasonix-studio-update-helper and its polkit
  # action — pacman owns upgrades, and an in-app self-update would overwrite
  # tracked files and corrupt the package.
}
