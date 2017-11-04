# Maintainer: Philipp Überbacher <murks at lavabit dot com>
pkgname=a2jmidid-git
pkgver=20171104.7656afa
pkgrel=1
pkgdesc="Daemon for exposing legacy ALSA sequencer applications in JACK MIDI system."
arch=('i686' 'x86_64')
url="http://home.gna.org/a2jmidid/"
license=('GPL')
depends=('jack' 'dbus' 'python2')
makedepends=('git')
conflicts=('a2jmidid')
provides=('a2jmidid')
install=${pkgname}.install

_gitroot="git://repo.or.cz/a2jmidid.git"
_gitname="a2jmidid"

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  #
  # BUILD HERE
  #
  
  sed -i 's|python|python2|' a2j_control
  python2 ./waf configure --prefix=/usr
  python2 ./waf
}

package() {
  cd "${srcdir}/${_gitname}-build"

  python2 ./waf install --destdir=${pkgdir}

  install -Dm444 README ${pkgdir}/usr/share/a2jmidid/README
} 
