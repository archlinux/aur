pkgname=g-desktop-suite-git
pkgver=0.2.1.r54.g7f6d54a
pkgrel=1
pkgdesc="Google Suite as a desktop app. Made possible with Electron."
arch=('any')
url="https://github.com/alexkim205/G-Desktop-Suite"
license=('MIT')
depends=('libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'libappindicator-gtk3' 'libsecret')
makedepends=('git' 'yarn')
provides=("${pkgname%-git}" 'gdesktopsuite')
conflicts=("${pkgname%-git}" 'gdesktopsuite')
source=("${pkgname%-git}::git+https://github.com/alexkim205/G-Desktop-Suite.git")
sha256sums=('SKIP')
 
pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v.conscious.club\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}
 
build() {
    cd "$srcdir/${pkgname%-git}"
    export YARN_CACHE_FOLDER="$srcdir/yarn-cache"
    yarn install
    yarn electron-builder -l pacman
}
 
package() {
    cd "$srcdir/${pkgname%-git}"
    bsdtar -xf dist/gdesktopsuite-*.pacman -C "$pkgdir"
 
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
 
    ln -sf '/opt/G Desktop Suite/gdesktopsuite' '/usr/bin/gdesktopsuite'

    rm "$pkgdir"/.[^.]*
}
