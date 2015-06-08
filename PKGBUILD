pkgname=scantool
pkgver=1.21
pkgrel=1
pkgdesc="OBD-II vehicle diagnostic scanner"
arch=('i686' 'x86_64')
url="http://www.scantool.net"
license=('GPL')
depends=('allegro4')
source=("http://downloads.sourceforge.net/dzcomm/dzcomm/0.9.9i/dz099i.zip"
        "https://www.scantool.net/scantool/downloads/82/scantool_net121src.zip"
        "http://http.debian.net/debian/pool/main/s/scantool/scantool_1.21+dfsg-5.debian.tar.xz")
md5sums=('2540dd366cf08de2ff1a97880315e921'
         'c87b53a2d3bbc4ee1f29245be9412457'
         '8ff409e7e83aebc8af66249e2eb30577')
noextract=('scantool_net121src.zip')

prepare () {
  pushd dz099i
  find . -type f -print0 | xargs -0 dos2unix
  patch -p2 -i "${srcdir}"/debian/patches/dzcomm-usb-serial.patch
  patch -p2 -i "${srcdir}"/debian/patches/kfreebsd-build-fixes.patch
  patch -p2 -i "${srcdir}"/debian/patches/build-flags.patch
  autoreconf
  sh ./configure
  chmod a+x misc/*.sh
  popd

  mkdir -p ${pkgname}-${pkgver} && cd ${pkgname}-${pkgver}
  bsdtar xf "${srcdir}"/scantool_net121src.zip
  cp -r "${srcdir}"/debian .
  patch -p1 -i debian/patches/scantool-linux-build.patch
  patch -p1 -i debian/patches/logging-newlines.patch
  patch -p1 -i debian/patches/drop-listports.patch
  patch -p1 -i debian/patches/allow-elm327-clones.patch
  patch -p1 -i debian/patches/drop-report-request.patch
  patch -p1 -i debian/patches/multi-code.patch
}

build() {
  cd dz099i
  make depend
  make lib

  cd "${srcdir}"/${pkgname}-${pkgver}
  make CFLAGS="$CPPFLAGS $CFLAGS -I../dz099i/include -DDZCOMM_DJGPP=1" LDFLAGS="$LDFLAGS -L../dz099i/lib/unix"
  cd "${srcdir}"/${pkgname}-${pkgver}
  make -C debian/codes
}


package () {
  install -d "${pkgdir}"/usr/bin
  install -m755 "${srcdir}"/${pkgname}-${pkgver}/${pkgname} "${pkgdir}"/usr/bin/scantool-net
  install -d "${pkgdir}"/usr/share/scantool
  install -m644 "${srcdir}"/${pkgname}-${pkgver}/${pkgname}.dat "${pkgdir}"/usr/share/scantool
  install -m644 "${srcdir}"/${pkgname}-${pkgver}/debian/codes/codes.dat "${pkgdir}"/usr/share/scantool
}

