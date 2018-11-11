# Maintainer: Flaviu Tamas <aur@flaviutamas.com>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

_pkgname=pylote
pkgname=$_pkgname-git
pkgver=r160.e9d7678
pkgrel=1
pkgdesc="Software making it possible to draw on the screen of the computer, like handling various instruments of geometry."
url="http://pascal.peter.free.fr/$_pkgname.html"
license=('GPL')
arch=('any')
depends=('pyqt')
conflicts=($_pkgname)
replaces=($_pkgname)
source=(
    git+https://gitlab.com/edleh/$_pkgname.git
    $_pkgname.desktop)
sha256sums=('SKIP'
            '8557e071b14f22e5386715d4769aada56175fa8a266508ce42043363b30b0bd7')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/share/"{$pkgname,applications}
  mkdir -p "${pkgdir}/usr/bin"
  cp -R * "${pkgdir}/usr/share/$pkgname"
  echo "#!/usr/bin/bash
        cd '/usr/share/$_pkgname/' && python $_pkgname.pyw" > "${pkgdir}/usr/bin/$_pkgname"
  chmod +x "${pkgdir}/usr/bin/$_pkgname"
  cp "${srcdir}/$_pkgname.desktop" "${pkgdir}/usr/share/applications"
}
