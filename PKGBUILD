# Maintainer: czyt <czytcn@gmail.com>

pkgname=cindy-bin
pkgver=0.1.73
pkgrel=1
pkgdesc="Open-source AI agent that works out of the box (global edition)"
arch=('x86_64')
url="https://github.com/makecindy/cindy"
license=('Apache-2.0' 'MIT')
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'glibc'
  'gtk3' 'libcups' 'libdrm' 'libgcc' 'libstdc++' 'libnotify' 'libx11' 'libxcb'
  'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
  'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'systemd-libs' 'xdg-utils'
)
makedepends=('libarchive')
optdepends=('libsecret: desktop credential storage')
provides=("cindy=${pkgver}")
conflicts=('cindy' 'cindy-cn-bin')
options=('!strip' '!debug')

_deb="cindy-${pkgver}-linux-x64-global.deb"
source_x86_64=("${_deb}::${url}/releases/download/v${pkgver}/${_deb}")
sha256sums_x86_64=('41fd41f2cfa6e039145c6a391043b9982333155530898c9971022a65585d447c')
noextract=("${_deb}")

package() {
  local data_archive
  data_archive=$(bsdtar -tf "${srcdir}/${_deb}" | awk '/^data\.tar(\.|$)/ {print}')
  [[ -n "$data_archive" && "$data_archive" != *$'\n'* ]] || return 1
  bsdtar -xOf "${srcdir}/${_deb}" "$data_archive" |
    bsdtar --no-same-owner -xf - -C "${pkgdir}" || return 1

  install -Dm644 "${pkgdir}/usr/share/doc/cindy/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron"
  install -Dm644 "${pkgdir}/usr/lib/cindy/LICENSES.chromium.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
  rm -r "${pkgdir}/usr/share/doc" "${pkgdir}/usr/share/lintian"
  # Windows-only development scripts are unused by the Linux prebuilt node-pty.
  rm -r "${pkgdir}/usr/lib/cindy/resources/app.asar.unpacked/node_modules/node-pty/deps/winpty"
  chmod 4755 "${pkgdir}/usr/lib/cindy/chrome-sandbox"
}
