# Maintainer: Maxime Vincent (vnz0r) <maxime@veemax.be>

pkgname=bloom-git
pkgver=r677.2647415
pkgrel=1
pkgdesc="Bloom AVR debugger - A debug interface for embedded systems development on Linux."
arch=('i686' 'x86_64')
url="https://github.com/navnavnav/Bloom"
license=('LGPL')
depends=('libusb>=1.0' 'hidapi' 'qt6-base' 'libxcb' 'libpng' 'icu')
makedepends=('git' 'cmake' 'qt6-tools' 'php')
source=(${pkgname}::"git+https://github.com/navnavnav/Bloom.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	mkdir -p build
	mkdir -p build/cmake-build-release && cd build/cmake-build-release
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=/usr/bin/g++ -DCMAKE_INSTALL_PREFIX=/usr ../../
	cd "${srcdir}/${pkgname}"
    cmake --build ./build/cmake-build-release --target Bloom
}

package() {
	# Copy release files to /opt/bloom
    install -d "${pkgdir}/opt/bloom/"
    cp -r "${srcdir}/${pkgname}/release/bin/" "${pkgdir}/opt/bloom/"
    # use native Arch libraries
    rm -rf "${pkgdir}/opt/bloom/bin/lib"
    cp -r "${srcdir}/${pkgname}/release/resources/" "${pkgdir}/opt/bloom/"
    chmod u=rwx,g=rwx,o=rx -R "${pkgdir}/opt/bloom/"

	# Create symlink in /usr/bin
    install -d "${pkgdir}/usr/bin/"
    ln -s -r "${pkgdir}/opt/bloom/bin/bloom" "${pkgdir}/usr/bin/bloom"

	# Install udev rules
	install -d "${pkgdir}/etc/udev/rules.d"
	cp "${srcdir}/${pkgname}/resources/udevrules/99-bloom.rules" "${pkgdir}/etc/udev/rules.d/99-bloom.rules"
}
