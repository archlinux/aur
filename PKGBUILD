# Maintainer: Agampreet
# Contributor: Agampreet
pkgname=ms-office-electron-git
pkgver=0.7.0.r2.g0b95acf
pkgrel=1
pkgdesc="An Unofficial Microsoft Office Online Desktop Client. Free of Cost."
arch=('x86_64')
url="https://github.com/agam778/MS-Office-Electron"
license=('MIT')
depends=('libxcrypt-compat' 'at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'util-linux-libs' 'xdg-utils')
makedepends=('git' 'yarn' 'nodejs')
provides=("ms-office-electron" 'MS-Office-Electron')
conflicts=("ms-office-electron-bin")
source=("${pkgname%-git}::git+https://github.com/agam778/MS-Office-Electron.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    yarn config set cache-folder "$srcdir/yarn-cache"
    yarn install
    yarn dist -l deb --config.artifactName="MS-Office-Electron-Setup.deb"
}

package() {
    cd "$srcdir/${pkgname%-git}"
    bsdtar -xf "${srcdir}/${pkgname%-git}/release/MS-Office-Electron-Setup.deb" -C "${srcdir}" --include data.tar.xz
    bsdtar -xf ${srcdir}/data.tar.xz -C ${pkgdir}
    install -d ${pkgdir}/usr/bin/
    ln -s /opt/MS-Office-Electron/ms-office-electron ${pkgdir}/usr/bin/ms-office-electron
    for icon_size in 16 24 32 48 64 128 256 512 1024; do
        icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
        install -Dm644 assets/generated/icons/png/${icon_size}x${icon_size}.png \
        $pkgdir$icons_dir/${pkgname%-git}.png
    done
}
