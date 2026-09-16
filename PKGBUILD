# Maintainer: czyt <czytcn@gmail.com>
pkgname=dim-agent-bin
pkgver=0.9.32
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
sha256sums=('a73568b69fe3dbf8910750ce91e3fbab3cb3c5ad09ce177f5768f076b6dedbae')

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
