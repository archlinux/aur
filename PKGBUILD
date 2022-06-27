# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='zeit'
pkgname="${_pkgname}-git"
pkgver=0.6.0.r0.gc80c6d2
pkgrel=1
pkgdesc='Qt frontend to crontab'
arch=('x86_64')
url='https://github.com/loimu/zeit'
license=('GPL3')
depends=('cron' 'hicolor-icon-theme' 'kauth')
makedepends=('extra-cmake-modules' 'imagemagick' 'git' 'qt5-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"
  cmake -B 'build' -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  make -C 'build'
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C 'build' install
  install -Dvm644 "${_pkgname}/Readme.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"

  for i in 16 22 24 32 48 64 96 128 256; do
    convert "${_pkgname}/assets/${_pkgname}_256.png" -resize "${i}x${i}" "${srcdir}/icon${i}.png"
    install -Dvm644 "${srcdir}/icon${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
  done
}

# vim: ts=2 sw=2 et:
