# Maintainer: OpenSourceGuy <osguy@duck.com>

pkgname=riko-bin
_pkgname=riko-launcher
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast, native launcher for Vortex (a Roblox alternative) with plugins and a plugin marketplace"
arch=('x86_64')
url='https://github.com/Arbuzyonak/Riko'
license=('MIT' 'Apache-2.0')
depends=(
  'webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg'
  'xdotool' 'openssl' 'gst-plugins-base' 'gst-plugins-good' 'wine'
)
optdepends=(
  'vulkan-driver: Vulkan support for Vortex under Wine'
  'lib32-vulkan-driver: 32-bit Vulkan drivers (many Vortex games are 32-bit)'
  'mangohud: optional in-game overlay (built-in plugin)'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
options=('!strip' '!emptydirs')

_deb="Riko.Launcher_${pkgver}_amd64.deb"
source=("${_deb}::${url}/releases/download/v${pkgver}/${_deb}"
        "LICENSE-MIT::${url}/raw/v${pkgver}/LICENSE-MIT"
        "LICENSE-APACHE::${url}/raw/v${pkgver}/LICENSE-APACHE")
sha256sums=('bc1f8012ba542f9b117e18b5d1eb03720325917f02f816c63b7115367b030908'
            '46707a13cde1870aa6dd3e5ba4d5533a22291f637ce5088e585a15ebab69fc5f'
            '8ac58428d6dcbaea653ad898518314726f14de5a5be643089abf63cad925e67c')
noextract=("${_deb}")

package() {
  local _extract="${srcdir}/deb-extract"
  mkdir -p "${_extract}"

  local _data
  _data=$(bsdtar -tf "${srcdir}/${_deb}" | grep -oP '^data\.tar\.[a-z0-9]+$' | head -1)
  bsdtar -xOf "${srcdir}/${_deb}" "${_data}" | bsdtar -xzf - -C "${_extract}"

  install -Dm755 "${_extract}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_extract}/usr/share/applications/Riko Launcher.desktop" \
                  "${pkgdir}/usr/share/applications/Riko Launcher.desktop"

  local _size
  for _size in 32x32 128x128 512x512; do
    install -Dm644 "${_extract}/usr/share/icons/hicolor/${_size}/apps/${_pkgname}.png" \
                    "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${_pkgname}.png"
  done

  install -Dm644 "${srcdir}/LICENSE-MIT"    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 "${srcdir}/LICENSE-APACHE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}

# vim:set ts=2 sw=2 et:
