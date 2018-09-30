# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=zap-desktop-bin
pkgver=0.2.2_beta
# Actual version used by project
_ver=${pkgver//_/-}
pkgrel=2
pkgdesc="Lightning wallet focused on user experience and ease of use"
arch=('x86_64')
url="https://github.com/LN-Zap/zap-desktop"
license=('MIT')
depends=('gtk3' 'nss' 'gconf' 'libxss')
source_x86_64=("https://github.com/LN-Zap/zap-desktop/releases/download/v${_ver}/ZapDesktop-linux-amd64-v${_ver}.deb")
sha256sums_x86_64=('babf2b6d5db9075082b1a629159cdc63245ddb06c9b41d2749da23c6f7b8201c')
conflicts=("zap-desktop-git")
provides=("zap-desktop")

prepare() {
    tar -Jxvf data.tar.xz

    sed -in "s/\\/ZapDesktop\\//\\/${pkgname}\\//g" usr/share/applications/zap-desktop.desktop
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/applications,/usr/share/pixmaps,/usr/share/licenses/$pkgname}

  # /opt install
  mkdir "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/opt/ZapDesktop/". "$pkgdir/opt/$pkgname"

  # /usr install

  # Symlink executable
  ln -s "/opt/$pkgname/zap-desktop" "$pkgdir/usr/bin/zap-desktop"

  # Symlink licenses
  ln -s "/opt/$pkgname/LICENSES.electron.txt" "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/opt/$pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname"

  # Symlink desktop icon
  cp "$srcdir/usr/share/applications/zap-desktop.desktop" "${pkgdir}/usr/share/applications/zap-desktop.desktop"
  cp "$srcdir/usr/share/icons/hicolor/0x0/apps/zap-desktop.png" "${pkgdir}/usr/share/pixmaps/zap-desktop.png"
}
