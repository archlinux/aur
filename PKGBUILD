# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=rkr.lv2
pkgname="${_pkgname}-git"
pkgver=beta_3.r0.g7edcb4e
pkgrel=1
pkgdesc="rakarrack effects ported to LV2 plugins (git version)"
arch=('i686' 'x86_64')
license=('GPL2')
url='https://github.com/ssj71/rkrlv2'
depends=('fftw' 'libsamplerate' 'lv2')
makedepends=('git' 'cmake')
source=("${_pkgname}::git+https://github.com/ssj71/rkrlv2.git")
provides=("${_pkgname}" "${_pkgname//./-}")
conflicts=("${_pkgname}" "${_pkgname//./_}")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  # Use the tag of the last commit
  git describe --tags --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"

  mkdir -p build
  cd build
  cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}/build"

  make DESTDIR="${pkgdir}" install

  # Symlink duplicate data files
  for ext in dly rvb; do
    for fn in "${pkgdir}"/usr/lib/lv2/${_pkgname}/*.${ext}; do
      local bn="${fn##*/}"
      if [[ ! -e "${pkgdir}/usr/share/${_pkgname}/${bn}" ]]; then
          mv "${fn}" "${pkgdir}/usr/share/${_pkgname}/${bn}"
      else
          rm -f "${fn}"
      fi
      ln -s "../../../share/${_pkgname}/${bn}" "${fn}"
    done
  done

  # docs
  install -Dm644 ../AUTHORS ../README -t "${pkgdir}"/usr/share/doc/${pkgname}
}

# vim:set ts=2 sw=2 et:
