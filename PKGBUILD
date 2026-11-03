# Maintainer: czyt <czytcn@gmail.com>

pkgname=cindy-cn-bin
pkgver=0.1.124
pkgrel=1
pkgdesc="Open-source AI agent that works out of the box (cn edition)"
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
conflicts=('cindy' 'cindy-bin')
options=('!strip' '!debug')

_deb="cindy-${pkgver}-linux-x64-cn.deb"
source_x86_64=("${_deb}::${url}/releases/download/v${pkgver}/${_deb}")
sha256sums_x86_64=('8f46010f93c420988b7087fee9f82146ceff4319a693b29e7d6e74e74a32c071')
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
