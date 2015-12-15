# Contributor: Anntoin Wilkinson <anntoin gmail com>
# Contributor: Shirakawasuna <Shirakawasuna@gmail.com>
# Maintainer: SanskritFritz (gmail)

pkgname=gdc1-bin
pkgver=0.24
pkgrel=11
pkgdesc="Digital Mars D Programing Language (DMD) frontend for GCC."
arch=('i686' 'x86_64')
url="http://dgcc.sourceforge.net/"
license=('GPL')
provides=('gdc1')
conflicts=('gdc-bin' 'gdc1-hg')
depends=('gcc-libs>=4.1.2' 'perl')
options=(staticlibs)
source_i686=("http://downloads.sourceforge.net/project/dgcc/gdc/${pkgver}/gdc-${pkgver}-i686-linux-gnu-gcc-4.1.2.tar.bz2")
source_x86_64=("http://downloads.sourceforge.net/project/dgcc/gdc/${pkgver}/gdc-${pkgver}-x86_64-linux-gnu-gcc-4.1.2.tar.bz2")
md5sums_i686=('7503344b7b2ee882629eef877be9da7a')
md5sums_x86_64=('f4fecc6a5059f8f3de56b65cc4589bbd')

package() {
  # Create Directories
  install -d "${pkgdir}/usr/"{bin,lib,include,share/{man/man1,doc/gdc1}}

  cd "${srcdir}/gdc"

  # Install man pages and documentation
  install -m644 ./man/man1/gdc.1 "${pkgdir}/usr/share/man/man1/gdc1.1"
  install -m644 ./man/man1/gdmd.1 "${pkgdir}/usr/share/man/man1/gdmd1.1" 
  install -m644 -t "${pkgdir}/usr/share/doc/gdc1/" ./share/doc/gdc/{GDC.html,README.GDC}

  # Change regex so gdmd1 can find gdc1
  sed -i '57s/-//2' ./bin/gdmd

  # Install Binaries
  install -m755 ./bin/gdc "${pkgdir}/usr/bin/gdc1"
  install -m755 ./bin/gdmd "${pkgdir}/usr/bin/gdmd1"
  install -m755 -t "${pkgdir}/usr/bin/" ./libexec/*/$CHOST/*/{cc1d,collect2}

  # Install Library
  if [ ${CARCH} == 'x86_64' ]; then
    install -m644 -t "${pkgdir}/usr/lib/" lib64/libgphobos.a 
  else
    install -m644 -t "${pkgdir}/usr/lib/" lib/libgphobos.a 
  fi
  
  # Install other resources
  find {include/d,lib/gcc} -type f -exec install -Dm644 {} "${pkgdir}/usr/"{} \;
}

# vim:set ts=2 sw=2 et:
