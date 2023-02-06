# Maintainer: Łukasz Michalski <lm@zork.pl>

pkgname=mqmgateway-git
_pkgname=mqmgateway
pkgver=1.0.0.r0.g589e6e1
pkgrel=1
pkgdesc="MQTT gateway for modbus networks"
license=('AGPL')
arch=('i686' 'x86_64')
url="https://github.com/BlackZork/mqmgateway"
depends=('boost-libs' 'libmodbus' 'mosquitto' 'yaml-cpp' 'rapidjson')
optdepends=('exprtk: custom expressions converter')
makedepends=('boost' 'cmake' 'git')
backup=(etc/modmqttd/config.yaml)

source=('git+https://github.com/BlackZork/mqmgateway.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p "$srcdir/$_pkgname/build"
  cd "$srcdir/$_pkgname/build"

  cmake "$srcdir/$_pkgname" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITHOUT_TESTS=ON 
  make
}

package() {
  cd "$srcdir/$_pkgname/build"

  make DESTDIR="$pkgdir" install

  install -Dm640 "$srcdir/$_pkgname/modmqttd/config.template.yaml" "$pkgdir/etc/modmqttd/config.yaml"
}
