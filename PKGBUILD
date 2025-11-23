# Maintainer: duzda <duzda@disroot.com>

pkgname=deezer-enhanced-bin
_pkgname=deezer-enhanced
pkgver=1.4.1
pkgrel=1
pkgdesc='An unofficial application for Deezer with enhanced features'
arch=('x86_64')
url="https://github.com/duzda/deezer-enhanced"
license=('MIT')
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libvpx' 'libxslt' 'libxss' 'minizip' 'nss' 're2' 'snappy' 'libnotify' 'libappindicator-gtk3')
provides=('deezer-enhanced')
conflicts=('deezer-enhanced')
options=('!debug')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.pacman"
"https://raw.githubusercontent.com/duzda/deezer-enhanced/v$pkgver/LICENSE")
sha256sums=('f1e5450bf428e1443e31046113d969ffcd0efcc1a6eb8f81116053c4630e61ea'
            '5e50f4bdfee35d29a860b03b2cc0ee07ed3fbfebda1fbd42e872b93a256c4247')

package() {
  # Main program
  install -d "${pkgdir}/opt"
  cp -r opt "${pkgdir}"

  # Desktop icon + icons
  install -dm755 "${pkgdir}/usr/"
  cp -r usr "${pkgdir}"

  # License
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # Post install
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/deezer-enhanced/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  # Hopefully temp fix
  sed -i '2s/.*/Name=Deezer Enhanced/' "${pkgdir}/usr/share/applications/deezer-enhanced.desktop"
  sed -i '7s/.*/StartupWMClass=Deezer Enhanced/' "${pkgdir}/usr/share/applications/deezer-enhanced.desktop"
  sed -i '9s/.*/Categories=Audio;AudioVideo;/' "${pkgdir}/usr/share/applications/deezer-enhanced.desktop"

  # SUID chrome-sandbox for Electron 5+
  chmod 4755 "${pkgdir}/opt/deezer-enhanced/chrome-sandbox" || true
}