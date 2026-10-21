# Maintainer: gonwex <gonwe at qq dot com>

pkgname=perplexity-bin
pkgver=26.10.2
pkgrel=2
_build=122020
_sha256=b822c81624be379a0694bcdb9c1e06f7c1b142ce4bcd97a5c35605227b6e98dc
pkgdesc='Official Perplexity desktop app and Portable Computer for Linux'
arch=('x86_64')
url='https://www.perplexity.ai/hub/products/portable-computer'
license=('LicenseRef-Proprietary')
depends=('alsa-lib' 'at-spi2-core' 'bash' 'bubblewrap' 'cairo' 'dbus' 'expat'
         'gcc-libs' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libcups'
         'libdrm' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite'
         'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr'
         'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'psmisc'
         'systemd-libs' 'util-linux-libs' 'vulkan-icd-loader' 'xdg-utils')
optdepends=('libappindicator-gtk3: system tray integration'
            'docker: optional local model runtime'
            'nvidia-container-toolkit: optional NVIDIA local model runtime'
            'xorg-xwayland: Chinese input compatibility on Wayland desktops')
provides=('perplexity')
conflicts=('perplexity')
options=('!strip' '!debug')
source=("perplexity-${pkgver}-${_build}-amd64.deb::https://packages.perplexity.ai/deb/pool/main/p/perplexity/perplexity_${pkgver}%2Bbuild${_build}_amd64.deb"
        'perplexity.sh'
        'LICENSE.upstream')
sha256sums=("${_sha256}"
            '22691a4a1e35211bf91be48da130b577a8a7bac86d4f239f112d478d6130ebef'
            '7b1ee6559351f65e1ff609b329b3c5023d4e293b1044003995fe05b8f4831e04')

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  # Debian's postinst enables an Ubuntu-only Docker/NVIDIA installer. Arch
  # manages these optional dependencies separately; do not install that unit.
  rm -rf "${pkgdir}/usr/lib/systemd" "${pkgdir}/lib/systemd"
  rmdir "${pkgdir}/usr/lib" "${pkgdir}/lib" 2>/dev/null || true

  install -Dm755 "${srcdir}/perplexity.sh" "${pkgdir}/usr/bin/perplexity"
  sed -i 's|^Exec=.*|Exec=perplexity %U|' \
    "${pkgdir}/usr/share/applications/perplexity.desktop"
  sed -i 's|^Comment=.*|Comment=Official Perplexity desktop app and Portable Computer|' \
    "${pkgdir}/usr/share/applications/perplexity.desktop"

  # Arch supports unprivileged user namespaces; keep Chromium's sandbox on.
  chmod 755 "${pkgdir}/opt/Perplexity/chrome-sandbox"
  chmod 644 "${pkgdir}/opt/Perplexity/LICENSE.electron.txt" \
    "${pkgdir}/opt/Perplexity/LICENSES.chromium.html"
  install -Dm644 "${srcdir}/LICENSE.upstream" \
    "${pkgdir}/usr/share/licenses/${pkgname}/README"
  ln -s /opt/Perplexity/LICENSE.electron.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  ln -s /opt/Perplexity/LICENSES.chromium.html \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
