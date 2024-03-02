# Maintainer: OmegaRogue <omegarogue@omegavoid.codes>
pkgname=fvtt-player-client
pkgver=1.5.4
pkgrel=1
pkgdesc='Foundry VTT Desktop Client'
arch=('x86_64')
url='https://github.com/theripper93/fvtt-player-client'
license=('MIT')
depends=('electron' 'nodejs')
makedepends=('git' 'yarn' 'npm')
provides=('fvtt-player-client')
source=("$pkgname-${pkgver//_/-}.tar.gz::https://github.com/theripper93/${pkgname}/archive/${pkgver}.tar.gz"
        fvtt-desktop-client.desktop
		fvtt-desktop-client
		)
sha256sums=('412698fa201314332827ee5c7acf0c70a23d73ce5a0a137bf0223c1ce1c38298'
            'f23835dbdc669c2915ba44c650973a00c9606912c421fc36ff72092658df8b4a'
            '91fdedeca016f05254f4b88b6cebb11f6d5961846df6579e9f28f8ea4dd67474')
prepare() {
  cd "${pkgname}-${pkgver//_/-}"
  yarn install
}

build() {
  cd "${pkgname}-${pkgver//_/-}"
  yarn version --no-git-tag-version --new-version ${pkgver//_/-}
  yarn run electron-forge make --platform linux --targets '@electron-forge/maker-zip'
}
package() {
  install -Dm644 -t "$pkgdir/usr/share/applications" fvtt-desktop-client.desktop
  install -Dm755 -t "$pkgdir/usr/bin" fvtt-desktop-client
  cd "${pkgname}-${pkgver//_/-}"
  install -dm755 "$pkgdir/usr/lib/fvtt-desktop-client"

  cp -rt "$pkgdir/usr/lib/fvtt-desktop-client" out/vtt-desktop-client-linux-x64/*
}
