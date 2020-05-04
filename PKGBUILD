pkgname=flora-git
_pkgname=${pkgname%-git}
pkgver=r10.63aa99e
pkgrel=1
pkgdesc="Fabric Lightweight Obfuscation Remapping Assistant"
arch=("any")
url="https://github.com/Parzivail-Modding-Team/FLORA"
license=("MIT")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=("dotnet-runtime")
makedepends=("dotnet-sdk")
source=("${_pkgname}::git+https://github.com/Parzivail-Modding-Team/FLORA.git")
sha512sums=("SKIP")

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
  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/lib/flora/"

  cp -r build/* "${pkgdir}/usr/lib/flora/"
  ln -s "/usr/lib/flora/FLORA" "${pkgdir}/usr/bin/FLORA"

  install -Dm644  "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
