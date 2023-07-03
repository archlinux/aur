# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Lucas Saliés Brum <lucas@archlinux.com.br>
# Contributor: s3lph <aur-hsdquy@s3lph.me>

_pkgname='headsetcontrol'
pkgname="${_pkgname}-git"
pkgver=2.7.0.r1.gbd8aed3
pkgrel=2
pkgdesc='Sidetone and Battery status for Logitech G930, G533, G633, G933 SteelSeries Arctis 7/PRO 2019 and Corsair VOID (Pro)'
arch=('x86_64')
url='https://github.com/Sapd/HeadsetControl'
license=('GPL3')
depends=('hidapi')
makedepends=('cmake' 'git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
  install -Dvm644 "${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -dvm755 "${pkgdir}/usr/lib/udev/rules.d/"
  "${pkgdir}/usr/bin/headsetcontrol" -u > "${pkgdir}/usr/lib/udev/rules.d/70-headsets.rules"
}

# vim: ts=2 sw=2 et:
