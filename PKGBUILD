# Maintainer: taotieren <admin@taotieren.com>

_pkgname=nmrpflash
pkgname=${_pkgname}-git
pkgver=0.9.26.r16.g2594885
pkgrel=1
pkgdesc="Netgear Unbrick Utility"
arch=($CARCH)
url="https://github.com/jclehner/nmrpflash"
license=('GPL-3.0-or-later')
depends=(
  'libpcap' 
  'libnl>=3'
  glibc
  hicolor-icon-theme
)
makedepends=(
  make
  git
)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  git -C "${srcdir}/${_pkgname}" clean -dfx
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make install PREFIX="${pkgdir}/usr"
  install -vDm0644 ${_pkgname}.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  install -vDm0644 -d "${pkgdir}/usr/share/doc/${pkgname}/"
  cp -rv *.md "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
