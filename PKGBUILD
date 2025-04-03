# Maintainer: Blake

: ${_electron_dist:=/usr/lib/electron}

_pkgname="horizon-electron"
pkgname="fchat-horizon"
pkgver=1.30.1
pkgrel=1
pkgdesc="A continuation of the heavily modified F-Chat Rising client. Uses system electron."
url="https://github.com/Fchat-Horizon/Horizon"
license=('MIT')
arch=('any')

depends=(
  'electron'
  'libnotify'
  'libsecret'
  'libappindicator-gtk3'
)
makedepends=(
  'git'
  'nodejs'
  'pnpm'
  'npm'
)
provides=(
  'fchat=3'
)
source=(
  "https://github.com/Fchat-Horizon/Horizon/releases/download/v$pkgver/F-Chat.Horizon-linux-x64.tar.gz"
  "$pkgname.sh"
  'fchat.desktop'
  'https://raw.githubusercontent.com/Fchat-Horizon/Horizon/refs/heads/main/electron/build/icon.png'
  'https://raw.githubusercontent.com/Fchat-Horizon/Horizon/refs/heads/main/LICENSE'
)
sha256sums=('22458a2a33ad6252ad8ccd300a626dc47c995c29763a9da366be99fcdddf455a'
            '6853b8e9d7ce674b063fe277c98fc9dcec4be4949731e6134a5f134d48892be5'
            '4b4b0cee797f2878e0541dbea64e5b97fbb3d0789619fe75ed1120aee3999220'
            'dec49091c629a2e5956e14b32a823f2a63cd1549f4b1d650d3ad32948d95e822'
            'b13bdf6682ae4d90990ebbd3b1472b91001b20c49c87d4366cc3cadb4dc084b4')

package() {
  cd "$srcdir"
  
  # Move misc resources to their correct place
  install -Dm755 "$pkgname".sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 fchat.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  # We're using system electron, so pull out just what we actually need.
  cd 'F-Chat Horizon-linux-x64/resources/'
  install -dm0755 "$pkgdir"/usr/share/$pkgname
  find . -type d -exec install -d {,"$pkgdir"/usr/share/$pkgname/}{} \;
  find . -type f -exec install -D {,"$pkgdir"/usr/share/$pkgname/}{} \;
}
