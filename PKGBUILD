# Maintainer:  Paul van der Linden <mail@paultjuh.org>
pkgname=scangearmp2-sane-git
pkgver=4.60.2+2.r204.20230920.78ec743
pkgrel=1
pkgdesc="Canon ScanGear MP v2 scanner utility and sane backend"
arch=('x86_64')
url="https://github.com/ThierryHFR/scangearmp2"
license=('GPL' 'custom:canon')
depends=('gtk3')
makedepends=('cmake' 'libjpeg' 'sane' 'intltool' 'git' 'libusb')
provides=('scangearmp2')
conflicts=('scangearmp2')
source=("${pkgname}::git+https://github.com/ThierryHFR/scangearmp2")
sha256sums=('SKIP')


pkgver() {
  cd ${srcdir}/${pkgname}

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

_builddir="${startdir}/build"

build() {
  rm -rf ${_builddir}
  msg "Starting build ..."
  cmake -S${srcdir}/${pkgname} -B${_builddir} -DCMAKE_INSTALL_PREFIX="/"
  make -j4 -C${_builddir}
}

package() {
  rm -rf ${pkgdir}
  make -C${_builddir} install DESTDIR=${pkgdir}

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  mv ${pkgdir}/usr/share/scangearmp2/doc/* ${pkgdir}/usr/share/licenses/${pkgname}/
  rmdir ${pkgdir}/usr/share/scangearmp2/doc/
}
