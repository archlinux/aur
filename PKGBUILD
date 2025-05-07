# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=boca-git
pkgver=1.0.7.r42.g93625f3
pkgrel=1
epoch=2
pkgdesc="A component library used by the fre:ac audio converter"
arch=('x86_64')
url="https://github.com/enzo1982/BoCA"
license=('GPL-2.0-or-later')
depends=(
  'alsa-lib'
  'expat'
  'libcdio-paranoia'
  'libpulse'
  'smooth-git'
  'uriparser'
)
makedepends=('git')
provides=("${pkgname%-git}" 'libboca-1.0.so=3' 'freac_cdk')
conflicts=("${pkgname%-git}" 'freac_cdk')
source=('git+https://github.com/enzo1982/BoCA.git')
sha256sums=('SKIP')

pkgver() {
  cd BoCA
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd BoCA
  find . -type f -exec sed -i 's|/usr/local|/usr|g' {} \;

  sed -i 's/FOLDERS += coreaudioconnect/#FOLDERS += coreaudioconnect/g' \
    components/encoder/Makefile
}

build() {
  cd BoCA
  make
}

package() {
  cd BoCA
  make DESTDIR="$pkgdir/" install
}
