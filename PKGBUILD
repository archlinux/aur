# Maintainer: Cody P Schafer <archlinux at codyps.com>
# Maintainer: Juergen Werner <pogojotz at gmx dot net>
# Contributor: Martchus <martchus@gmx.net>

_bpn=paho-mqtt-c
pkgname=${_bpn}-git
pkgver=1.3.13.r11.g6b1e202
pkgrel=1
pkgdesc="Eclipse Paho C Client Library for the MQTT Protocol"
arch=(any)
url="https://www.eclipse.org/paho/clients/c/"
license=('custom:EPL2' 'custom:EDL')
groups=()
depends=('openssl')
makedepends=(git doxygen)
provides=(${_bpn})
conflicts=(${_bpn})
replaces=()
backup=()
options=(!emptydirs)
install=
source=("$_bpn::git+https://github.com/eclipse/paho.mqtt.c.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_bpn"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  rm -rf build
  mkdir -p build
}

build() {
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr \
    -DPAHO_WITH_SSL=TRUE -DPAHO_ENABLE_TESTING=FALSE \
    -S $_bpn -B build
  cmake --build build
}

package() {
  cmake --build build --target install -- DESTDIR="$pkgdir/"

  cd $_bpn
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 edl-v10 "${pkgdir}/usr/share/licenses/${pkgname}/edl-v10"
  install -Dm644 epl-v20 "${pkgdir}/usr/share/licenses/${pkgname}/epl-v20"
}
# vim:set ts=2 sw=2 et:
