# Maintainer: Hugo Doria <hugo@archlinux.org>
# Contributor: TuxSpirit<tuxspirit@archlinux.fr>  2007/11/17 21:22:36 UTC

pkgname=p7zip
pkgver=4.58
pkgrel=2
pkgdesc="A command-line port of the 7zip compression utility"
arch=('i686' 'x86_64')
license=('GPL')
url="http://p7zip.sourceforge.net"
depends=(gcc-libs bash)
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/${pkgname}_${pkgver}_src_all.tar.bz2)
md5sums=('315b184102c17c4956f53218d973222d')
install=p7zip.install
options=(!emptydirs)

build() {
  cd ${srcdir}/${pkgname}_${pkgver}

  #Arch64 fix
  if [ "$CARCH" == "x86_64" ]; then
      cp makefile.linux_amd64 makefile.machine
  else
      cp makefile.linux_x86_ppc_alpha_gcc_4.X makefile.machine
  fi

  sed -i "s|usr/local|usr|g" makefile
  sed -i "s|-O1|$CXXFLAGS|g" makefile.machine
  make all3 || return 1
  sed -i "s|DEST_HOME=|DEST_HOME=${pkgdir}/usr # |g" install.sh
  sed -i 's|${DEST_HOME}/man|${DEST_HOME}/share/man|' install.sh
  ./install.sh 
  install -m555 bin/7z.so ${pkgdir}/usr/lib/p7zip/

  sed -i "s|${pkgdir}/usr|/usr|g" ${pkgdir}/usr/bin/7z
  sed -i "s|${pkgdir}/usr|/usr|g" ${pkgdir}/usr/bin/7za
  sed -i "s|${pkgdir}/usr|/usr|g" ${pkgdir}/usr/bin/7zr

  # Install mc's virtual filesystem
  install -m644 -D contrib/VirtualFileSystemForMidnightCommander/u7z \
    ${pkgdir}/usr/share/mc/extfs/u7z
}
