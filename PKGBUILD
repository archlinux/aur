# Maintainer: Adrian Kocis <adrian dot kocis at gmail>
_realname=gnome-terminal
pkgname=$_realname-urgent-hint
pkgver=3.37.0.6402.b4f17c11
_realver=3.7.3
pkgrel=1
pkgdesc="The GNOME Terminal Emulator. Git fork with urgent hint (w/o gnome-shell and nautilus)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('vte3-git')
makedepends=('git' 'gnome-doc-utils')
options=('!emptydirs')
url="https://github.com/adizero/gnome-terminal"
groups=('gnome')

provides=($_realname=$pkgver)
conflicts=($_realname)

source=("git+https://github.com/adizero/${_realname}.git")
md5sums=("SKIP")

subver() {
  PREFIX="m4_define(\[terminal_version_$1\],\["
  echo $(grep $PREFIX configure.ac | eval sed "'s/$PREFIX//'" | sed 's/\])//')
}
 
pkgver() {
  cd $_realname
  major=$(subver major)
  minor=$(subver minor)
  micro=$(subver micro)
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $major.$minor.$micro.$revision.$hash
}

build() {
  cd $_realname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib --localstatedir=/var \
      --disable-static \
      --disable-search-provider --without-nautilus-extension
  make
}

check() {
  cd $_realname
  make check
}

package() {
  cd $_realname
  make DESTDIR="$pkgdir" install
}
