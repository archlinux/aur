# Maintainer: Pierce Thompson <pierce at insprill dot net>
# Contributor: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrol-git
_app_id="org.${pkgname%-git}.CoolerControl"
pkgver=3.1.1.r217.g221dfd7
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices"
arch=('x86_64')
url="https://gitlab.com/coolercontrol/coolercontrol"
license=('GPL-3.0-or-later')
depends=(
	'qt6-webengine'
	'gcc-libs'
	'glibc'
	'hicolor-icon-theme'
	'coolercontrold'
)
makedepends=(
	'cmake'
)
checkdepends=(
	'appstream-glib'
	'desktop-file-utils'
)
provides=(
	"${pkgname%-git}"
)
conflicts=(
	"${pkgname%-git}"
)
source=(
	"git+https://gitlab.com/coolercontrol/coolercontrol.git"
)
sha256sums=(
  'SKIP'
)

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname%-git}/coolercontrol"
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/${pkgdir}/usr"
	make -C build
}

check() {
	cd "${srcdir}/${pkgname%-git}"
	desktop-file-validate "packaging/metadata/$_app_id.desktop"
	appstream-util validate-relax --nonet "packaging/metadata/$_app_id.metainfo.xml"
}

package() {
	cd "${srcdir}/${pkgname%-git}/coolercontrol"
	make install

	cd "${srcdir}/${pkgname%-git}"
	# desktop metadata
	install -Dm644 "packaging/metadata/$_app_id.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "packaging/metadata/$_app_id.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 "packaging/metadata/$_app_id-alert.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 "packaging/metadata/${_app_id}-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
	install -Dm644 "packaging/metadata/${_app_id}-symbolic-alert.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
	install -Dm644 "packaging/metadata/$_app_id.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 "packaging/metadata/$_app_id-alert.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 "packaging/metadata/$_app_id.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"

	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
}
