# Maintainer: David Parrish <daveparrish@tutanota.com>

pkgname=zap-desktop-bin
pkgver=0.3.3_beta
# Actual version used by project
_ver=${pkgver//_/-}
pkgrel=1
pkgdesc="Lightning wallet focused on user experience and ease of use"
arch=('x86_64')
url="https://github.com/LN-Zap/zap-desktop"
license=('MIT')
depends=('gtk3' 'nss' 'libxss')
source_x86_64=("https://github.com/LN-Zap/zap-desktop/releases/download/v${_ver}/ZapDesktop-linux-amd64-v${_ver}.deb")
sha256sums_x86_64=('24ef2884dae91a04f741e3c05c4e2ebaf2589a80744b8ec5d7bc82195ef0710a')
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
  ln -s "/opt/$pkgname/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/opt/$pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname"

  # Symlink desktop icon
  cp "$srcdir/usr/share/applications/zap-desktop.desktop" "${pkgdir}/usr/share/applications/zap-desktop.desktop"
  cp "$srcdir/usr/share/icons/hicolor/0x0/apps/zap-desktop.png" "${pkgdir}/usr/share/pixmaps/zap-desktop.png"
}
