# Author: futpib <futpib@gmail.com>

pkgname=pagraphcontrol-git
pkgver=1.0.13.r4.g128d65c
pkgrel=1
pkgdesc="PulseAudio Graph Control"
arch=('x86_64')
url='https://github.com/futpib/pagraphcontrol'
license=('GPL')
depends=('papeaks-git')
makedepends=('git' 'nodejs' 'yarn' 'node-gyp' 'python' 'unzip')
provides=('pagraphcontrol')
conflicts=('pagraphcontrol')
source=("git://github.com/futpib/pagraphcontrol.git")
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

    install -Dm0644 -t "${pkgdir}/usr/share/applications" "$srcdir/$_pkgname/resources/pagraphcontrol.desktop"
}
