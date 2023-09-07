# Maintainer: yunielrc87 <yunielrc87[at]gmail[dot]com>
pkgname=vedv-git
_pkgname=vedv
pkgver=0.2.3
pkgrel=1
pkgdesc="A tool for developing applications in a secure and reproducible environment using virtual machines with a Docker-like flavor."
arch=('any')
url="https://gitlab.com/yunielrc/${_pkgname}"
license=('MIT')
conflicts=("$_pkgname")
provides=("${_pkgname}=${pkgver}")
depends=(
  'bash'
  'python'
  'virtualbox'
  'openbsd-netcat'
  'sshpass'
  'libxml2'
)
makedepends=('git' 'make' 'python-pip')
source=("${pkgname}::git+https://gitlab.com/yunielrc/${_pkgname}.git")
md5sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  # latest NO pre-release version
  # e.g.: if latest tag is v1.2.3-rc1, then pkgver=1.2.2
  cd "$pkgname" || exit
  git tag --sort='version:refname' | grep -Po '^v\K\d+\.\d+\.\d+$' | tail -n 1
}

package() {
  mkdir -p "${pkgdir}/tmp/vedv-git/"
  cp "${pkgname}/packages.env" "${pkgdir}/tmp/vedv-git/"

  cd "$pkgname" || exit
  git checkout "v${pkgver}"
  make DESTDIR="$pkgdir" install
}
