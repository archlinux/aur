# Maintainer: czyt <czytcn@gmail.com>
pkgname=dim-agent-bin
pkgver=0.9.20
pkgrel=1
pkgdesc='Agent runtime for desktop, terminal, scripts, and editors'
arch=('x86_64')
url='https://dimagent.com'
license=('custom')
depends=(
  'gtk3'
  'libnotify'
  'libxss'
  'libxtst'
  'xdg-utils'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
  'libxi'
  'glib2'
  'gdk-pixbuf2'
  'libxcb'
)
optdepends=('libappindicator-gtk3: system tray indicator support')
options=('!debug' '!strip')
provides=('dimagent')
conflicts=('dimagent')
source=("DimAgent-${pkgver}.deb::https://dimcode.echooai.com/updates/stable/linux/x64/DimAgent-${pkgver}.deb")
noextract=("DimAgent-${pkgver}.deb")
sha256sums=('004942719492a0fcc349d2c3472948f096e7b6fefe34410adb0b3ead7c5ddb3f')

package() {
  local data_member
  data_member=$(ar t "${srcdir}/DimAgent-${pkgver}.deb" | awk '/^data\.tar\.(gz|bz2|xz|zst|lz4|lzma)$/ { print; exit }')
  [[ -n "${data_member}" ]] || {
    echo 'Could not find a supported data archive in the Debian package' >&2
    return 1
  }

  ar p "${srcdir}/DimAgent-${pkgver}.deb" "${data_member}" |
  bsdtar -xf - -C "${pkgdir}"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/DimAgent/DimAgent "${pkgdir}/usr/bin/dimagent"
  chmod -R u=rwX,go=rX "${pkgdir}"
}
