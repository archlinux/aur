# Maintainer: Martin Reboredo <yakoyoku@gmail.com>
# Contributor: Chris Werner Rau <aur@cwrau.io>

pkgname=heroic-games-launcher-electron
_pkgbase=HeroicGamesLauncher
pkgver=2.5.2
pkgrel=1
_electronversion=20
pkgdesc="HGL, a Native alternative Linux Launcher for Epic Games"
arch=('x86_64')
url="https://heroicgameslauncher.com/"
license=('GPL3')
depends=("electron$_electronversion" 'gawk' 'curl' 'zstd' 'legendary' 'heroic-gogdl')
makedepends=('nodejs' 'node-gyp' 'asar' 'jq' 'yarn')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
_launcher_ver=8
source=("https://github.com/Heroic-Games-Launcher/$_pkgbase/archive/refs/tags/v$pkgver.tar.gz"
        "https://github.com/foutrelis/chromium-launcher/archive/refs/tags/v$_launcher_ver/chromium-launcher-$_launcher_ver.tar.gz"
        electron-is-dev-env.patch
        chromium-launcher-electron-app.patch)
sha256sums=('8caae8d9db2c6d3fbcbccc1ddbcff41b74d69adaa87763590e0ed1c8d777efc8'
            '213e50f48b67feb4441078d50b0fd431df34323be15be97c55302d3fdac4483a'
            'ad612b0908bb4d69115dbdc64a1cbf16d8cc7a0c16757a031e3b64ec50435208'
            '9235485adc4acbfaf303605f4428a6995a7b0b3b5a95181b185afbcb9f1f6ae5')

prepare() {
  cd chromium-launcher-$_launcher_ver
  patch -Np1 < ../chromium-launcher-electron-app.patch

  cd ../"$_pkgbase-$pkgver"
  patch -Np1 < ../electron-is-dev-env.patch
  jq 'del(.scripts.prepare)' package.json > tmp.json
  mv {tmp,package}.json
}

build() {
  make \
    CHROMIUM_APP="Heroic Games Launcher" \
    CHROMIUM_ARGS="/usr/lib/${pkgname%-*}/resources/app.asar" \
    CHROMIUM_BINARY="/usr/lib/electron$_electronversion/electron" \
    CHROMIUM_NAME=heroic \
    -C chromium-launcher-$_launcher_ver

  cd "$_pkgbase-$pkgver"
  electronDist="/usr/lib/electron$_electronversion"
  electronVer="$(sed s/^v// $electronDist/version)"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  yarn install
  yarn dist:linux --dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd chromium-launcher-$_launcher_ver
  make PREFIX=/usr DESTDIR="$pkgdir" CHROMIUM_NAME=heroic install
  ln -s heroic "$pkgdir/usr/bin/heroic-run"

  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE.launcher"

  cd ../"$_pkgbase-$pkgver"

  _reversed_domain=com.heroicgameslauncher.hgl

  install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/${pkgname%-*}/resources/"
  cp -rup dist/linux-unpacked/resources/app.asar.unpacked "$pkgdir/usr/lib/${pkgname%-*}/resources/"
  cp -rup build "$pkgdir/usr/lib/${pkgname%-*}/resources/app.asar.unpacked/"
  rm -rf "$pkgdir/usr/lib/${pkgname%-*}/resources/app.asar.unpacked/build/bin/"{linux/{gogdl,legendary},darwin,win32}
  ln -s /usr/bin/{gogdl,legendary} \
    "$pkgdir/usr/lib/${pkgname%-*}/resources/app.asar.unpacked/build/bin/linux/"
  ln -s build \
    "$pkgdir/usr/lib/${pkgname%-*}/resources/app.asar.unpacked/public"

  install -Dm644 "flatpak/$_reversed_domain.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "flatpak/$_reversed_domain.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"

  install -Dm644 build/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_reversed_domain.png"
  install -Dm644 "flatpak/$_reversed_domain.png" -t "$pkgdir/usr/share/icons/hicolor/128x128/apps/"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
