# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=tunneler2-git
_pkgname=tunneler2
pkgver=r46.040474e
pkgrel=1
pkgdesc="Online-multiplayer game inspired by a DOS classic"
url="https://github.com/thinkrad/tunneler"
depends=(python2-pygame)
makedepends=('git' 'gendesk')
conflicts=(tunneler2)
license=('GPL')
arch=('any')
source=("${pkgname}"::'git+https://github.com/thinkrad/tunneler.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname}"
  rm -r doc/.svn data/.svn
  gendesk -f -n --pkgname "${_pkgname}_Server" --pkgdesc "${pkgdesc}" --exec "python2 /usr/share/tunneler2/Server.py" --categories "Games"
  gendesk -f -n --pkgname "${_pkgname}_Client" --pkgdesc "${pkgdesc}" --exec "python2 /usr/share/tunneler2/Client.py" --categories "Games"
}


package() {
  cd ${srcdir}/${pkgname}
  install -dm755 "${pkgdir}"/usr/share/{doc/tunneler2,tunneler2}
  cp -r * "${pkgdir}/usr/share/tunneler2"
  mv "${pkgdir}/usr/share/tunneler2/doc"/* "${pkgdir}/usr/share/doc/tunneler2"
  rm -r "${pkgdir}/usr/share/tunneler2/doc"
  install -Dm644 "${_pkgname}_Server.desktop" "$pkgdir/usr/share/applications/${_pkgname}_Server.desktop"
  install -Dm644 "${_pkgname}_Client.desktop" "$pkgdir/usr/share/applications/${_pkgname}_Client.desktop"
}

# vim:set ts=2 sw=2 et:
