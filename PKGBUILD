# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=edisyn
pkgname="${_pkgname}-git"
pkgver=r1037.0ca5b2c
pkgrel=1
pkgdesc="A cross-platform synthesizer patch editor library (git version)"
arch=(any)
url="https://github.com/eclab/edisyn/"
license=(Apache)
depends=('java-runtime>=11' 'sh')
makedepends=('java-environment>=11')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/eclab/${_pkgname}.git"
        "${_pkgname}.desktop"
        "${_pkgname}.sh")
sha256sums=('SKIP'
            '6545bfc5fb5e41d1f6917c0c40145f8168c5d205a70ad1fb6810cf57c68fb618'
            'a198edd3de2ad4a8edc344d90fb9e999fe02ea67b7f475bfce66a97f1723c9a7')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p install
  make all jar
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm644 install/${_pkgname}.jar \
    -t "${pkgdir}/usr/share/java/${_pkgname}"
  install -Dm755 "${srcdir}/${_pkgname}.sh" \
    "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}.desktop" \
    -t "${pkgdir}/usr/share/applications"
}
