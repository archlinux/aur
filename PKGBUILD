# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=fvtt-player-client-omegarogue
pkgver=1.5.3
pkgrel=1
pkgdesc='Foundry VTT Desktop Client'
arch=('x86_64')
url='https://github.com/OmegaRogue/fvtt-player-client'
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('git' 'yarn' 'npm')
provides=('fvtt-player-client')
conflicts=('fvtt-player-client')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/OmegaRogue/${pkgname%-omegarogue}/archive/${pkgver//_/-}.tar.gz"
        fvtt-desktop-client.desktop
		fvtt-desktop-client)
sha256sums=('93be54b0b65ab24f7a64d5d41c3b61e2a78cfc8907a97c0f01ff9156f2767690'
            'f23835dbdc669c2915ba44c650973a00c9606912c421fc36ff72092658df8b4a'
            'db5c0491dad5e13a153b488a7a08229d8002a82b5471d26a0c98da285ed6fd9b')
prepare() {
  cd "${pkgname%-omegarogue}-${pkgver//_/-}"
  yarn install
}

build() {
  cd "${pkgname%-omegarogue}-${pkgver//_/-}"
  yarn version --no-git-tag-version --new-version ${pkgver//_/-}
  yarn run electron-forge make --platform linux --targets '@electron-forge/maker-zip'
}
package() {
  install -Dm644 -t "$pkgdir/usr/share/applications" fvtt-desktop-client.desktop
  install -Dm755 -t "$pkgdir/usr/bin" fvtt-desktop-client
  cd "${pkgname%-omegarogue}-${pkgver//_/-}"
  install -dm755 "$pkgdir/usr/lib/fvtt-desktop-client"

  cp -rt "$pkgdir/usr/lib/fvtt-desktop-client" out/vtt-desktop-client-linux-x64/*
}
