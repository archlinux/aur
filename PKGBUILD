# This PKGBUILD was adapted from jyantis's
pkgname=mairix-largembox
pkgver=0.23.r9.gbb9cfd5
pkgrel=1
pkgdesc='A program for indexing and searching emails, with a patch that allows parsing of large mbox files'
arch=('i686' 'x86_64')
url='https://github.com/adiel-mittmann/mairix'
license=('GPL')
depends=('bzip2' 'zlib')
source=('git+https://github.com/adiel-mittmann/mairix.git')
sha256sums=('SKIP')
makedepends=('git' 'flex' 'bison')
provides=('mairix')
conflicts=('mairix')
install=mairix-largembox.install

pkgver() {
  cd mairix
  set -o pipefail
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd mairix
  ./configure --prefix=/usr
  make
}

package() {
  cd mairix

  # We don't need anything related to git in the package
  rm -rf .git*

  # Install License
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README"

  make DESTDIR="${pkgdir}" install
  mkdir -p $pkgdir/usr/share/
  mv $pkgdir/usr/man $pkgdir/usr/share/
  install -D -m 644 dotmairixrc.eg $pkgdir/etc/mairixrc.sample

}

# vim:set ts=2 sw=2 et:
