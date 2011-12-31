# Maintainer: Rickard Nilsson <rickard.nilsson@telia.com>

pkgname=mopidy-git
pkgver=20111229
pkgrel=1
pkgdesc="A music server which can play music from Spotify"
arch=(any)
url="http://www.mopidy.com"
license=('APACHE')
depends=('python2' 'gstreamer0.10-python' 'pyspotify-git' 'gawk' 'python2-pykka' 'gstreamer0.10-good-plugins')
makedepends=('python2')
source=('mopidy.rc' 'mopidy.conf')
provides=('mopidy')
conflicts=('mopidy')
options=(!emptydirs)
backup=('etc/conf.d/mopidy')
md5sums=('d6e683e985056dcabc4bade0582099ff'
         'd4d6d67d6e1cee1a686d2f2443f2cb6d')

_gitroot="git://github.com/mopidy/mopidy.git"
_gitname="mopidy"

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
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --root=$pkgdir/ --optimize=1

  install -D -m755 "${srcdir}/mopidy.rc" "${pkgdir}/etc/rc.d/mopidy"
  install -D -m644 "${srcdir}/mopidy.conf" "${pkgdir}/etc/conf.d/mopidy"
}
