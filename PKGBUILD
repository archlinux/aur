# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit.com>
pkgname=evd-git
pkgver=20111031
pkgrel=1
pkgdesc="eventdance, a peer-to-peer inter-process communication library."
arch=(i686 x86_64)
url="https://gitorious.org/eventdance/eventdance"
license=('LGPL')
depends=(json-glib gjs libsoup util-linux)
optdepends=('gtkdocise: generating api docs')
provides=('evd')
makedepends=('git')

_gitroot=git://gitorious.org/eventdance/eventdance
_gitname=eventdance

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  #
  # BUILD HERE
  #

  # We got no gjs-gi, compiles fine though
  sed -i 's/^.*gjs-gi.*$//' m4/javascript.m4
  ./autogen.sh --enable-js=yes --enable-introspection=yes
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
