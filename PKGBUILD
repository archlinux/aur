# Maintainer: Grigory Romodanovskiy <greg2008200@gmail.com>
pkgname=eddiscovery
pkgver=16.0.4
pkgrel=1
epoch=
pkgdesc="Captains log and 3d star map for Elite Dangerous"
arch=('any')
url="https://github.com/EDDiscovery/EDDiscovery"
license=('Apache')
groups=()
depends=('mono' 'hicolor-icon-theme')
makedepends=('git' 'msbuild' 'nuget' 'sed' 'icoutils')
checkdepends=()
optdepends=('ttf-ms-fonts')
provides=('eddiscovery')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}::git+${url}#tag=Release_$pkgver"
        "eddiscovery"
		"eddiscovery.desktop")
md5sums=('SKIP'
         '764d0276476fb60618d87c918baca9e3'
         'a81a935726d655d8369897dae396ea53')
noextract=()
validpgpkeys=()

prepare() {
  cd "${pkgname}-${pkgver}"
  git submodule init
  git submodule update
}

build() {
  cd "${pkgname}-${pkgver}"
  nuget restore
  sed -i 's/Debug/Release/g' monobuild
  ./monobuild
  mkdir -p icons
  icotool -x EDDiscovery/Resources/edlogo_3mo_icon.ico -o icons/
}

package() {
  install -Dm755 eddiscovery "$pkgdir/usr/bin/eddiscovery"

  install -Dm755 eddiscovery.desktop "$pkgdir/usr/share/applications/eddiscovery.desktop"

  mkdir -p "${pkgdir}/usr/lib/eddiscovery"
  mv ${srcdir}/${pkgname}-${pkgver}/EDDiscovery/bin/Release/* $pkgdir/usr/lib/eddiscovery
  install -dDm755 "$pkgdir/usr/lib/eddiscovery/" "$pkgdir/usr/lib/eddiscovery/"


  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/icons/edlogo_3mo_icon_1_16x16x32.png "$pkgdir"/usr/share/icons/hicolor/16x16/apps/eddiscovery.png
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/icons/edlogo_3mo_icon_2_24x24x32.png "$pkgdir"/usr/share/icons/hicolor/24x24/apps/eddiscovery.png
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/icons/edlogo_3mo_icon_3_32x32x32.png "$pkgdir"/usr/share/icons/hicolor/32x32/apps/eddiscovery.png
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/icons/edlogo_3mo_icon_4_48x48x32.png "$pkgdir"/usr/share/icons/hicolor/48x48/apps/eddiscovery.png
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/icons/edlogo_3mo_icon_5_64x64x32.png "$pkgdir"/usr/share/icons/hicolor/64x64/apps/eddiscovery.png
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/icons/edlogo_3mo_icon_6_96x96x32.png "$pkgdir"/usr/share/icons/hicolor/96x96/apps/eddiscovery.png
  install -Dm644 ${srcdir}/${pkgname}-${pkgver}/icons/edlogo_3mo_icon_7_128x128x32.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/eddiscovery.png

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
