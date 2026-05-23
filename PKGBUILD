# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Maintainer: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrol
_app_id="org.$pkgname.CoolerControl"
pkgver=4.3.1
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
	'bubblewrap'
)
checkdepends=(
	'appstream-glib'
	'desktop-file-utils'
)
source=(
	"https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/coolercontrol-$pkgver.tar.gz"
)
sha256sums=(
  '00ab5fd9a7a24bd003c2d1d34f78bf50487f46499c68a07d7f8d32e199643082'
)

build() {
	cd "${srcdir}/$pkgname-$pkgver/coolercontrol"
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="/${pkgdir}/usr"
	make -C build
}

check() {
	cd "${srcdir}/$pkgname-$pkgver"
	desktop-file-validate "packaging/metadata/$_app_id.desktop"
	appstream-util validate-relax --nonet "packaging/metadata/$_app_id.metainfo.xml"
}

package() {
	cd "${srcdir}/$pkgname-$pkgver/coolercontrol"
	make install

	cd "${srcdir}/$pkgname-$pkgver"
	# desktop metadata
	install -Dm644 "packaging/metadata/$_app_id.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "packaging/metadata/$_app_id.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 "packaging/metadata/$_app_id-alert.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 "packaging/metadata/${_app_id}-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
	install -Dm644 "packaging/metadata/${_app_id}-symbolic-alert.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
	install -Dm644 "packaging/metadata/$_app_id.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 "packaging/metadata/$_app_id-alert.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 "packaging/metadata/$_app_id.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"

	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
