# Maintainer: Gustavo H. Montesião de Sousa <gustavo aat claroenigma dot com dot br>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Earnestly
pkgname=antimony-git
pkgver=0.9.3b.r40.58f138c7
pkgrel=1
pkgdesc="Graph-based 3D CSG CAD modeller"
arch=(x86_64)
url="http://www.mattkeeter.com/projects/antimony/3/"
license=('MIT')
depends=('glibc' 'gcc-libs' 'libpng' 'qt5-base' 'python' 'boost-libs' 'hicolor-icon-theme')
makedepends=('git' 'ninja' 'lemon' 'flex' 'boost')
provides=(${pkgname})
source=("${pkgname}::git+https://github.com/mkeeter/antimony.git" "antimony.desktop")
md5sums=('SKIP' 'SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname}"
	cmake \
		-GNinja \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_POLICY_VERSION_MINIMUM=4.0
	ninja
}

package() {
	cd "$srcdir/${pkgname}"
	DESTDIR=${pkgdir} ninja install

	mkdir -p ${pkgdir}/usr/share/icons/hicolor/scalable
	cp deploy/icon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/antimony.svg

	mkdir -p ${pkgdir}/usr/share/applications
	cp ../antimony.desktop ${pkgdir}/usr/share/applications/antimony.desktop
}
