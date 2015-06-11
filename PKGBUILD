# Maintainer:  jyantis <yantis@yantis.net>
# Contributor: Levi0x0 (@levi0x0x aur)

pkgname=macchanger-git
pkgver=1.7.0.r46.f4f66e1
pkgrel=1
pkgdesc="GNU MAC Changer : A small utility to change your NIC's MAC address"
arch=('any')
url='https://github.com/alobbs/macchanger'
license=('GPL')
source=('git+https://github.com/alobbs/macchanger.git')
sha256sums=('SKIP')
depends=('glibc')
makedepends=('git')
provides=('macchanger')
conflicts=('macchanger')
install=macchanger.install

pkgver() {
  cd macchanger
  printf "%s." "$(grep "AC_INIT(" configure.ac | awk 'BEGIN {FS = " "} {print $2}')" | sed -r 's/(\[|\])//g' | sed -r 's/(\(|\))//g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd macchanger
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd macchanger

  # We don't need anything related to git in the package
  rm -rf .git*

  # Install License
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README"

  make DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
