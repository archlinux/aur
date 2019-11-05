# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
pkgname=aragon-cli
_npmscope=@aragon
_npmname=cli
pkgver=6.3.3
pkgrel=1
pkgdesc="CLI for creating and publishing Aragon apps"
arch=('any')
options=(!strip)
url="https://github.com/aragon/aragon-cli"
license=('GPL')
depends=('nodejs')
makedepends=('nodejs' 'npm')
source=("http://registry.npmjs.org/${_npmscope}/${_npmname}/-/${_npmscope}/${_npmname}-${pkgver}.tgz")
sha256sums=('7373506bd41b8a96a6083693332d1227e2083454f87057fdab10595f7e3971e1')
noextract=('${_npmname}-${pkgver}.tgz')

package() {
    HUSKY_SKIP_INSTALL=1 npm install --global --user root --prefix "${pkgdir}/usr" "${_npmname}-${pkgver}.tgz"

    # -> https://wiki.archlinux.org/index.php/Node.js_package_guidelines
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "$pkgdir"

    # Remove unwanted git hooks.
    # HUSKY_SKIP_INSTALL doesn't work for old husky package (1.1.3) that installed from ganache-core dependencies
    cd ..
    if [ -d .git ]
    then
        rm -v .git/hooks/*
    fi
}
