# Contributor: Olivier Mehani <shtrom-aur@ssji.net>
# $Id$
pkgname=mpdris-git
pkgver=20110110
pkgrel=1
pkgdesc="An implementation of the XMMS2 media player interface MPRIS as a client for MPD"
arch=('i686' 'x86_64')
url="http://ayeon.org/projects/mpDris/"
license=('GPL')
depends=('python2>=2.4' 'dbus-python>=0.80' 'pygobject>=2.14' 'python-mpd>=0.2.0')
optdepends=('mpd: the Music Player Daemon')
makedepends=('subversion')
replaces=("mpdris-svn")
conflicts=("mpdris" "mpdris-svn")
backup=(etc/mpDris.conf)

_gitroot="git://ayeon.org/mpris.git"
_gitname="mpris"


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build/mpDris"
  sed -i "1s/python$/&2/" mpDris setup.py list_names.py

  python2 setup.py install --root=$pkgdir
  install -m 0644 -D mpDris.conf $pkgdir/etc/mpDris.conf
  sed -i "s/password.*/password =/" $pkgdir/etc/mpDris.conf
}
