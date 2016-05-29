# Maintainer: Samuel Mansour (s83) <samipnt+aur@gmail.com>
# Contributor: Patrick Burroughs (Celti) <celti@celti.name>
# Upstream URL: https://github.com/tiliado/nuvola-app-mixcloud

# Please do mind that pkgbuild will automagically update
# to latest tagged release (you could have problems if you use an aur helper),
# there's no need to manually change pkgver.
# Please don't flag out-of-date!
pkgname=nuvola-app-mixcloud-git
pkgdesc='Mixcloud integration for Nuvola Player 3 from Github'
pkgver=latest
pkgrel=2

license=('BSD')

_gitname="${pkgname%-git}"

arch=('any')
depends=('nuvolaplayer-git')
makedepends=('git' 'lasem' 'scour')
sha256sums=('SKIP')
source=("${_gitname}::git+https://github.com/tiliado/${_gitname}.git")
url="https://github.com/tiliado/${_gitname}"

pkgver() {
  cd "${_gitname}"
  ( set -o pipefail
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${_gitname}"
  # Optimize SVG icons (scour), generate PNG icons (lasem), build and install.
  make install DEST="${pkgdir}/usr/share/nuvolaplayer3/web_apps"

  # Install all available licenses.
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE*
}
