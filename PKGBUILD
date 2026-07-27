# Maintainer: tangeorange <orz@orgu.cc>
pkgname=cc-pocket-bin
pkgver=1.109.2
_build=201
pkgrel=1
pkgdesc="Mobile client for Claude Code and Codex — Linux desktop app"
arch=('x86_64')
url="https://github.com/K9i-0/ccpocket"
license=('MIT')
depends=('gtk3' 'libsecret')
makedepends=('patchelf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/K9i-0/ccpocket/releases/download/linux%2Fv$pkgver%2B$_build/CC-Pocket-linux-x64-v$pkgver.tar.gz"
        "com.k9i.ccpocket.desktop"
        "cc-pocket.png"
        "LICENSE::https://raw.githubusercontent.com/K9i-0/ccpocket/linux%2Fv$pkgver%2B$_build/LICENSE")
sha256sums=('2f686af2ff927938c286fe247a55b8ba5ae8e565de7843c7b3e5d20b071fe080'
            'SKIP'
            'SKIP'
            '738b2c95e9933f9c75149e12f3d4a258e6ec996ac64bf39b1adbf426055ff57c')

package() {
  install -d "$pkgdir/opt/cc-pocket"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/icons/hicolor/480x480/apps"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  cp -r "$srcdir/CC-Pocket-linux-x64/"* "$pkgdir/opt/cc-pocket/"

  # Fix RUNPATH for bundled .so files (set to $ORIGIN so plugins find libflutter_linux_gtk.so)
  for lib in "$pkgdir/opt/cc-pocket/lib/"*.so; do
    patchelf --set-rpath '$ORIGIN' "$lib"
  done

  ln -sf "/opt/cc-pocket/ccpocket" "$pkgdir/usr/bin/ccpocket"
  install -Dm644 "$srcdir/com.k9i.ccpocket.desktop" "$pkgdir/usr/share/applications/com.k9i.ccpocket.desktop"
  install -Dm644 "$srcdir/cc-pocket.png" "$pkgdir/usr/share/icons/hicolor/480x480/apps/cc-pocket.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
