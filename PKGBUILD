# $Id: PKGBUILD,v 1.15 2008/01/08 05:29:43 aaron Exp $
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: TuxSpirit<tuxspirit@archlinux.fr>  2007/11/17 21:22:36 UTC

pkgname=p7zip
pkgver=4.57
pkgrel=1
pkgdesc="A command-line port of the 7zip compression utility"
arch=(i686 x86_64)
license=('GPL')
url="http://p7zip.sourceforge.net"
depends=(gcc-libs bash)
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/${pkgname}_${pkgver}_src_all.tar.bz2)
install=p7zip.install
options=(!emptydirs)
md5sums=('773f78d8b297eb858626667d4dfa93c7')

build() {
  cd $startdir/src/${pkgname}_${pkgver}

  #Arch64 fix
  if [ "$CARCH" == "x86_64" ]; then
      cp makefile.linux_amd64 makefile.machine
  else
      cp makefile.linux_x86_ppc_alpha_gcc_4.X makefile.machine
  fi

  sed -i "s|usr/local|usr|g" makefile
  sed -i "s|-O1|$CXXFLAGS|g" makefile.machine
  make all3 || return 1
  sed -i "s|DEST_HOME=|DEST_HOME=$startdir/pkg/usr # |g" install.sh
  ./install.sh
  install -m555 bin/7z.so $startdir/pkg/usr/lib/p7zip/

  sed -i "s|$startdir/pkg/usr|/usr|g" $startdir/pkg/usr/bin/7z
  sed -i "s|$startdir/pkg/usr|/usr|g" $startdir/pkg/usr/bin/7za
  sed -i "s|$startdir/pkg/usr|/usr|g" $startdir/pkg/usr/bin/7zr

  # Install mc's virtual filesystem
  install -m644 -D contrib/VirtualFileSystemForMidnightCommander/u7z \
    $startdir/pkg/usr/share/mc/extfs/u7z
}
