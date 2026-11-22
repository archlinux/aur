# Maintainer: Bibek Tripathy <bibektripathy17@gmail.com>
#
# Repackages the official .deb from the GitHub release, so installing needs no
# Rust, Node or PyInstaller toolchain:
#
#   paru -U ./packaging/aur/PKGBUILD     # or, without paru: makepkg -si
#
pkgname=unifiedsysmon-bin
_appname=unifiedSysMon
pkgver=2.2.1
pkgrel=1
pkgdesc="System monitor and port scanner desktop app with multi-server support"
arch=('x86_64')
url="https://github.com/BibekTripathy/unifiedSysMon"
license=('GPL-3.0-or-later')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3')
optdepends=('docker: container management')
provides=('unifiedsysmon')
conflicts=('unifiedsysmon')
# The bundled backend is a PyInstaller one-file binary; stripping it breaks it.
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_amd64.deb")
sha256sums=('6a0ff48364afaf638b3a61fc992a4c99b7c2bb291482b1732517873611657786')

package() {
  # dpkg has used gzip, xz and zstd for data.tar over the years; take whichever.
  local _data
  _data="$(bsdtar -tf "${srcdir}/${pkgname}-${pkgver}.deb" | grep '^data\.tar')"
  bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}.deb" "${_data}" | bsdtar -xf - -C "${pkgdir}"
}
