# Maintainer: Tomasz Pakula <forest10pl@gmail.com>
_reponame=moza-ff
pkgname=moza-ff-dkms-git
pkgver=0.1
pkgrel=1
pkgdesc="Moza Racing FFB driver"
arch=('x86_64')
url="https://github.com/JacKeTUs/moza-ff"
license=('GPL2')
depends=(dkms)
makedepends=(
  git
  gcc
  glibc
)
source=(
  git+https://github.com/JacKeTUs/moza-ff
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
