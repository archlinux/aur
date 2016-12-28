# Maintainer: Conor Anderson <conor@conr.ca>
pkgname=pqr
_pkgname=pqR
_pkgver="2016-10-24"
pkgver=${_pkgver//-/}
pkgrel=2
pkgdesc="A pretty quick version of R. Can be installed side-by-side with vanilla R."
arch=('i686' 'x86_64')
url="http://www.pqr-project.org/"
license=('GPL')
depends=('blas' 'lapack' 'bzip2'  'libtiff' 'pcre' 'libxmu')
makedepends=('gcc-fortran')
optdepends=('tk: tcl/tk interface' 'texlive-bin: latex sty files')
options=('!makeflags' '!emptydirs')
install=$pkgname.install
source=("${_pkgname}-${_pkgver}.tar.gz::http://www.pqr-project.org/${_pkgname}-${_pkgver}.tar.gz"
	'pqr.desktop')
sha256sums=('de6ebb98ffde2dae669fc4db25d3d9f65af8a5c523dd305e82b24cb17de3ada7'
            'c22cb2c5c98e8cd9cece75160ceb6edf6850fd84cd1c34f7d1325ac83874211a')

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

