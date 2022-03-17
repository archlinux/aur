# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=apipost-bin
_pkgname=${pkgname%-bin}
pkgver=6.0.1
pkgrel=1
pkgdesc="An API debugging and management tool that supports team collaboration and can generate documents directly."
arch=('x86_64')
url="https://www.apipost.cn/"
license=('custom')
depends=('electron8')
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}.sh"
        "${_pkgname}-${pkgver}.deb::https://www.apipost.cn/dl.php?client=Linux&arch=x64")
sha256sums=('86e2ab737e7d10fe86a91c0039a1928eb53daa0e75c8389694188febb8d0d44d'
            '3d8197e42609059b9344b4e28cfaccc93a805c361ab932aef8d9731faf5abcf1')

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/{} \;
}

prepare() {
  tar -xf data.tar.xz -C ${srcdir}
}

package() {
  cd ${srcdir}

  install -dm755 ${pkgdir}/usr/lib/
  cp -a opt/ApiPost6/resources/app ${pkgdir}/usr/lib/${_pkgname}

  # wrapper
  install -Dm755 ${srcdir}/${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}

  # desktop entry & icons
  _install 644 usr/share/applications
  _install 644 usr/share/icons

  # fix
  sed -i "s|/opt/ApiPost6/apipost6|${_pkgname}|g" ${pkgdir}/usr/share/applications/${_pkgname}6.desktop
}
# vim: set sw=2 ts=2 et:
