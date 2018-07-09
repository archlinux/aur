# Maintainer: Tim Niedermeier <youremail@domain.com>
pkgname=jtradfri-git
_gitname=jtradfri
pkgver=r11.b803d55
pkgrel=1
pkgdesc="General purpose Client for the IKEA Tradfri System"
arch=("any")
url="https://github.com/peterkappelt/JTradfri"
license=("Apache")
depends=("java-environment")
makedepends=("git" "java-environment" "gradle")
backup=("opt/${_gitname}/jtradfri.conf")
source=(
  "${_gitname}::git://github.com/peterkappelt/JTradfri.git"
  "jtradfri.service"
  "sysusers.conf"
  "jtradfri.conf"
)
md5sums=(
  "SKIP"
  "5bfbd6a39fd4f2e69bdbcff5d9f08c91"
  "92bc09a07c69fac1452464540dbb90f1"
  "dd83b6fe85428ebffcb52c2c790f86a0"
)

pkgver() {
  cd "${_gitname}"
  echo "r$(git rev-list --count master).$(git rev-parse --short master)"
}

build() {
  cd "${_gitname}/JTradfri"
  gradle build
}

package() {
  install -Dm 0644 "jtradfri.service" "${pkgdir}/usr/lib/systemd/system/jtradfri.service"
  install -Dm 0644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_gitname}.conf"
  install -Dm 0644 "jtradfri.conf" "${pkgdir}/opt/${_gitname}/jtradfri.conf"
  install -Dm 0644 "$(find ${_gitname}/JTradfri/build/libs -name "JTradfri-*-all.jar")" "${pkgdir}/opt/${_gitname}/jtradfri.jar"
}
