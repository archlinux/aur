# Maintainer: Avery Warddhana <them+arch _ nullablevo id au>
# Contributor: James An <james@jamesan.ca>
# Contributor: Nikita Mikhailov <nslqqq@gmail.com>

_pkgname=xrandr
pkgname=xorg-xrandr-git
pkgver=1.5.1.r8.g213e10f
pkgrel=2
pkgdesc='Primitive command line interface to RandR extension. Git version.'
arch=(i686 x86_64)
url='http://www.x.org/wiki/Projects/XRandR'
license=('custom')
groups=('xorg-apps' 'xorg')
depends=('libxrandr>=1.5.0' 'libx11')
makedepends=('xorg-util-macros' 'git')
provides=("xorg-$_pkgname=$pkgver")
conflicts=("xorg-$_pkgname")
source=("$_pkgname"::"git+http://anongit.freedesktop.org/git/xorg/app/xrandr.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/^xrandr.//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
  rm -f "${pkgdir}/usr/bin/xkeystone"
}
