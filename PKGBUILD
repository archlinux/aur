# Maintainer: Martin Kröning <mkroening@hotmail.de>
pkgname=moodledesktop
_pkgname=moodleapp
_electron=electron8
pkgver=3.9.4
pkgrel=1
pkgdesc='The official app for Moodle.'
arch=(any)
url=https://download.moodle.org/desktop/
license=(Apache)
depends=($_electron)
makedepends=(git jq moreutils nodejs npm python2)
_pathstem=$_pkgname-$pkgver
source=($_pathstem.tar.gz::https://github.com/moodlehq/$_pkgname/archive/v$pkgver.tar.gz
        $pkgname.sh
        $pkgname.desktop)
sha256sums=('cfcb9afbed083d5b78889b0648c1979b175e044570354075655deec9e38c4fbc'
            '52624f85d65e8a3339258b343edce0b2ad7fd4071b8742b1fe1a2ea50ec8ee18'
            'ca4bcbbfb0b6f40e4fa8eaed0b02e5c1d1ba609a43f8aaed8cefd16c8af4ba86')

prepare() {
  cd $_pathstem

  local dist=/usr/lib/$_electron
  local version="$(cat $dist/version)"
  jq '.name = $name | .build.electronDist = $dist | .build.electronVersion = $version' \
      --arg name $pkgname \
      --arg dist $dist \
      --arg version $version \
      package.json | sponge package.json
}

build() {
  cd $_pathstem
  export npm_config_cache="$srcdir"/npm-cache

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
