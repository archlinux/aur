# Maintainer: Kwrazi < kwrazi at gmail dot com >

pkgname=emuflight-configurator
_realname=EmuConfigurator
pkgver=0.3.5
pkgrel=1
pkgdesc="Crossplatform configuration tool for the Emuflight flight control system"
arch=('x86_64')
url="https://github.com/emuflight/EmuConfigurator"
license=('GPL3')
depends=('nwjs-bin')
makedepends=('yarn' 'npm' 'git')
source=("git+https://github.com/emuflight/EmuConfigurator.git#tag=$pkgver"
        "$pkgname.sh"
        "$pkgname.desktop")
sha512sums=('SKIP'
            '9b97b71b7f755c55dcf8c3bcb931e9b4bb846cf1c07ddb71b817e478d3f82315ee024b3938cec85373f2e09c8d627fdaaf84bc154f93771d433c6588f2c7ae4c'
            'f2e696ae34403f2b44f4546e24948809dad1e17b563ab556e834473ee95ea934275da538825dd65afaa43882dac4d28aae8acdfbf0960f44bbad72da461eb30f')
options=(!strip)
install=$pkgname.install

prepare() {
  cd $_realname

  # Allow higher node version
  sed 's#"node": "#&>=#' -i package.json
}

build() {
  cd $_realname

  yarn install
  ./node_modules/.bin/gulp dist --linux64
}

package() {
  cd $_realname
  install -d "$pkgdir/usr/share/$pkgname/"
  cp -r dist/* "$pkgdir/usr/share/$pkgname/"
  install -Dm644 "assets/linux/icon/emu_icon_128.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -d "$pkgdir/usr/bin/"
  install -Dm 755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
}
