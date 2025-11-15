# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrol-bin
_pkgname=${pkgname%-bin}
_app_id="org.$_pkgname.CoolerControl"
pkgver=3.0.2
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices (binary release)"
arch=('x86_64')
url="https://gitlab.com/coolercontrol/coolercontrol"
license=('GPL-3.0-or-later')
depends=(
	'gtk3'
	'hicolor-icon-theme'
	'coolercontrold-bin'
	'qt6-webengine'
	'liquidctl'
)
checkdepends=(
	'appstream-glib'
	'desktop-file-utils'
)
provides=("$_pkgname")
conflicts=(
	"$_pkgname" # source package
)
groups=(coolercontrol-bin)
source=(
	"https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/${_pkgname}_${pkgver}"
	"https://gitlab.com/coolercontrol/coolercontrol/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz"
)
sha256sums=(
  'a0e2862e64b268d580356c9b835435f78228d25b06cf5c80b3133c7c9d1a3877'
  'f27354ae0a1e97de81ac574e03df3106d30d55d93393e86ea99abbe3af4c4ab6'
)

check() {
	cd "${srcdir}/$_pkgname-$pkgver"
	desktop-file-validate "packaging/metadata/$_app_id.desktop"
	appstream-util validate-relax "packaging/metadata/$_app_id.metainfo.xml"
}

package() {
	install -DTm755 "${_pkgname}_${pkgver}" "$pkgdir/usr/bin/${_pkgname}"

	cd "${srcdir}/$_pkgname-$pkgver"

	# desktop metadata
	install -Dm644 "packaging/metadata/$_app_id.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "packaging/metadata/$_app_id.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"
	install -Dm644 "packaging/metadata/$_app_id.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 "packaging/metadata/$_app_id.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	install -Dm644 "packaging/metadata/${_app_id}-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"

	install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$_pkgname"
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
