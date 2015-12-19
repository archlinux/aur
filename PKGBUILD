# Maintainer : Yen Chi Hsuan <yan12125@gmail.com>
# Contributor: jyantis <yantis@yantis.net>
# Contributor: Rob McCathie <archaur at rmcc dot com dot au>
# Contributor: Yanus Poluektovich <ypoluektovich@gmail.com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: simo <simo@archlinux.org>

pkgname=python2-imaging
pkgver=1.1.7
pkgrel=11
pkgdesc="PIL. Provides image processing capabilities for python"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'armv6l')
url="http://www.pythonware.com/products/pil/index.htm"
license=('custom:"pil"')
depends=('python2' 'libjpeg' 'freetype2' 'lcms')
makedepends=('tk' 'sane')
optdepends=('tk: for the ImageTK module'
            'sane: for the ImageSane module')
provides=("pil=${pkgver}" 'python2-pillow=1.0')
conflicts=('pil')
replaces=('pil')
source=(http://effbot.org/downloads/Imaging-${pkgver}.tar.gz)
md5sums=('fc14a54e1ce02a0225be8854bfba478e')

build() {
  cd "${srcdir}/Imaging-${pkgver}"

  # FS#33452
  export CFLAGS="$CFLAGS -fno-strict-aliasing"

  python2 setup.py build_ext
  cd Sane
  python2 setup.py build_ext
}

package() {
  cd "${srcdir}/Imaging-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1

  pushd Sane
  python2 setup.py install --root="${pkgdir}" --optimize=1
  popd

  install -dm755 "${pkgdir}/usr/include/python2.7/"
  install -m644 -t "${pkgdir}/usr/include/python2.7/" libImaging/*.h

  # do not have files ending in .py in /usr/bin
  for f in pildriver pilprint pilconvert pilfile pilfont; do
    mv "${pkgdir}"/usr/bin/${f}{.py,}
  done

  # Install license
  install -Dm644 "${srcdir}/Imaging-${pkgver}/README" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/README"
}
