pkgname=cloudshack-git
_pkgname=cloudshack
pkgver=20141030
pkgrel=1
pkgdesc="amateur radio logbook server with web interface"
url="https://github.com/7h0ma5/CloudShack"
arch=("i686" "x86_64")
license=(GPL3)
depends=(nodejs)
mkdepends=(python2)
provides=(cloudshack)
conflicts=(cloudshack)
install=cloudshack.install
source=(cloudshack.service)
sha256sums=('f4ed165f83e34922ccf6c08f5e5a1bb0a7eb6a67d78a47e58a4a4c0b00effb42')

_gitroot="git://github.com/7h0ma5/cloudshack.git"
_gitname="cloudshack-git"

build() {
  cd "${srcdir}"

  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --recursive $_gitroot $_gitname
  fi

  cd "${srcdir}/${pkgname}"
  PYTHON=python2 npm install
}

package() {
  # install application
  local _npmdir="${pkgdir}/usr/lib/node_modules/"
  mkdir -p "${srcdir}/${_npmdir}"
  cd "${srcdir}/${_npmdir}"

  PYTHON=python2 npm install --user root --global --prefix "${pkgdir}/usr" "${srcdir}/${_gitname}"

  mkdir -p "${pkgdir}/var/lib/${_pkgname}"

  install -Dm644 "${srcdir}"/cloudshack.service \
    "${pkgdir}"/usr/lib/systemd/system/cloudshack.service
}
