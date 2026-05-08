# Maintainer: pngdeity <pngdeity@tutanota.com>

_pkgname=amass
pkgname=${_pkgname}-git
pkgver=5.1.1.r0.g79299dc
pkgrel=1
pkgdesc="In-depth Attack Surface Mapping and Asset Discovery (VCS version)"
arch=('x86_64' 'aarch64')
url="https://github.com/owasp-amass/amass"
_githubname="owasp-amass/amass"
license=('Apache-2.0')
depends=('glibc')
makedepends=('go' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  mkdir -p bin
  go build -trimpath -o bin/amass ./cmd/amass
}

package() {
  cd "${_pkgname}"
  install -Dm755 bin/amass "${pkgdir}/usr/bin/amass"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -dm 755 "${pkgdir}/usr/share/${_pkgname}"
  cp -a --no-preserve=ownership "resources/" "${pkgdir}/usr/share/${_pkgname}"
  find "${pkgdir}/usr/share/${_pkgname}/resources" -type d -exec chmod 755 {} \;
  find "${pkgdir}/usr/share/${_pkgname}/resources" -type f -exec chmod 644 {} \;
}
