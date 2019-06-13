# Maintainer: Grey Christoforo <first name at last name dot net>
pkgname=epics-base
pkgver=7.0.2.2
pkgrel=1
pkgdesc="Experimental Physics and Industrial Control System -- base"
arch=('any')
url="https://epics-controls.org"
license=('EPICS Open License')
groups=('epics')
depends=('readline' 'ncurses' 'clang' 'perl')
source=("https://github.com/epics-base/epics-base/archive/R${pkgver}.tar.gz")
md5sums=('2f222803cb62f90bc7832fb16d829646')

prepare() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  
  > configure/CONFIG_SITE.local

  # for a static build
  #printf "SHARED_LIBRARIES=NO\nSTATIC_BUILD=YES\n" >> configure/CONFIG_SITE.local
}

build() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  make FINAL_LOCATION=/usr
}

check() {
  cd "$srcdir/${pkgname}-R${pkgver}"

  make runtests
}

package() {
  cd "$srcdir/${pkgname}-R${pkgver}"
  
  #make INSTALL_LOCATION="${pkgdir}/usr"
  
  # figure out what architecture EPICS is installing for
  _ARCH=$(perl -CSD src/tools/EpicsHostArch.pl)

  mkdir -p "${pkgdir}/usr"

  cp -a db "${pkgdir}/usr"
  cp -a dbd "${pkgdir}/usr"
  cp -a include "${pkgdir}/usr"
  cp -a cfg "${pkgdir}/usr"
  cp -a bin "${pkgdir}/usr"
  cp -a lib "${pkgdir}/usr"
  
  mv "${pkgdir}/usr/bin/${_ARCH}"/* "${pkgdir}/usr/bin"/.
  rm -rf "${pkgdir}/usr/bin/${_ARCH}"
  find "${pkgdir}/usr/bin" -type f -exec strip --strip-all {} \; 2>/dev/null

  mv "${pkgdir}/usr/lib/${_ARCH}"/* "${pkgdir}/usr/lib"/.
  rm -rf "${pkgdir}/usr/lib/${_ARCH}"
  find "${pkgdir}/usr/lib" -type f -exec strip --strip-all {} \; 2>/dev/null

  # just strip everything because makepkg can't for whatever reason
  find "${pkgdir}" -type f -exec strip --strip-all {} \; 2>/dev/null

  # fix refs to $srcdir
  #sed 's,^prefix=.*,prefix=/usr,' -i "${pkgdir}/usr/lib/pkgconfig/epics-base-${_ARCH}.pc"
  #sed 's,^prefix=.*,prefix=/usr,' -i "${pkgdir}/usr/lib/pkgconfig/epics-base.pc"

  # fix bindir and libdir
  sed 's,^bindir=.*,bindir=${prefix}/bin,' -i "${pkgdir}/usr/lib/pkgconfig/epics-base-${_ARCH}.pc"
  sed 's,^libdir=.*,libdir=${prefix}/lib,' -i "${pkgdir}/usr/lib/pkgconfig/epics-base-${_ARCH}.pc"
  sed 's,^bindir=.*,bindir=${prefix}/bin,' -i "${pkgdir}/usr/lib/pkgconfig/epics-base.pc"
  sed 's,^libdir=.*,libdir=${prefix}/lib,' -i "${pkgdir}/usr/lib/pkgconfig/epics-base.pc"

  # fix refs to $pkgdir
  #perl -pi -e "s,{pkgdir}/usr/lib/${_ARCH},/usr/lib," "$pkgdir/usr/bin/caRepeater"
  #bbe -e "s,${pkgdir}/usr/lib/${_ARCH},/usr/lib," "$pkgdir/usr/bin/caRepeater" > "$pkgdir/usr/bin/caRepeater".new

  rm "$pkgdir/usr/include/link.h" # owned by glibc
}

