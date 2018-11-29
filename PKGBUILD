# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: dreieck
# Contributor: Gustavo Lopes <mail@geleia.net>

set -u
_pkgname='riofs'
pkgname="${_pkgname}-git"
_srcdir="${pkgname}"
pkgver=0.6.r86.g40e5396
pkgrel=1
pkgdesc='FUSE userspace filesystem for Amazon AWS S3 buckets'
arch=('i686' 'x86_64')
url="https://github.com/skoobe/${_pkgname}"
license=('GPL3')
depends=('file' 'fuse' 'glib2' 'libevent' 'libxml2' 'openssl')
makedepends=('pkg-config' 'git')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
_verwatch=("${url}/releases" "${url#*github.com}/archive/v\(.*\)\.tar\.gz" 'l')
source=("${_srcdir}::git+${url}.git") # #commit=${pkgver##*.g}
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  git describe --long --tags | sed -e 's/^v//g' -e 's/\([^-]*-g\)/r\1/' -e 's/-/./g'
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    ./autogen.sh
    ./configure --prefix='/usr' --includedir='/usr/include/riofs'
  fi
  make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s DESTDIR="${pkgdir}" install
  set +u
}
set +u

# vim:set ts=2 sw=2 et:
