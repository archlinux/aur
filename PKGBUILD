# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

_pkgname=sunshine
pkgname=${_pkgname}-git
pkgver=0.4.0.q.290415dec3..
pkgrel=1
pkgdesc="Open source implementation of NVIDIA's GameStream, as used by the NVIDIA Shield"
url="http://sunshine-stream.com"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('boost')
makedepends=('git' 'cmake')
provides=('sunshine')
conflicts=("sunshine")
source=(${pkgname}::git+https://github.com/loki-47-6F-64/sunshine
        sunshine)
sha512sums=('SKIP' 'SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2|sed 's|\-|.|g')" \
q    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  git submodule update --recursive --init
}

build() {
  cd ${pkgname}
  mkdir build || rm -rf build/*
  cd build
#  export SUNSHINE_EXECUTABLE_PATH=/usr/bin/
  cmake ..
  make
  sed 's/\@SUNSHINE_EXECUTABLE_PATH\@/\/usr\/bin\/sunshine \/etc\/sunshine.conf/g' ../sunshine.service.in > sunshine.service
}

package() {
  mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/lib/systemd/user/" "$pkgdir/etc/" "$pkgdir/usr/lib/sunshine/bin/"
  cp sunshine "$pkgdir/usr/bin/"

  cd ${pkgname}
  cp build/sunshine "$pkgdir/usr/lib/sunshine/bin/"
  cp build/sunshine.service "$pkgdir/usr/lib/systemd/user/"
  cp assets/sunshine.conf "$pkgdir/etc/"

}

# vim: ts=2 sw=2 et:
