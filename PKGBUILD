# DAE plugin maintainer: Guilhem Saurel <guilhem.saurel[at]laas.fr>
# Original source: https://git.archlinux.org/svntogit/community.git/tree/trunk/PKGBUILD?h=packages/openscenegraph

# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Hans Janssen <janserv@gmail.com>
# Contributor: my64 <packages@obordes.com>
# Contributor: Colin Pitrat <colin.pitrat@gmail.com>

_pkgname=OpenSceneGraph
pkgname="openscenegraph-dae"
pkgver=3.6.5
pkgrel=3
pkgdesc='Open Source, high performance real-time graphics toolkit'
url='http://www.openscenegraph.org'
arch=('x86_64')
license=('custom:OSGPL')
depends=('giflib' 'jasper' 'librsvg' 'xine-lib' 'curl')
makedepends=('cmake' 'libvncserver' 'qt5-base' 'ffmpeg' 'mesa')
optdepends=('libvncserver' 'gdal' 'openexr' 'poppler-glib' 'qt5-base' 'ffmpeg')
source=("https://github.com/${_pkgname}/${_pkgname}/archive/${_pkgname}-${pkgver}.tar.gz" "dae-only.patch")
sha512sums=('7002fa30a3bcf6551d2e1050b4ca75a3736013fd190e4f50953717406864da1952deb09f530bc8c5ddf6e4b90204baec7dbc283f497829846d46d561f66feb4b'
            'fa7fddc2abfd0d80c8ba01510fb899ee20029ef4425acead2747e983416e50734803cb3c6c50362b00b82d1c32b6bee4622c951fe38be24a80d38ae66e6c7a49')

prepare() {
  patch -d "${_pkgname}-${_pkgname}-${pkgver}" -p0 -i "$srcdir/dae-only.patch"
}

build() {
  cmake -B "build-$pkgver" -S "${_pkgname}-${_pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  cmake --build "build-$pkgver"
}

package() {
  DESTDIR="$pkgdir/" cmake --build "build-$pkgver" -t install

  install -Dm 644 "${_pkgname}-${_pkgname}-$pkgver/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd "${pkgdir}/usr/"
  rm -rf bin include lib/pkgconfig
  find lib -type f ! -name osgdb_dae.so -delete
  find lib -type l -delete
}

# vim: ts=2 sw=2 et:
