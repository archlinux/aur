# Maintainer: Bao Trinh <qubidt@gmail.com>
# Contributor: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=gimp-plugin-image-reg
_srcname=gimp-image-reg
pkgver=2.0.1
pkgrel=1
pkgdesc="Image registration plugin for the GIMP"
arch=('i686' 'x86_64')
url="https://gimp-image-reg.sourceforge.io/"
license=('GPL3')
depends=('gimp')
makedepends=('intltool' 'gettext' 'cmake')
source=("https://downloads.sourceforge.net/sourceforge/${_srcname}/version-${pkgver}/${_srcname}-${pkgver}-source.zip")
noextract=("${_srcname}-${pkgver}-source.zip")
md5sums=('64d1e579c12b45131bf8ebdc54ad19b4')

prepare() {
  mkdir "${_srcname}-${pkgver}"
  bsdtar xvf "${_srcname}-${pkgver}-source.zip" -C "${_srcname}-${pkgver}"
}

build() {
  cmake \
      -B "${_srcname}-${pkgver}/build" \
      -S "${_srcname}-${pkgver}" \
      -DCMAKE_BUILD_TYPE:STRING='None' \
      -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
      -Wno-dev

  cd "${_srcname}-${pkgver}"
  cmake --build build --target install
}

package() {
  cd "${_srcname}-${pkgver}"
  install -m755 -d "$pkgdir/usr/lib/gimp/2.0/plug-ins"
  install -m755 -d "$pkgdir/usr/share/doc/${pkgname}"

  install -m644 build/install/README.md "$pkgdir/usr/share/doc/${pkgname}/"
  install -m755 build/install/gimp-image-reg.py "$pkgdir/usr/lib/gimp/2.0/plug-ins/"
  cp -ra build/install/imreg "$pkgdir/usr/lib/gimp/2.0/plug-ins/"
}
