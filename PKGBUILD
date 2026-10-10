# Maintainer: Elia Nitsche <nitscheelia at gmail.com>
# Contributor: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: shad0w73 <shad0w73@vmail.me>

pkgname=helden-software
pkgver=5.6.0
pkgrel=1
_debian_pkgver=5.6.0-9
pkgdesc='Die Heldenverwaltung für das Pen&Paper-Rollenspiel "Das Schwarze Auge" (DSA)'
arch=('any')
url="http://www.helden-software.de"
license=('custom')
depends=('java-runtime>21' 'hicolor-icon-theme' 'bash')
source=("http://online.helden-software.de/rep/pool/main/h/${pkgname}/${pkgname}_${_debian_pkgver}_all.deb")
sha256sums=('3bbe12b746dd9e76af2399635ebb1b155f245658d06134625b1b26108d23655c')

prepare() {
  cd "${srcdir}"
  tar -xzf data.tar.gz
}

package() {
  cd "${srcdir}"

  # Binary
  install -Dm644 usr/lib/${pkgname}/helden5.jar "${pkgdir}/usr/share/${pkgname}/helden5.jar"

  # Docs
  install -Dm644 usr/share/doc/${pkgname}/changelog.Debian.gz "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz"
  install -Dm644 usr/share/doc/${pkgname}/copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Config
  install -Dm644 etc/default/${pkgname} "${pkgdir}/etc/default/${pkgname}"

  # Icons
  for _size in 16 32 48 64 72 96 128 192; do
    install -Dm644 usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png \
        "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/${pkgname}.png"
  done

  # Launcher
  install -dm755 "${pkgdir}/usr/share/applications"
  sed s/games/bin/ usr/share/applications/HeldenSoftware.desktop > "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Run-Script
  install -dm755 "${pkgdir}/usr/bin"
  sed "s/lib/share/" usr/games/${pkgname} > "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
