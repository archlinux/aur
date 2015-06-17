# P1mper : M0Rf30
pkgname=watchvideo-svn
pkgver=120
pkgrel=1
pkgdesc="A small application to play, download, rip or convert (to Ogg) videos from popular YouTube-like sites, without the need of the proprietary Flash plugin."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/watchvideo/index.html"
license=('GNU Affero GPL')
groups=()
depends=('qt' 'python2' 'python-lxml' 'python-simplejson' 'mplayer' 'pyqt' 'mediainfo')
optdepends=('python-notify' 'ffmpeg' 'ffmpeg2theora')
makedepends=('subversion' 'python2-distribute')

_svntrunk="svn://svn.sv.gnu.org/watchvideo"
_svnmod=watchvideo

build() {
   cd ${srcdir}
  rm -rf $srcdir/build

  if [ -d ${_svnmod} ]; then
    msg "Updating SVN tree ..."
    cd ${_svnmod}
    svn revert -R .
    svn up -r $pkgver || return 1
    msg "SVN update finished, starting build ..."
  else
    msg "Doing SVN checkout ..."
    svn co ${_svntrunk} ${_svnmod} -r $pkgver || return 1
    cd ${_svnmod}
    msg "SVN checkout finished, starting build ..."
  fi
  cp -r $srcdir/${_svnmod} $srcdir/build
  cd $srcdir/build
  export PYTHON=python2
  python2 setup.py build 
  python2 setup.py install --root=$pkgdir
  chmod +x utils/install-desktop-entry.sh
  utils/install-desktop-entry.sh $pkgdir/usr
  mv $pkgdir/usr/share/applications $pkgdir/usr/share/watchvideo
}


