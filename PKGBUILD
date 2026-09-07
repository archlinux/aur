# Maintainer: Timofey Brukhanchik <asyncbtd@gmail.com>

pkgname=epic-lore-desktop-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="GUI client for next-generation open source version control system by Epic Games (Pre-compiled binary)"
arch=('x86_64')
url="https://github.com/EpicGames/lore"
license=('custom:Epic Games')
depends=(
  'at-spi2-core'
  'gtk3'
  'libnotify'
  'libsecret'
  'libxss'
  'libxtst'
  'nss'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: systray indicator support'
)
provides=('lore-desktop')
options=('!strip' '!debug')
_deb="${pkgname}-$(date +%F-%H).amd64.deb"
source=("${_deb}::https://releases.lore.org/desktop/releases/stable/lore-desktop_amd64.deb")
sha256sums=('cdef516e010a46e72906c47f5dc741f5e3d9dd22bed73fa3e7af602de65bf252')
noextract=("$_deb")

pkgver() {
  bsdtar -xf "$_deb" control.tar.gz
  bsdtar -xf control.tar.gz control
  sed -n 's/^Version: //p' control
}

package() {
  bsdtar -O -xf "${srcdir}/${_deb}" data.tar.gz | bsdtar -C "${pkgdir}" -xzf -

  install -Dm644 "${pkgdir}/opt/Lore Desktop/resources/TERMS_OF_USE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/TERMS_OF_USE.txt"

  rm -rf "${pkgdir}/usr/share/doc"

  find "${pkgdir}" -type d -exec chmod 755 {} +
}
