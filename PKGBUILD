# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>
# Original contributor: Félix Saparelli <aur@passcod.name>

pkgname=talon-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Powerful hands-free voice and gaze input scriptable with Python'
url='https://talonvoice.com/'
arch=('x86_64')
license=('custom')
depends=('python')
options=('!strip')

source=(
  "talon.tar.xz::https://talonvoice.com/dl/latest/talon-linux.tar.xz"
  "start.sh"
  "talon.desktop"
  "talon.png"
)

b2sums=(
  "SKIP"
  "ee947e7bcb7e2a457d84a5ae60e3ce3faf72f2fab18aa8f24a501756f77aa7b8990f26950326020bc56146fe4689302c8716a1f72f164ea76bc38338b45a517d"
  "86a2e315b72e43e1083cd9163adb634987526fe80972ff3697afa71d538968bce54b7e2115fee9814768aba4c2dfb7d8c23ed45f75c70f44cfee9a30e00bf99e"
  "a5938dcf06c69adef6fb6461ff683fdaa82c806771f080da4539279e242bd3df30ab032283f3a3c062cf2fb66a29616cbda7d25bfec90bcb9af567a67477517d"
)

install=talon.install

package() {
  # --- custom start script to reflect our locations ---
  install -Dm755 start.sh "$pkgdir/usr/bin/talon"
  install -Dm644 talon.png "$pkgdir/usr/share/icons/talon.png"
  install -Dm644 talon.desktop "$pkgdir/usr/share/applications/talon.desktop"

  # --- talon itself ---
  cd "$srcdir/talon" || exit 1
  install -Dm644 10-talon.rules "$pkgdir/usr/lib/udev/rules.d/10-talon.rules"
  install -Dm755 talon "$pkgdir/usr/share/talon/talon-bin"

  mkdir -p "$pkgdir/usr/lib"
  cp -r lib "$pkgdir/usr/lib/talon"

  mkdir -p "$pkgdir/usr/share"
  cp -r resources "$pkgdir/usr/share/talon"

  install -Dm644 resources/EULA.txt "$pkgdir/usr/share/licenses/$pkgname/EULA.txt"
  install -Dm644 resources/LICENSES.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSES.txt"
}
