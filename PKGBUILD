# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor:  David Parrish <daveparrish@tutanota.com>

pkgname=zap-desktop-git
pkgver=0.7.7.beta.r0.g086533a
pkgrel=1
pkgdesc="Lightning wallet focused on user experience and ease of use"
arch=('x86_64')
url="https://github.com/LN-Zap/zap-desktop"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'alsa-lib' 'gnome-keyring')
makedepends=('npm' 'yarn' 'git' 'python' 'glibc' 'gcc-libs')
source=("$pkgname::git+https://github.com/LN-Zap/zap-desktop.git"
        "zap-desktop.desktop")
sha256sums=('SKIP'
            '8c7a0940cced4e02b9d4dc1e2ca98f546117a079f37b91739ef70a321f86d5ee')
conflicts=("zap-desktop-bin" "zap-desktop-appimage")
provides=("zap-desktop")

pkgver() {
  cd "$pkgname" || exit
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname" || exit
  NODE_OPTIONS=--openssl-legacy-provider yarn
  NODE_OPTIONS=--openssl-legacy-provider npm run package
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/applications,/usr/share/pixmaps,/usr/share/licenses/$pkgname}

  # Install all .deb files into /opt.
  mkdir "$pkgdir/opt/$pkgname"
  cp -r "$srcdir/$pkgname/release/linux-unpacked/". "$pkgdir/opt/$pkgname"

  # Symlink executable
  ln -s "/opt/$pkgname/zap-desktop" "$pkgdir/usr/bin/zap-desktop"

  # Symlink licenses
  ln -s "/opt/$pkgname/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/opt/$pkgname/LICENSES.chromium.html" "$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Desktop icon
  install -D -m644 "$srcdir/zap-desktop.desktop" "${pkgdir}/usr/share/applications/zap-desktop.desktop"
  install -D -m644 "$srcdir/$pkgname/resources/icon.png" "${pkgdir}/usr/share/pixmaps/zap-desktop.png"
}
