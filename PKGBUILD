# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=antiktv-svn
pkgver=4
pkgrel=1
pkgdesc="Program for watching IPTV from local ISP Antik.sk"
arch=('i686')
url="http://code.google.com/p/antiktv/"
license=('GPL')
source=('antiktv.desktop')
makedepends=('fpc' 'lazarus' 'gtk2')
md5sums=('28ff7e3cd81a075d3077f79aa9a46308')

_svntrunk="http://antiktv.googlecode.com/svn/trunk/"
_svnmod="antiktv"

build() {
        cd $srcdir

        # get the sources
        msg "Connecting to $_svntrunk ..."
        if [ -d $_svnmod/.svn ]; then
                (cd $_svnmod && svn up) || return 1
        else
                svn co $_svntrunk $_svnmod || return 1
        fi
        msg "SVN checkout done or server timeout"

  install -D -m644 $srcdir/antiktv.desktop $pkgdir/usr/share/applications/antiktv.desktop || return 1

  cd $srcdir/antiktv
  fpc -MObjFPC -Sgi -O1 -Xs -WG -vewnhi -l -Fu/usr/lib/lazarus/lcl/units/i386-linux/ -Fu/usr/lib/lazarus/lcl/units/i386-linux/gtk2/ -Fu/usr/lib/lazarus/packager/units/i386-linux/ -Fu. -FE. -oantiktv -dLCL -dLCLgtk2 ./antiktv.lpr
  install -D -m755 $srcdir/antiktv/antiktv $pkgdir/usr/bin/antiktv
}
