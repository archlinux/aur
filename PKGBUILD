# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

basename=openhmd
pkgname=$basename-git
pkgver=0.3.0.397.2c2dccc
pkgrel=1
pkgdesc="Free and Open Source API and drivers for immersive technology."
arch=(x86_64 i686)
url="https://github.com/OpenHMD/OpenHMD"
license=(Boost)
depends=(hidapi)
conflicts=($basename)
provides=($basename)
makedepends=("meson")

optdepends=(
  'oculus-udev: Udev rule for Oculus Rift',
  'vive-udev: Udev rule for HTC Vive'
)

source=($basename::"git+https://github.com/OpenHMD/OpenHMD.git")
sha256sums=("SKIP")

ver() {
  PREFIX="	version : '"
  echo $(grep "$PREFIX" meson.build | sed -e "s/${PREFIX}//" | sed "s/',//")
}

pkgver() {
  cd $basename
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $(ver).$revision.$hash
}

build() {
  cd $basename
  rm -rf build
  meson build --prefix=/usr/ --libdir=lib
  ninja -C build
}

package() {
  cd $basename
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
