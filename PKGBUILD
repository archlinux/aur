# Maintainer: Martin Kröning <mkroening@hotmail.de>
pkgname=moodledesktop
_pkgname=moodleapp
_electron=electron4
pkgver=3.9.1
pkgrel=2
pkgdesc='The official app for Moodle.'
arch=(any)
url=https://download.moodle.org/desktop/
license=(Apache)
depends=($_electron)
makedepends=(git jq moreutils nodejs-lts-erbium npm)
_pathstem=$_pkgname-$pkgver
source=($_pathstem.tar.gz::https://github.com/moodlehq/$_pkgname/archive/v$pkgver.tar.gz
        $pkgname.sh
        $pkgname.desktop)
sha256sums=('ce7c068e83e987dcf4204447a2408a7545e162cb92ed44cf6364640ab133153e'
            'ae04368f6573a0aec419bf1d013a60cfaf7375ed9db2a73e04d0a65904746fdd'
            'ca4bcbbfb0b6f40e4fa8eaed0b02e5c1d1ba609a43f8aaed8cefd16c8af4ba86')

prepare() {
  cd $_pathstem

  local dist=/usr/lib/$_electron
  local version="$(cat $dist/version)"
  jq '.name = $name | .build.electronDist = $dist | .build.electronVersion = $version | .engines.node = "12.x"' \
      --arg name $pkgname \
      --arg dist $dist \
      --arg version $version \
      package.json | sponge package.json
}

build() {
  cd $_pathstem
  export npm_config_cache="$srcdir"/npm-cache

  npm install node-sass
  npm install

  npx ionic build --prod
  npx electron-builder --dir
}

package() {
  install -Dm 644 $_pathstem/desktop/dist/linux-unpacked/resources/app.asar "$pkgdir"/usr/share/$pkgname/app.asar
  install -Dm 644 $_pathstem/src/assets/icon/icon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm 755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm 644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
