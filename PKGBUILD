# Maintainer: fuan_k <rrkay at posteo dot net>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Nathan O <ndowens.aur at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=diffimg
_pkgname=Diffimg
_newpkgname=Diffimg-xbee # possible future name due to conflict
pkgver=2.2.0
pkgrel=3
pkgdesc="Simple image comparison tool"
arch=('i686' 'x86_64')
license=('GPL2')
depends=(qt4 qwt-qt4 opencv)
optdepends=(freeimage)
makedepends=(cmake)
url='http://sourceforge.net/projects/diffimg/'
source=(
"http://sourceforge.net/projects/diffimg/files/${pkgver}/${_pkgname}-${pkgver}-src.zip"
diffimg.desktop
fix-opencv-headers.patch
)
install='diffimg.install'
md5sums=('e97610c4a265524297bc20268870556a'
        '98d6aae50942ef908313515bdd9b02f4'
        '383406fdf35e39750a7cf14d0a275770')

prepare(){
  cd "${srcdir}"/${_pkgname}-${pkgver}-src
  sed -i -e 's/\r//' \
    -e 's/|/-print0 |/' \
    -e "s#dos2unix#-0 sed -i 's|\\\r||'#" \
    tounix.sh
  chmod +x tounix.sh
  ./tounix.sh
   # OpenCV4 split headers for modules
   patch -p1 -i ../fix-opencv-headers.patch
}

build() {
  cd ${_pkgname}-${pkgver}-src/build
  #qmake-qt4 -recursive INSTALL_PREFIX=/usr diffimg.pro
  #cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr .
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  #cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}" . #for makechrootpkg -r $CHROOT -- ief
  make
}

package() {
  cd ${_pkgname}-${pkgver}-src/build
  install -Dm644 ../../${pkgname}.desktop "${pkgdir}"/usr/share/applications/${_pkgname}.desktop

  #make DESTDIR="${pkgdir}" INSTALL_ROOT="${pkgdir}" install
  #make INSTALL_ROOT="${pkgdir}" install

  make DESTDIR="${pkgdir}" prefix="${pkgdir}" install

  # remove cmake's generated file we don't need
  rm "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # fix name conflicts with graphviz/diffimg
  #install -Dm755 "./usr/bin/${pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  mv "${pkgdir}/usr/bin/${pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  #install -Dm644 "./usr/share/man/man1/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
  mv "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"

  install -Dm644 "../res/diffimg.ico" "${pkgdir}/usr/share/pixmaps/${_pkgname}/${_pkgname}.ico"
  install -Dm644 "../res/diffimg.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}/${_pkgname}.png"
  mv "${pkgdir}/usr/share/pixmaps/diffimg.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}/${_pkgname}.png"

}
