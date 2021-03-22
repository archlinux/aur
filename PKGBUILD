# Maintainer: Flaviu Tamas <aur@flaviutamas.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

_pkgname=pylote
pkgname=$_pkgname-git
pkgver=r186.981d39e
pkgrel=1
pkgdesc="Software making it possible to draw on the screen of the computer, like handling various instruments of geometry."
url="http://pascal.peter.free.fr/$_pkgname.html"
license=('GPL')
arch=('any')
depends=(python-pyqt5 qt5-webkit)
conflicts=($_pkgname)
replaces=($_pkgname)
source=(
    git+https://gitlab.com/edleh/$_pkgname.git
    $_pkgname.desktop)
sha256sums=('SKIP'
            'fc068a7425d00a6b8295ae04255cd1860df28f11055478d8d9b64e9d65671b17')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_pkgname}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/"{$_pkgname,applications}
  mkdir -p "${pkgdir}/usr/bin"
  cp -R * "${pkgdir}/usr/share/$_pkgname"
  echo "#!/usr/bin/bash
        cd '/usr/share/$_pkgname/' && python $_pkgname.pyw" > "${pkgdir}/usr/bin/$_pkgname"
  chmod +x "${pkgdir}/usr/bin/$_pkgname"
  cp "${srcdir}/$_pkgname.desktop" "${pkgdir}/usr/share/applications"
}
