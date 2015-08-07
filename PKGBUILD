# Contributor: Philipp Gesang <phg42.2a@gmail.com>
#
# header of the original swig PKGBUILD in extra:
# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=swig-git
pkgrel=1
pkgver=rel.3.0.3.r4.gaa4d034
pkgdesc="Generate scripting interfaces to C/C++ code"
arch=("i686" "x86_64")
url="http://www.swig.org/"
license=("custom")
depends=("zlib" "pcre")
makedepends=("git" "yodl")
conflicts=("swig")
provides=("swig")

_gitroot="https://github.com/swig/swig"
_gitname="swig"
_gitbranch="master"

source=("${_gitname}::git+https://github.com/swig/${_gitname}#branch=${_gitbranch}")
sha1sums=("SKIP")

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin master
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m644 LICENSE-UNIVERSITIES "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE-UNIVERSITIES
}

# vim:ft=sh:ts=8:et:sw=2
