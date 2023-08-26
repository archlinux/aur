# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=fvtt-player-client
pkgver=1.3.1
pkgrel=7
pkgdesc='Foundry VTT Desktop Client'
arch=('x86_64')
url='https://github.com/theripper93/fvtt-player-client'
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('git' 'yarn' 'npm' 'electron-builder')
provides=('fvtt-player-client')
source=("$pkgname-$pkgver.tar.gz::https://github.com/theripper93/${pkgname}/archive/${pkgver}.tar.gz"
        fvtt-desktop-client.desktop
		fvtt-desktop-client
		improve-button.patch)
sha256sums=('3f867ade10d9168e6fd8fa4ef557471132e1cb49ed4ab5e13fd3433a8484603e'
            'f23835dbdc669c2915ba44c650973a00c9606912c421fc36ff72092658df8b4a'
            'db5c0491dad5e13a153b488a7a08229d8002a82b5471d26a0c98da285ed6fd9b'
            '4357ab2161a20fa6db1241eea2b3b8ab2db1cf30256c2ec47a7af5385e362ed8')
prepare() {
  cd "$pkgname-$pkgver"
  patch --binary -p1 -i "$srcdir/improve-button.patch"
  yarn install
}

build() {
  cd "$pkgname-$pkgver"
  electron-builder --linux --x64 --dir $dist -c.electronDist=/usr/lib/electron -c.electronVersion=$(cat /usr/lib/electron/version)
}
package() {
  install -Dm644 -t "$pkgdir/usr/share/applications" fvtt-desktop-client.desktop
  install -Dm755 -t "$pkgdir/usr/bin" fvtt-desktop-client
  cd "$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/lib/fvtt-desktop-client"

  cp -rt "$pkgdir/usr/lib/fvtt-desktop-client" dist/linux-unpacked/*
}
