# Maintainer: Jason Go <jasongo@jasongo.net>
# Contributor: Johan Vandegriff <johan at vandymail dot com>

pkgname=alice2-bin
pkgver=2.6.1
pkgrel=3
pkgdesc="Block-based 3D programming environment that makes it easy to create animations, build interactive narratives, or program simple games"
arch=('x86_64')
url='https://www.alice.org/get-alice/alice-2/'
license=(
  'LicenseRef-Alice2-EULA'
  'LicenseRef-GarfieldArtAssets-EULA'
)
depends=('jre17-openjdk' 'glu')
makedepends=('gendesk' 'gif2png')
optdepends=('alice-bin: Latest Alice release (currrently Alice 3)')
provides=('alice2')
options=(!debug !strip)
source=("$pkgname-$pkgver.tar.gz::https://github.com/TheAliceProject/alice2/releases/download/$pkgver/Alice_${pkgver//./_}.tar.gz")
sha256sums=('dcbb3a49067d54d991dac6951b9c83bf0c03ae7375e629611819f558cb7fb464')
noextract=("$pkgname-$pkgver.tar.gz")

package() {
  # To minimize storage use, extract directly to $pkgdir instead of auto-extract
  bsdtar -xf "$pkgname-$pkgver.tar.gz" -C "$pkgdir"

  # Get the icon and text version of the license from the jar file
  bsdtar -xf "$pkgdir/opt/alice2/Required/alice2-$pkgver-SNAPSHOT.jar" -C "$srcdir"

  # Create desktop icon by converting aliceHead.gif to alice2-bin.png
  gif2png "$srcdir/edu/cmu/cs/stage3/alice/authoringtool/images/aliceHead.gif"

  # Construct a desktop file consistent with how upstream Debian package does the postinst
  # the --name includes the whole $pkgver
  # the --custom value is derived from upstream Debian package postinst
  local partial_desktop="$pkgdir/opt/alice2/Required/install/alice2.desktop.partial"
  gendesk -f -n \
    --genericname "$(sed -n 's/^GenericName=//p' "$partial_desktop")" \
    --comment "$(sed -n 's/^Comment=//p' "$partial_desktop")" \
    --categories "$(sed -n 's/^Categories=//p' "$partial_desktop")" \
    --name "Alice $pkgver" \
    --exec '"/opt/alice2/alice" %U' \
    --icon 'alice2-bin' \
    --custom 'StartupWMClass=install4j-edu-cmu-cs-stage3-alice-authoringtool-JAlice'  

  install -Dm644 "$srcdir/alice2.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/edu/cmu/cs/stage3/alice/authoringtool/images/aliceHead.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/edu/cmu/cs/stage3/alice/authoringtool/dialog/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$pkgdir/opt/alice2/Required/"{Alice2_LICENSE.pdf,jythonLicense.txt,lgpl.txt}
}
