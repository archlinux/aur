# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Contributor: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrol-bin
_pkgname=${pkgname%-bin}
_app_id="org.$_pkgname.CoolerControl"
pkgver=2.1.0
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
  '0583e979e00a3cf032d48baff0e6dcf4127768f64a8952ac88de5326c56d4ce4'
  'f0850097914fb8892ee49c03c5cea55e78c8f3e6aa99b417fc86f44250b6bdbd'
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
