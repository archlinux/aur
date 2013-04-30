# Maintainer: Trygve Aaberge <trygveaa+aur at gmail dot com>

pkgname=mopidy-git
pkgver=20130430
pkgrel=1
pkgdesc="A music server which can play music from Spotify"
arch=(any)
url="http://www.mopidy.com"
license=('APACHE')
depends=('python2' 'pyspotify-git' 'python2-pykka' 'python2-distribute' 'gawk' 'gstreamer0.10-python' 'gstreamer0.10-base-plugins' 'gstreamer0.10-good-plugins')
makedepends=('git' 'python2')
optdepends=('python2-cherrypy: HTTP frontend'
            'python2-ws4py: HTTP frontend'
            'python2-pylast: Last.fm frontend'
            'python2-dbus: MPRIS frontend')
provides=('mopidy')
conflicts=('mopidy')
options=(!emptydirs)
backup=('etc/conf.d/mopidy')
source=('mopidy.rc' 'mopidy.conf')
md5sums=('d6e683e985056dcabc4bade0582099ff'
         'd4d6d67d6e1cee1a686d2f2443f2cb6d')

_gitroot="git://github.com/mopidy/mopidy.git"
_gitname="mopidy"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin master
    msg "The local files are updated."
  else
    git clone --depth=1 -b master $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"
  git clean -fdx

  msg "Starting make..."
  python2 setup.py build
}

package() {
  cd "$srcdir/$_gitname"
  python2 setup.py install --prefix=/usr --root=$pkgdir/ --optimize=1

  install -Dm755 "$srcdir/mopidy.rc" "$pkgdir/etc/rc.d/mopidy"
  install -Dm644 "$srcdir/mopidy.conf" "$pkgdir/etc/conf.d/mopidy"
  install -Dm644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
