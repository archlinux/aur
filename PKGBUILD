# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=rapydscript-ng-git
pkgver=0.7.18.r14.g4d50bb1
pkgrel=2
pkgdesc="Pythonic JavaScript that doesn't suck"
arch=('any')
url="https://github.com/kovidgoyal/${pkgname%-git}"
license=('BSD')
depends=('nodejs')
makedepends=('git' 'npm')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver()
{
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    npm install --no-optional
    bin/rapydscript self --complete
    rm -rf release/ && mv dev/ release/
}

check() {
    cd "${srcdir}/${pkgname%-git}"
    bin/rapydscript test
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    mkdir -p "${pkgdir}"/usr/{bin,lib/node_modules/rapydscript-ng/}
    cp -r * "${pkgdir}"/usr/lib/node_modules/rapydscript-ng/
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +

    ln -s ../lib/node_modules/rapydscript-ng/bin/rapydscript "${pkgdir}"/usr/bin/rapydscript

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
