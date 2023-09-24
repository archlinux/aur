# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname="jellyfin-web-intro-skipper"
pkgver=10.8.10
_commit=4d9c94b8f109435b68ea864bcea3bc41dfceb128
pkgrel=2
pkgdesc="Modified jellyfin web client to use with the 'Intro Skipper' plugin"
arch=('any')
url="https://github.com/ConfusedPolarBear/jellyfin-web"
license=('GPL2')
provides=("${pkgname%-intro-skipper}=$pkgver")
conflicts=("${pkgname%-intro-skipper}")
makedepends=('git' 'npm')
source=("$pkgname::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"

    # jellyfin-web comes with a 'prepare' script, that runs the build when 'npm ci' is run
    # however, we want the build to run a separate step, so this script is skipped here
    # TODO: the script has been removed on the master branch, this can be removed with jellyfin-web 10.9
    # see also: https://bugs.archlinux.org/task/79713
    SKIP_PREPARE=1 npm ci --no-audit --no-fund --no-update-notifier
}

build() {
    cd "$pkgname"
    npm run build:production
}

package() {
    install -d "$pkgdir"/usr/share/jellyfin-web
    cp -r "$pkgname/dist/." "$pkgdir/usr/share/jellyfin-web/"
}
