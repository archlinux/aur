# Maintainer: Jason Go <jasongo@jasongo.net>

pkgname=alice3-bin
pkgver=3.9.0.3+build1338
pkgrel=1
pkgdesc="Block-based 3D programming environment that makes it easy to create animations, build interactive narratives, or program simple games"
arch=('x86_64')
url="https://www.alice.org"
license=(
  'LicenseRef-Alice3-EULA'
  'LicenseRef-LookingGlass-EULA'
  'LicenseRef-TheSimsTM2ArtAsset-EULA'
)
depends=('java-runtime>=17' 'java-runtime<=21')
makedepends=('gendesk')
provides=('alice3')
options=(!debug !strip)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/TheAliceProject/alice3/releases/download/${pkgver%+*}/alice3_unix_bundle_${pkgver//./_}.tar.gz"
  "https://raw.githubusercontent.com/TheAliceProject/alice3/refs/tags/${pkgver%+*}/installer/installerFiles/alice3.desktop.partial"
  "$pkgname.png::https://raw.githubusercontent.com/TheAliceProject/alice3/refs/tags/${pkgver%+*}/installer/installerFiles/desktopIcon256.png"
)
sha256sums=(
  '6dde04db4b737440a16dbf96d2ec3b5aaa655bd7f1a01d6d091597bcac1f3cd0'
  'c9b7506d6830f1c8508b6254537a767f9c7ffaa32491b5ddd6956a1210e76a13'
  'b17a0fe7489423933813e1f34e5effe2c095cadf65281cb74d9549399108e8d7')
noextract=("$pkgname-$pkgver.tar.gz")

prepare() {
  gendesk -f -n \
    --genericname "$(sed -n 's/^GenericName=//p' alice3.desktop.partial)" \
    --comment "$(sed -n 's/^Comment=//p' alice3.desktop.partial)" \
    --categories "$(sed -n 's/^Categories=//p' alice3.desktop.partial)" \
    --name 'Alice 3' \
    --exec '"/opt/alice3/Alice 3" %U' \
    --icon 'alice3-bin' \
    --custom 'StartupWMClass=install4j-org-alice-stageide-EntryPoint'  
}

package() {
  mkdir -p "$pkgdir/opt/"
  bsdtar -xf "$pkgname-$pkgver.tar.gz" -C "$pkgdir/opt"

  install -Dm644 "$srcdir/alice3.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/opt/alice3/application/"{EULA_Alice3.txt,EULA_LookingGlassWalkAndTouch.txt,EULA_TheSimsTM2ArtAsset.txt}
}