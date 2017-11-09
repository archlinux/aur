# Maintainer: sum01 <sum01@protonmail.com>
pkgname=rocketchat-desktop
pkgver=2.10.0
_srcname="Rocket.Chat.Electron-$pkgver"
pkgrel=1
pkgdesc='Rocket.Chat Native Cross-Platform Desktop Application via Electron.'
arch=('i686' 'x86_64')
url="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
depends=('libxss' 'gconf' 'nss' 'alsa-lib' 'gtk2' 'libxtst')
makedepends=('sed' 'yarn' 'gulp' 'python2')
conflicts=('rocketchat-client-bin')
source=("https://github.com/RocketChat/Rocket.Chat.Electron/archive/$pkgver.tar.gz")
sha512sums=('c1de6fa75ccf9147b0fe369f0299548101d328ca8fd524f733c1dad8d819b73efdba88cd63c60a220d02605f8a35f6c8a5ea5227eeca966655aa7d911181ee85')
prepare(){
  sed -i 's/"deb",/"dir"/' "$srcdir/$_srcname/package.json"
  sed -i '/"rpm"/d' "$srcdir/$_srcname/package.json"
  sed -i 's|${SNAP}/meta/gui/icon.png|rocketchat-desktop|' "$srcdir/$_srcname/snap/gui/$pkgname.desktop"
}
build(){
    cd "$srcdir/$_srcname"
    yarn install --non-interactive --cache-folder "$srcdir/yarn-cache"
    yarn release
}
check() {
  cd "$srcdir/$_srcname"
  yarn check --integrity
  yarn test
}
package() {
  install -Dm644 "$srcdir/$_srcname/snap/gui/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 "$srcdir/$_srcname/snap/gui/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname/$pkgname.desktop"
  install -Dm644 "$srcdir/$_srcname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  if [[ "$CARCH" == "i686" ]]; then
    _distname="linux-ia32-unpacked"
  else
    _distname="linux-unpacked"
  fi
  mkdir -p "$pkgdir"/usr/{lib,bin}
  mv "$srcdir/$_srcname/dist/$_distname" "$pkgdir/usr/lib/$pkgname"
  ln -s /usr/lib/$pkgname/rocketchat "$pkgdir/usr/bin/$pkgname"
}
