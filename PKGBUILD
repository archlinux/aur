# Maintainer: Christopher Reimer <mail+aur[at]c-reimer[dot]de>
# Co-Maintainer: NicoHood <aur {at} nicohood {dot} de>

pkgname=hyperion
pkgver=1.03.2
pkgrel=4
pkgdesc="An opensource 'AmbiLight' implementation"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/hyperion-project/hyperion.ng"
license=('MIT')
depends=('libusb' 'protobuf' 'python' 'qt5-base')
optdepends=('xorg-server: X11 grabbing')
makedepends=('cmake')
backup=('etc/hyperion/hyperion.config.json')
source=("https://github.com/tvdzwan/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('7406f5bdf323d2799fb375557603fefd1f077cda287b5aa9ff10251b22d8dd07590458515b0e01ef97fba80885aab1aa72bd8b5d26873ad8ebcc1ba53d6776ec')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_QT5=ON \
        -DPLATFORM=x86 \
        -DPROTOBUF_PROTOC_EXECUTABLE=/usr/bin/protoc \
        -DUSE_SYSTEM_PROTO_LIBS=ON \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  pushd build
  make install
  popd

  install -Dm 644 config/hyperion.config.json.example \
    "${pkgdir}/etc/hyperion/hyperion.config.json"

  install -Dm 644 bin/service/hyperion.systemd.sh \
    "${pkgdir}/usr/lib/systemd/system/hyperiond.service"

  rm -rf "${pkgdir}/usr/share/hyperion/service"

  install -Dm 644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
