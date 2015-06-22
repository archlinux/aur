# Based on the following version of extra/libmtp:
# $Id: PKGBUILD 155745 2012-04-06 00:05:58Z tomegun $
#
# Contributor: damir <damir@archlinux.org>
# Contributor: Kevin Edmonds <edmondskevin@hotmail.com>
# Contributor: John Karahalis <john.karahalis@gmail.com>
#
# GitHub repository: https://github.com/openjck/libmtp-git
#
# Changed to philipl's git: Lubosz Sarnecki <lubosz@gmail.com>


pkgname=libmtp-gvfs-git
pkgver=20120910
pkgrel=1
pkgdesc="Library implementation of the Media Transfer Protocol"
arch=("i686" "x86_64")
url="http://libmtp.sourceforge.net"
license=('LGPL')
depends=('libusb')
options=('!libtool')
conflicts=('libmtp' 'libmtp-git')
provides=('libmtp')

#_gitroot="git://libmtp.git.sourceforge.net/gitroot/libmtp/libmtp"
_gitroot="git://github.com/philipl/libmtp.git"
_gitname="libmtp"

build() {
  cd "${srcdir}"
  msg "Connecting to Git server...."

  if [ -d $_gitname ]; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot $_gitname
  fi

  msg "Git checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  yes | ./autogen.sh
  ./configure --prefix=/usr --with-udev=/usr/lib/udev
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}" install
}
