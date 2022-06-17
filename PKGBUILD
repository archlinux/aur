# Maintainer: Martin Reboredo <yakoyoku@gmail.com>
# Contributor: Chris Werner Rau <aur@cwrau.io>

pkgname=heroic-games-launcher-electron
_pkgbase=HeroicGamesLauncher
pkgver=2.3.9
pkgrel=1
_electronversion=18
pkgdesc="HGL, a Native alternative Linux Launcher for Epic Games"
arch=('x86_64')
url="https://heroicgameslauncher.com/"
license=('GPL3')
depends=("electron$_electronversion" 'gawk' 'curl' 'zstd' 'legendary' 'heroic-gogdl')
makedepends=('nodejs' 'asar' 'jq' 'yarn')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("https://github.com/Heroic-Games-Launcher/$_pkgbase/archive/refs/tags/v$pkgver.tar.gz"
        electron-is-dev-env.patch
        "${pkgname%-*}.sh.in")
sha256sums=('cf972a302749b81d26c66428c2b08a09e3bc53cc27deb05b45abc17dacf998e3'
            'd4fad8a579a8a955fe2176da0b2fa14cdc010d750c00651c1193a6fba914d4d8'
            '01840a1e45da355cea9205eb1724615d27ea0b9c8115b9ee811ff545cac5bbfc')

prepare() {
  cd "$_pkgbase-$pkgver"
  patch -Np1 < ../electron-is-dev-env.patch
  jq 'del(.scripts.prepare)' package.json > tmp.json
  mv {tmp,package}.json
}

build() {
  cd "$_pkgbase-$pkgver"
  electronDist="/usr/lib/electron" # $_electronversion"
  electronVer="$(sed s/^v// $electronDist/version)"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  yarn install
  yarn dist --dir -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "$_pkgbase-$pkgver"

  _reversed_domain=com.heroicgameslauncher.hgl

  install -Dm644 dist/linux-unpacked/resources/app.asar -t "$pkgdir/usr/lib/${pkgname%-*}/resources/"
  cp -r dist/linux-unpacked/resources/app.asar.unpacked "$pkgdir/usr/lib/${pkgname%-*}/resources/"
  rm "$pkgdir/usr/lib/${pkgname%-*}/resources/app.asar.unpacked/build/bin/linux/"{gogdl,legendary}
  ln -s /usr/bin/{gogdl,legendary} \
    "$pkgdir/usr/lib/${pkgname%-*}/resources/app.asar.unpacked/build/bin/linux/"

  sed "s/@@VERSION@@/$_electronversion/" "$srcdir/${pkgname%-*}.sh.in" > "${pkgname%-*}.sh"
  install -Dm755 "${pkgname%-*}.sh" "$pkgdir/usr/bin/heroic"
  ln -s heroic "$pkgdir/usr/bin/heroic-run"
  install -Dm644 "flatpak/$_reversed_domain.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "flatpak/$_reversed_domain.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"

  install -Dm644 build/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/$_reversed_domain.png"
  install -Dm644 "flatpak/$_reversed_domain.png" -t "$pkgdir/usr/share/icons/hicolor/128x128/apps/"

  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
}
