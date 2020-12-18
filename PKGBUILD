# Author: futpib <futpib@gmail.com>

pkgname=youtube-tv-git
pkgver=1.0.0.r2.g60dfe38
pkgrel=1
pkgdesc="Desktop YouTube TV app"
arch=('x86_64')
url='https://github.com/futpib/youtube-tv'
license=('GPL')
depends=()
makedepends=('git' 'nodejs' 'yarn' 'node-gyp' 'python' 'unzip')
provides=('youtube-tv')
conflicts=('youtube-tv')
source=("git://github.com/futpib/youtube-tv.git")
sha256sums=('SKIP')

_pkgname=${pkgname%%-git}

pkgver() {
    cd "${srcdir}/${_pkgname}"

    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
    cd "${srcdir}/${_pkgname}"

    yarn install --frozen-lockfile --ignore-engines
    yarn build
}

package() {
    cd "${srcdir}/${_pkgname}"
    cd dist/*

    appdir="usr/lib/$_pkgname"
    install -d "$pkgdir/$(dirname "$appdir")"
    cp -r . "$pkgdir/$appdir"

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/$appdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

    install -Dm0644 -t "${pkgdir}/usr/share/applications" "$srcdir/$_pkgname/resources/youtube-tv.desktop"
}
