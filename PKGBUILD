# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Co-Maintainer: Aaron J. Graves <linux@ajgraves.com>
# Contributor: ganthern <https://github.com/ganthern>
pkgname=tutanota-desktop
pkgver=3.114.1
pkgrel=1
pkgdesc="Official Tutanota email client"
arch=('x86_64')
url="https://tutanota.com"
license=('GPL3')
depends=('alsa-lib' 'gtk3' 'libsecret' 'nss')
#makedepends=('node-gyp>=9.0.0' 'nodejs>=16.16.0' 'npm>=8.0.0')
makedepends=('git' 'nvm' 'python')
source=("https://github.com/tutao/tutanota/archive/$pkgname-release-$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('56513d45d2102bc7236a90613a099b26c67e915c7ecf65734469ff38742af4a1'
            '9a41e5474e1568b13093c91fd54538fe614003f5f5d4f895553f73207c28cb08')

_ensure_local_nvm() {
  # let's be sure we are starting clean
  which nvm >/dev/null 2>&1 && nvm deactivate && nvm unload
  export NVM_DIR="${srcdir}/.nvm"
  # The init script returns 3 if version specified
  # in ./.nvrc is not (yet) installed in $NVM_DIR
  # but nvm itself still gets loaded ok
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
}

prepare() {
  cd "${pkgname%-*}-$pkgname-release-$pkgver"
  _ensure_local_nvm
  nvm install
}

build() {
  cd "${pkgname%-*}-$pkgname-release-$pkgver"
  export npm_config_cache="$srcdir/npm_cache"
  _ensure_local_nvm
  npm ci
  npm run build-packages
  node desktop --custom-desktop-release --unpacked
}

package() {
  cd "${pkgname%-*}-$pkgname-release-$pkgver"
  install -d "$pkgdir/opt/$pkgname/"
  cp -av build/desktop/linux-unpacked/* \
    "$pkgdir/opt/$pkgname/"
  chmod 4755 "$pkgdir/opt/$pkgname/chrome-sandbox"

  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/$pkgname" "$pkgdir/usr/bin/"

  for icon_size in 16x16 32x32 128x128 256x256 512x512; do
    install -Dm644 resources/desktop-icons/logo-solo-red.png.iconset/icon_${icon_size}.png \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}/apps/$pkgname.png"
    install -Dm644 resources/desktop-icons/logo-solo-red.png.iconset/icon_${icon_size}@2x.png \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}@2x/apps/$pkgname.png"
  done

  install -Dm644 "$srcdir/$pkgname.desktop" -t \
    "$pkgdir/usr/share/applications/"
}
