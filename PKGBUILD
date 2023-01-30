# Maintainer: Ronald Record <github@ronrecord.com>

pkgname=libgaia2
pkgver=v2.4.6r2
pkgrel=1
pkgdesc="C++ library with python bindings which implements similarity measures and classifcations on the results of audio analysis, and generates classifcation models that Essentia can use to compute high-level description of music."
arch=('x86_64' 'armv7h')
url="https://github.com/doctorfree/gaia"
license=('AGPL3')
makedepends=(eigen git libyaml pkg-config python qt5-base swig)
source=("${pkgname}::git+https://github.com/doctorfree/gaia.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
    # Prior to configure, determine SSE2 support and set CXXFLAGS
    grep sse2 /proc/cpuinfo > /dev/null || {
      # Remove -msse2 from CXXFLAGS
      cat wscript | sed -e "s/'-O2', '-msse2'/'-O2'/" > /tmp/wsc$$
      cp /tmp/wsc$$ wscript
      rm -f /tmp/wsc$$
    }
}

build() {
  cd "${srcdir}/${pkgname}"
  # Build gaia
  ./waf configure --prefix=/usr --with-python-bindings --with-asserts
  ./waf
}

package() {
  cd "${srcdir}/${pkgname}"
  ./waf install --destdir="${pkgdir}"

  destdir=usr
  [ -d ${pkgdir}/${destdir}/share ] || {
    mkdir -p ${pkgdir}/${destdir}/share
  }
  [ -d ${pkgdir}/${destdir}/share/doc ] || {
    mkdir -p ${pkgdir}/${destdir}/share/doc
  }
  [ -d ${pkgdir}/${destdir}/share/doc/${pkgname} ] || {
    mkdir -p ${pkgdir}/${destdir}/share/doc/${pkgname}
  }
  cp AUTHORS ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp ChangeLog ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp COPYING.txt ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp README.md ${pkgdir}/${destdir}/share/doc/${pkgname}
  cp VERSION ${pkgdir}/${destdir}/share/doc/${pkgname}
  gzip -9 ${pkgdir}/${destdir}/share/doc/${pkgname}/ChangeLog
  chmod 755 ${pkgdir}/${destdir}/bin/* ${pkgdir}/${destdir}/bin
}
