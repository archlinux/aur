# Maintainer: Peter Blackman <peter at pblackman dot plus dot com>
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: Valeriy Lyasotskiy <onestep@ukr.net>
# Contributor: Jan Willemson <janwil@hot.ee>
# Contributor: Hugo Ideler <hugoideler@dse.nl>
# Original PKGBUILD: Andre Naumann <anaumann@SPARCed.org>

pkgname=fpc-rc
_pkgname=fpc
pkgver=3.2.4
# minus not allowed in pkgver
_rc=-rc2
pkgrel=2
pkgdesc="Free Pascal Compiler, Release candidate."
arch=('x86_64')
url="http://www.freepascal.org/"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
backup=("etc/fpc.cfg")
depends=('ncurses' 'zlib' 'expat' 'binutils' 'make')
makedepends=(fpc)
options=(zipman libtool staticlibs !strip !debug)
conflicts=(fpc)
provides=(fpc)
source=("https://downloads.freepascal.org/fpc/beta/${pkgver}${_rc}/source/${_pkgname}-${pkgver}${_rc}.source.tar.gz"
        honor_SOURCE_DATE_EPOCH_in_date.patch)
sha512sums=('97602c537b2fc77f50a3b8538b387a03ec3e705ca589c743ecfa92d0a8259116c066ac720174feba3b00caef806fd29cd849cd00a6c83b0223f0870d8affe152'
            'f7371d533c8116f0c306d0e2fc7851a580f0777d5365f0d6a7b39770b9834d4de3d7ae6220d8090653eaeb5d6df71eaa0abbcbb423c1a1c153302930752a1822')

prepare() {
  cd "${srcdir}"/fpc-${pkgver}${_rc}
  patch -Np1 -i "${srcdir}"/honor_SOURCE_DATE_EPOCH_in_date.patch
}

build() {
  cd "${srcdir}"/fpc-${pkgver}${_rc}
  pushd compiler
  fpcmake -Tall
  popd
  make build
}

package() {
  cd "${srcdir}"/fpc-${pkgver}${_rc}

  export HOME="${srcdir}"

  make -j1 PREFIX="${pkgdir}"/usr NO_MAN_COMPRESS=1 install

  export PATH="${pkgdir}"/usr/bin:$PATH

  install -Dm0644 rtl/COPYING.FPC usr/share/licenses/${_pkgname}/COPYING.FPC

  [ "$CARCH" = "x86_64" ] && ln -s /usr/lib/fpc/${pkgver}/ppcx64 "${pkgdir}"/usr/bin/

  mkdir -p etc
  "${pkgdir}"/usr/lib/fpc/${pkgver}/samplecfg "${pkgdir}/usr/lib/fpc/${pkgver}" "${pkgdir}/etc"
  "${pkgdir}"/usr/lib/fpc/${pkgver}/samplecfg "${pkgdir}/usr/lib/fpc/${pkgver}" "${pkgdir}/etc"

  # use -fPIC by default
  echo -e "#ifdef cpux86_64\n# for x86_64 use -fPIC by default\n-Cg\n#endif" >> "${pkgdir}/etc/fpc.cfg"

  find "${pkgdir}"/etc/ -type f -exec sed -i "s|"${pkgdir}"||g" {} \;
}
