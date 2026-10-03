# Maintainer: Malte Linke <me@parzival.space>
# Contributor: Vladislav <your@email.com>

pkgname=fluorine-manager-bin
pkgdesc='A native Linux mod manager for Bethesda and other games, built on MO2'
pkgver=0.4.0 # renovate: datasource=github-tags depName=SulfurNitride/Fluorine-Manager versioning=semver
pkgrel=1
arch=('x86_64')
url='https://github.com/SulfurNitride/Fluorine-Manager'
license=('GPL-3.0-or-later')
provides=('fluorine-manager')
conflicts=('fluorine-manager')
depends=('mesa' 'gcc-libs' 'hicolor-icon-theme')
optdepends=('steam: allows the usage of Proton')
options=(!strip)

_releaseArchive="fluorine-manager-${pkgver}.tar.gz"
source=("${_releaseArchive}::https://github.com/SulfurNitride/Fluorine-Manager/releases/download/v${pkgver}/${_releaseArchive}"
        "LICENSE::https://raw.githubusercontent.com/SulfurNitride/Fluorine-Manager/refs/tags/v${pkgver}/LICENSE.txt"
        "disable-desktop-sync.patch")
sha256sums=('ae048a1521b2e6b382b23c8b0b44ab3d8cc99cd4ccd028d5e21975f6b72ce5d1'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903'
            'f76a7e83ed721beccb23a36241f40485352045ac82632a594f319504a359bfec')
noextract=("${_releaseArchive}")

prepare() {
  bsdtar -xf "${_releaseArchive}" -C "${srcdir}"

  # remove the post-installation sync to the user home from the wrapper script
  patch -d "${srcdir}/fluorine-manager" -tNp0 -i ../disable-desktop-sync.patch
}

package() {
  # install archive files
  install -dm755 "${pkgdir}/opt/fluorine-manager"
  cp -a "${srcdir}/fluorine-manager/." "${pkgdir}/opt/fluorine-manager"

  # link to bin
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/fluorine-manager/fluorine-manager" "${pkgdir}/usr/bin/fluorine-manager"

  # install desktop icon
  install -Dm644 "${srcdir}/fluorine-manager/icons/com.fluorine.manager.desktop" "${pkgdir}/usr/share/applications/com.fluorine.manager.desktop"
  install -Dm644 "${srcdir}/fluorine-manager/icons/com.fluorine.manager.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.fluorine.manager.png"

  # install license file
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
