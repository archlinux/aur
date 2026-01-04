# Maintainer: duzda <duzda@disroot.com>

pkgname=deezer-enhanced-bin
_pkgname=deezer-enhanced
pkgver=1.4.2
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
sha256sums=('18aae1de875d7033b553b1e392978a3c7b3f8d1e8c5c2dabd056b34c6d603e1e'
            '03fe903a47bd58602ff80b36f86b043936a8f7c12c2980edb7826dcdd951a95b')

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