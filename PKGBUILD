# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=pqr
_pkgname=pqR
_pkgver=2020-07-23
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="A pretty quick version of R. Can be installed side-by-side with vanilla R."
arch=('i686' 'x86_64')
url="http://www.pqr-project.org/"
license=('GPL')
depends=('blas' 'lapack' 'bzip2'  'libtiff' 'pcre' 'libxmu')
makedepends=('gcc-fortran' 'desktop-file-utils')
optdepends=('tk: tcl/tk interface' 'texlive-bin: latex sty files')
options=('!makeflags' '!emptydirs')
install=$pkgname.install
source=("${_pkgname}-${_pkgver}.tar.gz::http://www.pqr-project.org/${_pkgname}-${_pkgver}.tar.gz"
	'pqr.desktop')
sha256sums=('ce9cf4272224e43fa13e96848c47d68e428b2a3db5560157f5edf0066843154e'
            'f6fb587f2ca78d896de86ae279d5513bdf4d7c82507c541bc96c27fb79370a9f')

build() {
  cd "${_pkgname}-${_pkgver}"
  ./configure --prefix=/opt/pqr --enable-R-shlib
  make
}

package() {
  cd "${_pkgname}-${_pkgver}"

  make DESTDIR="${pkgdir}/" install

  # Symlink binaries
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/bin/R" "${pkgdir}/usr/bin/${_pkgname}"
  ln -s "/opt/${pkgname}/bin/R" "${pkgdir}/usr/bin/${_pkgname}script"

  # Place desktop entry and icons
  desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/${pkgname}.desktop"
  for res in "16x16" "32x32" "48x48" "256x256"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
    if [ "$res" == "16x16" ] | [ "$res" == "32x32" ]
    then
      install -Dm644 "${srcdir}/${_pkgname}-${_pkgver}/doc/html/logo-${res}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${pkgname}.png"
    elif [ "$res" == "48x48" ]
    then
      install -Dm644 "${srcdir}/${_pkgname}-${_pkgver}/doc/html/logosmsq.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${pkgname}.png"
    else
      install -Dm644 "${srcdir}/${_pkgname}-${_pkgver}/doc/html/logolgsq.png" \
      "${pkgdir}/usr/share/icons/hicolor/${res}/apps/${pkgname}.png"
    fi
  done
}

