# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Lucki

pkgname="asf-ui-git"
pkgver=r1262.6e7611d
pkgrel=1
pkgdesc="Standalone web interface for ASF."
arch=('any')
url="https://github.com/JustArchiNET/ArchiSteamFarm"
license=('Apache')
depends=('asf')
makedepends=('git' 'npm')
provides=('asf-ui')
source=("asf-ui::git+https://github.com/JustArchiNET/ASF-ui.git")
sha256sums=('SKIP')

pkgver() {
    cd asf-ui
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd asf-ui
    npm ci
    npm run-script deploy
}

package() {
    install -d -m 755 "${pkgdir}/usr/lib/asf/www"
    cp -rdp --no-preserve=ownership asf-ui/dist/* "${pkgdir}/usr/lib/asf/www"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user 
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"
}
