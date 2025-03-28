# Maintainer: Tomasz Pakuła <forest10pl@gmail.com>
_reponame=universal-pidff
pkgname=$_reponame-dkms-git
provides=($_reponame-dkms)
pkgver=0.1.0
pkgrel=1
pkgdesc="Universal FFB Driver for Moza/Cammus/VRS and more"
arch=('x86_64')
url="https://github.com/JacKeTUs/$_reponame"
license=('GPL2')
depends=(dkms)
makedepends=(
  git
  gcc
  glibc
)
source=(
  git+https://github.com/JacKeTUs/$_reponame
  0001-Only-build-for-kernels-below-6.15.patch
)
sha256sums=(
  'SKIP'
  f6a450ae2aaca7839daae62b757ac122cd98427b9d4662d1ed7508aba0606f02
)

prepare() {
  cd "$srcdir/$_reponame" || exit
  git apply -3 "$srcdir/0001-Only-build-for-kernels-below-6.15.patch"
}

pkgver() {
  cd "$srcdir/$_reponame" || exit
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_reponame" || exit

  find . -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/universal-pidff-${pkgver}"
  cp -r ${srcdir}/$_reponame/* "${pkgdir}/usr/src/universal-pidff-${pkgver}"
}
