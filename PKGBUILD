# Maintainer: duanluan <duanluan@outlook.com>

pkgname=reasonix-desktop-bin
_pkgname=reasonix-desktop
pkgver=1.38.11
pkgrel=2
pkgdesc='Terminal-native AI coding agent with DeepSeek API (Electron desktop GUI, repackaged from .deb)'
arch=('x86_64')
url='https://github.com/esengine/DeepSeek-Reasonix'
license=('MIT')
# The bundle ships its own pinned Electron runtime; these are only the
# shared-library / desktop-integration dependencies it loads at runtime.
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'gcc-libs' 'glib2' 'gtk3'
         'hicolor-icon-theme' 'libcups' 'libnotify' 'libx11' 'libxcb'
         'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'libxss' 'mesa' 'nss' 'pango' 'systemd-libs' 'xdg-utils')
provides=('reasonix-desktop')
conflicts=('reasonix-desktop' 'deepseek-reasonix-desktop' 'deepseek-reasonix-desktop-bin')
options=('!strip' '!debug')
source=("${_pkgname}_${pkgver}_amd64.deb::${url}/releases/download/desktop-v${pkgver}/Reasonix-linux-amd64.deb")
noextract=("${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('b8b02e3dcfbff35bdbd19c2178e3d9e0b53bcf929c9f56065c65417bda8074c2')

prepare() {
  mkdir -p "${srcdir}/debroot"
  bsdtar -xf "${srcdir}/${_pkgname}_${pkgver}_amd64.deb" -C "${srcdir}/debroot"
  # Upstream switched data.tar.gz to data.tar.xz in newer releases;
  # extract whichever member the .deb actually carries.
  bsdtar -xf "${srcdir}/debroot"/data.tar.* -C "${srcdir}/debroot"
}

package() {
  cd "${srcdir}/debroot"
  install -d "${pkgdir}/usr/lib/reasonix" "${pkgdir}/usr/bin"

  # Electron shell with its pinned runtime
  cp -a --no-preserve=ownership usr/lib/reasonix/app "${pkgdir}/usr/lib/reasonix/"
  chmod 755 "${pkgdir}/usr/lib/reasonix/app"

  # The desktop service resolves app/Reasonix and its private CLI beside
  # itself; keep all three binaries together under /usr/lib/reasonix. The
  # private reasonix CLI must NOT go to /usr/bin — that path belongs to the
  # separate reasonix TUI packages.
  local _bin
  for _bin in reasonix reasonix-desktop reasonix-launcher; do
    install -Dm755 "usr/bin/${_bin}" "${pkgdir}/usr/lib/reasonix/${_bin}"
  done
  ln -s ../lib/reasonix/reasonix-desktop "${pkgdir}/usr/bin/reasonix-desktop"
  ln -s ../lib/reasonix/reasonix-launcher "${pkgdir}/usr/bin/reasonix-launcher"

  # Chromium SUID sandbox helper; without root:root 4755 the app can only
  # start with --no-sandbox
  chmod 4755 "${pkgdir}/usr/lib/reasonix/app/chrome-sandbox"

  # Desktop entry — upstream's Exec=reasonix-launcher is installed above.
  # Native Wayland windows map to StartupWMClass "Reasonix" (case-sensitive).
  install -Dm644 usr/share/applications/reasonix.desktop \
    "${pkgdir}/usr/share/applications/reasonix.desktop"
  sed -i 's/^StartupWMClass=.*/StartupWMClass=Reasonix/' \
    "${pkgdir}/usr/share/applications/reasonix.desktop"

  # Icons
  local _icon _dir
  for _icon in usr/share/icons/hicolor/*/apps/reasonix-desktop.*; do
    _dir="$(basename "$(dirname "$(dirname "${_icon}")")")"
    install -Dm644 "${_icon}" \
      "${pkgdir}/usr/share/icons/hicolor/${_dir}/apps/$(basename "${_icon}")"
  done
  install -Dm644 usr/share/pixmaps/reasonix-desktop.png \
    "${pkgdir}/usr/share/pixmaps/reasonix-desktop.png"

  # License shipped inside the bundle
  install -Dm644 usr/lib/reasonix/app/LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Deliberately not installed: reasonix-update-helper and its polkit action —
  # pacman owns upgrades, and an in-app self-update would overwrite tracked
  # files and corrupt the package.
}
