# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

pkgname=hyperion-git
pkgver=r1117.6445c35
pkgrel=1
pkgdesc="An opensource 'AmbiLight' implementation"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/hyperion-project/hyperion"
license=('MIT')
depends=('libusb' 'protobuf' 'python' 'qt5-base')
optdepends=('xorg-server: X11 grabbing')
makedepends=('git' 'cmake')
provides=('hyperion')
conflicts=('hyperion')
backup=('etc/hyperion/hyperion.config.json')
source=("${pkgname}::git+https://github.com/hyperion-project/hyperion")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
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
	cd "${srcdir}/${pkgname}/build"
	make install
	cd ..

    install -Dm 644 config/hyperion.config.json.example \
    "${pkgdir}/etc/hyperion/hyperion.config.json"

    install -Dm 644 bin/service/hyperion.systemd.sh \
    "${pkgdir}/usr/lib/systemd/system/hyperiond.service"

    rm -rf "${pkgdir}/usr/share/hyperion/service"

    install -Dm 644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
