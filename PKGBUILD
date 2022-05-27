# Contributor: Emersion <contact at emersion dot fr>
# https://github.com/emersion/aur-markmywords
#
# Author: voldyman <voldyman666 at gmail dot com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_gitname="MarkMyWords"
_pkgname="markmywords"
pkgname="${_pkgname}-git"
pkgver=0.1.3.4.g970b459
pkgrel=2
pkgdesc="A minimal markdown editor."
url="https://github.com/voldyman/MarkMyWords"
arch=('i686' 'x86_64')
license=('custom')
depends=('gtksourceview3' 'glib2' 'gtk3' 'webkit2gtk')
makedepends=('vala' 'gobject-introspection' 'cmake')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
install='gschemas.install'
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --tags | cut -c2- | sed 's+-+.+g' 
}

prepare() {
  cd "${srcdir}/${_gitname}"
  sed -i "s|webkit2gtk-3.0|webkit2gtk-4.0|g" CMakeLists.txt
}

build() {
  cd "${srcdir}/${_gitname}"
  # See https://github.com/voldyman/MarkMyWords#how-to-build
  [[ -d build ]] || mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "${srcdir}/${_gitname}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
