# Maintainer: Tomasz Pakula <forest10pl@gmail.com>
_reponame=hid-logitech-hidpp
pkgname=hidpp-logitech-g-pro-wheel-dkms-git
pkgver=0.1
pkgrel=2
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
  axis-hack.patch
)
sha256sums=(
  'SKIP'
  'addbedca432c213cc58642dca94e55209098d44fb967d0f2fcd1ec83a433a624'
)

pkgver() {
  cd "$srcdir/$_reponame"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
  
prepare() {
  cd "$srcdir/$_reponame"
  git apply -3 ../axis-hack.patch
}

package() {
  cd "$srcdir/$_reponame"

  find . -type f \( -name 'dkms.conf' -o -name '*.c' \) -exec sed -i "s/#VERSION#/$pkgver/" {} +
  echo 'ccflags-y += -DDEBUG' >> "Kbuild"

  echo "* Copying module into /usr/src..."
  install -dm755 "${pkgdir}/usr/src/${_reponame}-${pkgver}"
  cp -r ${srcdir}/$_reponame/* "${pkgdir}/usr/src/${_reponame}-${pkgver}"
}
