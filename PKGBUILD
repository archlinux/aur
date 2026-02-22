# Maintainer: Jan Eil <aur@janeil.de>

pkgname=fsh-sushi-git
_pkgname=sushi
pkgver=3.17.0.r4.g6ef0d74
pkgrel=1
pkgdesc="Sushi Unshortens Short Hand Inputs (FSH Compiler)"
arch=('any')
url="https://github.com/FHIR/sushi"
license=('Apache-2.0')
depends=('nodejs')
makedepends=('npm' 'git')
provides=("fsh-sushi=${pkgver}" "sushi=${pkgver}")
conflicts=("fsh-sushi" "sushi")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  npm install
  npm run build
  npm pack
}

package() {
  cd "${_pkgname}"
  local _tgz=$(ls fsh-sushi-*.tgz)
  npm install -g --prefix "${pkgdir}/usr" --production "$_tgz"

  # Fix permissions
  find "${pkgdir}/usr" -type d -exec chmod 755 {} +

  # Add fsh-sushi symlink for clarity
  ln -s sushi "${pkgdir}/usr/bin/fsh-sushi"

  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
