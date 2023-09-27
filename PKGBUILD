# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=fvtt-player-client-omegarogue
pkgver=1.4.1
pkgrel=1
pkgdesc='Foundry VTT Desktop Client'
arch=('x86_64')
url='https://github.com/OmegaRogue/fvtt-player-client'
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('git' 'yarn' 'npm')
provides=('fvtt-player-client')
conflicts=('fvtt-player-client')
source=("$pkgname-$pkgver.tar.gz::https://github.com/OmegaRogue/${pkgname%-omegarogue}/archive/${pkgver}.tar.gz"
        fvtt-desktop-client.desktop
		fvtt-desktop-client)
sha256sums=('efc96021b9d18cbea72a01eedb723b85e6fc344a920b251174c586a3fcd869a6'
            'f23835dbdc669c2915ba44c650973a00c9606912c421fc36ff72092658df8b4a'
            'db5c0491dad5e13a153b488a7a08229d8002a82b5471d26a0c98da285ed6fd9b')
prepare() {
  cd "${pkgname%-omegarogue}-$pkgver"
  yarn install
}

build() {
  cd "${pkgname%-omegarogue}-$pkgver"
  yarn version --no-git-tag-version --new-version $pkgver
  yarn run electron-forge make --platform linux --dir $test --targets '@electron-forge/maker-zip'
}
package() {
  install -Dm644 -t "$pkgdir/usr/share/applications" fvtt-desktop-client.desktop
  install -Dm755 -t "$pkgdir/usr/bin" fvtt-desktop-client
  cd "${pkgname%-omegarogue}-$pkgver"
  install -dm755 "$pkgdir/usr/lib/fvtt-desktop-client"

  cp -rt "$pkgdir/usr/lib/fvtt-desktop-client" out/vtt-desktop-client-linux-x64/*
}
