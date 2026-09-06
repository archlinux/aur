# Maintainer: Malte Linke <me@parzival.space>
# Contributor: Vladislav <your@email.com>

pkgname=fluorine-manager-bin
pkgdesc='A native Linux mod manager for Bethesda and other games, built on MO2'
pkgver=0.3.4 # renovate: datasource=github-tags depName=SulfurNitride/Fluorine-Manager versioning=semver
pkgrel=1
arch=('x86_64')
url='https://github.com/SulfurNitride/Fluorine-Manager'
license=('GPL-3.0-or-later')
provides=('fluorine-manager')
conflicts=('fluorine-manager')
depends=('mesa' 'gcc-libs' 'hicolor-icon-theme')
optdepends=('steam: allows the usage of Proton')
options=(!strip)

_releaseArchive="Fluorine-Manager.zip"
source=("${_releaseArchive}::https://github.com/SulfurNitride/Fluorine-Manager/releases/download/v${pkgver}/${_releaseArchive}"
        "LICENSE::https://raw.githubusercontent.com/SulfurNitride/Fluorine-Manager/refs/tags/v${pkgver}/LICENSE.txt"
        "disable-desktop-sync.patch")
sha256sums=('5d5de073f10ebaa998db24694cb2fcd04ec40fa07f65651e8f712254306538b8'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903'
            '4369d2dfe6d61cc2b907c6441fa120b58e84011246be18cb1c470458ea4209b9')
noextract=("${_releaseArchive}")

prepare() {
  mkdir -p "${srcdir}/fluorine-manager"
  bsdtar -xf "${_releaseArchive}" -C "${srcdir}/fluorine-manager"

  # remove the post-installation sync to the user home from the wrapper script
  patch -d "${srcdir}/fluorine-manager" -tNp1 -i ../disable-desktop-sync.patch
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
