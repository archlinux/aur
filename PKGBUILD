# Maintainer: Tomasz Pakula <forest10pl@gmail.com>
_reponame=universal-pidff
pkgname=universal-pidff-dkms-git
pkgver=0.0.2
pkgrel=1
pkgdesc="Universal FFB Driver for Moza/Cammus/VRS and more"
arch=('x86_64')
url="https://github.com/JacKeTUs/universal-pidff"
license=('GPL2')
depends=(dkms)
makedepends=(
  git
  gcc
  glibc
)
source=(
  git+https://github.com/JacKeTUs/universal-pidff
  build-fix.patch
)
sha256sums=(
  'SKIP'
  'cac551efebfa443e2c332dac90f083c4d92445152341d2a7dddbff97bf2c68d3'
)

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_reponame"
  git apply -3 ../build-fix.patch
}

package() {
  cd "$srcdir/$_reponame"

  find . -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/universal-pidff-${pkgver}"
  cp -r ${srcdir}/$_reponame/* "${pkgdir}/usr/src/universal-pidff-${pkgver}"
}
