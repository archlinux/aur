# Maintainer: milkii on freenode
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=seq66
pkgname="${_pkgname}-devel-git"
pkgver=0.98.3.r773.0e0722f6
pkgrel=1
pkgdesc="A live-looping sequencer with an Qt graphical interface (git version)"
arch=('i686' 'x86_64')
url="https://github.com/ahlstromcj/seq66"
license=('GPL2')
depends=('qt5-base')
makedepends=('git' 'alsa-lib' 'jack' 'liblo')
groups=('pro-audio')
provides=("${_pkgname}" "${_pkgname}-git" "${_pkgname}=${pkgver//.r*/}")
conflicts=("${_pkgname}" "${_pkgname}-git")
source=("${_pkgname}::git+https://github.com/ahlstromcj/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git checkout $(git for-each-ref refs/remotes/origin --sort="-committerdate" | head -1 | cut -d '/' -f 4) -q

  local ver=$(tail -n 1 VERSION)
  echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  
  ./bootstrap --enable-debug
  ./configure --prefix=/usr --enable-rtmidi
  make
}

package() {
  depends+=('libasound.so' 'libjack.so' 'liblo.so')
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}/" install
}
