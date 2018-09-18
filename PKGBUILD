# Maintainer: Tobias Kieslich <neri@archlinux.org>
# Contributor: Ben <contrasutra@myrealbox.com>

pkgbase=lcms
pkgname=(lcms python2-lcms)
pkgver=1.19
pkgrel=7
pkgdesc='Lightweight color management development library/engine'
arch=('x86_64')
license=('custom')
depends=('libtiff')
makedepends=('python2')
url='http://www.littlecms.com'
source=("https://downloads.sourceforge.net/sourceforge/${pkgbase}/${pkgbase}-${pkgver}.tar.gz"
        'cve-2013-4276.patch')
sha256sums=('80ae32cb9f568af4dc7ee4d3c05a4c31fc513fc3e31730fed0ce7378237273a9'
            'cd10cc5ce791ae782b1257e6181a71cbdb685b705779c9ef2ceffc7fb2021bd0')

prepare() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  patch -Np1 -i ../cve-2013-4276.patch
}

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --with-python
  make
  make -C python
}

package_lcms() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -D -m0644 COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -rf "${pkgdir}/usr/lib/python2.7/"
}

package_python2-lcms() {
  pkgdesc='LittleCMS Python bindings'
  depends=('lcms')

  cd "${srcdir}/${pkgbase}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -D -m0644 COPYING \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  rm -rf "${pkgdir}/usr/"{bin,include,lib/{pkgconfig,liblcms.*},share/man}
}
