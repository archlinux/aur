# Maintainer: Michael A. Sinclair <squattingmonk@gmail.com>
# Contributor: Kevin Sheehan <kms.sheehan@gmail.com>
pkgname=nwnsc-git
pkgver=v1.1.0
pkgrel=1
pkgdesc="A command-line NWScript compiler for Neverwinter Nights"
arch=('any')
url="https://gitlab.com/glorwinger/nwnsc"
license=('custom')
groups=()
depends=()
makedepends=('git' 'docker' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/glorwinger/nwnsc.git'
        'fix-docker-file-permissions.patch'
        'fix-steam-paths.patch')
md5sums=('SKIP'
         '9dc4ff49e791f7a8a2d1a86bd12d58d7'
         '8bec12f6ea5cdd132524337f04647164')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git am --3way "$srcdir/fix-steam-paths.patch"
    git am --3way "$srcdir/fix-docker-file-permissions.patch"
}

build() {
    if [ $(systemctl is-active docker.service) = 'inactive' ]; then
        echo "The docker daemon is not running. Aborting..."
        exit 1
    fi

    if [[ ! $(id -Gn | grep -w 'docker') ]]; then
        echo "$USER must be a member of the docker group to execute. Aborting..."
        exit 1
    fi

    cd "$srcdir/${pkgname%-git}"
    ./scripts/run-linux-build.sh -c
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 nwnsc/nwnsc "$pkgdir/usr/bin/${pkgname%-git}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
