# Maintainer: Javier Tia <floss@jetm.me>
_pkgname='Drata Agent'
pkgname=drata-agent-bin
pkgver=3.9.0
pkgrel=1
pkgdesc='Tray application reporting read-only machine state for compliance tracking'
arch=('x86_64')
url='https://github.com/drata/drata-agent'
license=('Apache-2.0')
# Direct DT_NEEDED of the shipped binary, minus what gtk3 already pulls
# transitively (cairo, pango, glib2, at-spi2-core, the libX* stack).
# libnotify and libsecret carry no NEEDED entry - Electron dlopen()s both, so
# they are visible only as literal sonames inside the binary.
depends=('gtk3' 'nss' 'alsa-lib' 'libcups' 'mesa' 'dbus' 'libnotify' 'libsecret'
         'xdg-utils' 'hicolor-icon-theme')
provides=('drata-agent')
conflicts=('drata-agent')
# The bundled Electron is the point of this package: the AUR `drata-agent`
# rebuilds against system electron, which breaks whenever the system major
# diverges from the one upstream built against. Keep upstream's runtime intact -
# hence !strip, which would otherwise corrupt the prebuilt Electron.
options=('!strip' '!emptydirs' '!lto')
source=("${pkgname}-${pkgver}.deb::https://github.com/drata/drata-agent/releases/download/${pkgver}/Drata-Agent-linux.deb")
sha512sums=('e9dd8971435110646f3e85c35921b5ad85cf50d1d493bc1e41ba1f2813d9bf6eba09273b9ef26f191e73f992319a0049c14c8df5a25835a703194b85c87f7299')

prepare() {
  tar -xf data.tar.xz
}

package() {
  install -dm755 "${pkgdir}/opt"
  cp -a "${srcdir}/opt/${_pkgname}" "${pkgdir}/opt/${_pkgname}"

  # Upstream's postinst picks 4755 only when the kernel lacks user namespaces.
  # Arch enables unprivileged userns (kernel.unprivileged_userns_clone=1), so
  # Electron uses the namespace sandbox and the SUID helper stays unprivileged.
  chmod 0755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/drata-agent" "${pkgdir}/usr/bin/drata-agent"

  # Point Exec at the symlink rather than the quoted /opt path, and keep the
  # x-scheme-handler MimeType - it is the OAuth callback target.
  install -Dm644 "${srcdir}/usr/share/applications/drata-agent.desktop" \
    "${pkgdir}/usr/share/applications/drata-agent.desktop"
  sed -i 's|^Exec=.*$|Exec=/usr/bin/drata-agent %U|' \
    "${pkgdir}/usr/share/applications/drata-agent.desktop"

  local size icon
  for size in 16 32 48 64 128 256 512 1024; do
    icon="${srcdir}/usr/share/icons/hicolor/${size}x${size}/apps/drata-agent.png"
    [[ -f ${icon} ]] || continue
    install -Dm644 "${icon}" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/drata-agent.png"
  done

  install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
  install -Dm644 "${srcdir}/opt/${_pkgname}/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
