# Contributor: Olivier Mehani <shtrom-aur@ssji.net>

pkgname=flv2mpeg4-svn
pkgver=3
pkgrel=1
pkgdesc="Adobe(R) Flash(R) Video format (FLV) to MPEG4 Transcoder from vixy.net."
url="http://vixynet.sourceforge.net/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('a52dec' 'bzip2' 'faac' 'faad2' 'ffmpeg' 'lame' 'libogg' 'libtheora' 'libvorbis' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'x264' 'xvidcore' 'zlib')
provides=('flv2mpeg4')
conflicts=('flv2mpeg4')
makedepends=('subversion')

source=(Makefile)
md5sums=(f649789cef4a4e703aa95b4b393c24fc)

_svntrunk=https://vixynet.svn.sourceforge.net/svnroot/vixynet/trunk/flv2mpeg4
_svnmod=flv2mpeg4

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Copying local stubby Makefile..."
  cp ${startdir}/Makefile $_svnmod/src
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build/src

  make || return 1
  make DESTDIR=${pkgdir} install || return 2
}
