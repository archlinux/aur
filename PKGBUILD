# Maintainer: Tomasz Pakula <forest10pl@gmail.com>
_reponame=hid-logitech-hidpp
_pkgname=hidpp-logitech-g-pro-wheel-dkms
pkgname=$_pkgname-git
provides=($_pkgname)
conflicts=($_pkgname)
pkgver=0.3
pkgrel=1
pkgdesc="hid-logitech-hidpp with G Pro Racing Wheel PC/XBOX support"
arch=('x86_64')
url="https://github.com/Lawstorant/hid-logitech-hidpp"
license=('GPL2')
depends=(dkms)
makedepends=(
  git
  gcc
  glibc
)
source=(
  git+https://github.com/Lawstorant/hid-logitech-hidpp
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_reponame"

  find . -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +
  echo 'ccflags-y += -DDEBUG' >> "Kbuild"

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/${_reponame}-${pkgver}"
  cp -r ${srcdir}/$_reponame/* "${pkgdir}/usr/src/${_reponame}-${pkgver}"
}
