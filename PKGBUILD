pkgname=ftpocket
pkgver=1.2.1
pkgrel=1
pkgdesc='A secure FTP, FTPS, and SFTP desktop client'
arch=('x86_64')
url='https://github.com/Navid079/ftpocket'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'libsecret')
makedepends=('git' 'nodejs' 'npm' 'python' 'make' 'gcc' 'pkgconf')
source=("git+https://github.com/Navid079/ftpocket.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('!strip')

prepare() {
  cd "$srcdir/$pkgname"
  npm ci --no-audit --no-fund
}

build() {
  cd "$srcdir/$pkgname"
  npm run build
  ./node_modules/.bin/electron-builder --linux dir --x64
}

package() {
  cd "$srcdir/$pkgname"
  install -dm755 "$pkgdir/opt/FTPocket"
  cp -a dist/linux-unpacked/. "$pkgdir/opt/FTPocket/"
  install -dm755 "$pkgdir/usr/bin"
  ln -s '/opt/FTPocket/ftpocket' "$pkgdir/usr/bin/ftpocket"
  install -Dm644 scripts/arch/ftpocket.desktop "$pkgdir/usr/share/applications/ftpocket.desktop"
  install -Dm644 build/icon.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/ftpocket.png"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
