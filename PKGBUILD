# Maintainer: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: Eric Waller <ewwaller@gmail.com>

pkgname=basic256
pkgver=2.2.0
pkgrel=1
pkgdesc="Educational BASIC programming environment"
arch=('x86_64')
url="https://basic256.org/"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-multimedia' 'qt6-serialport' 'qt6-speech')
makedepends=('cmake' 'bison' 'flex' 'qt6-tools' 'qt6-declarative')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/uglymike17/basic256/archive/refs/tags/v${pkgver}.tar.gz"
        "basic256.desktop")
sha256sums=('511b3dafa95423366915dc40c674f4dd1be0d0da0f03e818e872fba6062727f2'
            '601fe0147cc4b394e2c01afa20e371f7dffc9e7787ce9360ae0332545f6e62ec')

build() {
	cmake -B build -S "${pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build

	# Upstream's own interpreter resolves "include"'d Modules/ relative to
	# the running executable's own directory (QCoreApplication::
	# applicationDirPath()), not a fixed system data dir -- so this has to
	# sit next to the installed binary itself, not under /usr/share.
	install -m 755 -d "${pkgdir}/usr/bin/Modules"
	install -m 644 "${pkgname}-${pkgver}"/Modules/*.kbs "${pkgdir}/usr/bin/Modules/"

	install -m 755 -D "${pkgname}-${pkgver}/resources/icons/basic256.png" "${pkgdir}/usr/share/icons/basic256.png"
	install -m 755 -D "${srcdir}/basic256.desktop" "${pkgdir}/usr/share/applications/basic256.desktop"
	mkdir -p "${pkgdir}/usr/share/basic256/examples"
	cp -pr "${pkgname}-${pkgver}"/Examples/* "${pkgdir}/usr/share/basic256/examples"
}
