pkgname=flora-git
_pkgname=${pkgname%-git}
pkgver=r11.9571e40
pkgrel=2
pkgdesc="Fabric Lightweight Obfuscation Remapping Assistant"
arch=("any")
url="https://github.com/Parzivail-Modding-Team/FLORA"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("dotnet-runtime")
makedepends=("dotnet-sdk")
source=(
  "${_pkgname}::git+https://github.com/Parzivail-Modding-Team/FLORA.git"
  'flora.sh'
)
sha512sums=(
  'SKIP'
  'a1949d20f6224cce775ada96f7de63cb8e503c977cd1bae7b5192fcd3ba19f83e22ce947235a73b1188ce42043c85140abe149043ef4b3e4b93b4d971576150c'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  dotnet publish -c Release --no-self-contained -o "build/" FLORA.sln
}

package() {
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/lib/flora/"

  cp -r "${srcdir}/${_pkgname}/build"/* "${pkgdir}/usr/lib/flora/"
  install -m755 "${srcdir}/flora.sh" "${pkgdir}/usr/bin/flora"
  ln -s "/usr/lib/flora/FLORA" "${pkgdir}/usr/bin/FLORA"

  install -Dm644  "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
