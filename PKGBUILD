# Maintainer: Emili <emili.m@live.com>

pkgname=ms4x-flasher-bin
pkgver=1.5.1
pkgrel=1
pkgdesc='Crossplatform ECU/TCU flash tool for E-series platforms'
arch=('x86_64' 'aarch64')
url='https://github.com/ms4x-net/ms4x_flasher'
license=('LicenseRef-proprietary')
depends=('glibc' 'gcc-libs')
provides=('ms4x-flasher')
conflicts=('ms4x-flasher')
options=('!strip')

source_x86_64=("https://github.com/ms4x-net/ms4x_flasher/releases/download/v${pkgver}/ms4x-flasher_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/ms4x-net/ms4x_flasher/releases/download/v${pkgver}/ms4x-flasher_${pkgver}_arm64.deb")
sha256sums_x86_64=('4936ecc70ebc15001c7516e399faec3325a06c17062828ea909f208d8a38f85f')
sha256sums_aarch64=('1db589e54b9a1254554a177496ad7c2488b891fa844c8bfcb82898ceed00779a')

prepare() {
  cd "$srcdir"

  local deb_pkg
  case "$CARCH" in
    x86_64)
      deb_pkg="ms4x-flasher_${pkgver}_amd64.deb"
      ;;
    aarch64)
      deb_pkg="ms4x-flasher_${pkgver}_arm64.deb"
      ;;
  esac

  rm -rf unpacked
  mkdir -p unpacked

  bsdtar -xf "$deb_pkg" -C unpacked
  bsdtar -xf unpacked/data.tar.gz -C unpacked

  sed -i 's|^Exec=.*|Exec=/usr/bin/ms4x-flasher|' unpacked/usr/share/application/ms4x-flasher.desktop
  sed -i 's|^Icon=.*|Icon=ms4x-flasher|' unpacked/usr/share/application/ms4x-flasher.desktop
  sed -i 's|^Categories=.*|Categories=Utility;|' unpacked/usr/share/application/ms4x-flasher.desktop
}

package() {
  cd "$srcdir/unpacked"

  install -dm755 "$pkgdir/usr/lib/ms4x-flasher"
  cp -a opt/ms4x-flasher/. "$pkgdir/usr/lib/ms4x-flasher/"

  install -dm755 "$pkgdir/usr/share/applications"
  install -Dm644 usr/share/application/ms4x-flasher.desktop "$pkgdir/usr/share/applications/ms4x-flasher.desktop"

  install -dm755 "$pkgdir/usr/share/pixmaps"
  install -Dm644 opt/ms4x-flasher/ms4x-icon-144.png "$pkgdir/usr/share/pixmaps/ms4x-flasher.png"

  install -dm755 "$pkgdir/usr/bin"
  ln -s /usr/lib/ms4x-flasher/ms4x-flasher "$pkgdir/usr/bin/ms4x-flasher"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 opt/ms4x-flasher/Disclaimer.rtf "$pkgdir/usr/share/licenses/$pkgname/Disclaimer.rtf"
}