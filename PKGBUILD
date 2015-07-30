# Maintainer: Sandy Carter (bwrsandman) <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/ogrebullet-git

pkgname=ogrebullet-git
pkgver=r40.448f97c
pkgrel=1
pkgdesc="Bullet Physics wrapper for OGRE"
arch=('i686' 'x86_64')
url="http://www.ogre3d.org/tikiwiki/OgreBullet"
license=('lgpl')
depends=(ogre bullet boost)
makedepends=(git cmake)
source=(git+https://bitbucket.org/alexeyknyshev/ogrebullet.git
        bullet281.patch)
sha1sums=('SKIP'
          '8a52583e0ef2a2012ed9394ee4de168144658c36')
conflicts=('ogrebullet-svn')
provides=('ogrebullet')


pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  patch -p0 -i "${srcdir}/bullet281.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR=${pkgdir} install 
}

# vim:set ts=2 sw=2 et:
