# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
pkgname=aragon-cli
_npmscope=@aragon
_npmname=cli
pkgver=7.0.3
pkgrel=1
pkgdesc="CLI for creating and publishing Aragon apps"
arch=('any')
options=(!strip)
url="https://github.com/aragon/aragon-cli"
license=('GPL')
depends=('nodejs')
makedepends=('nodejs' 'npm')
source=("http://registry.npmjs.org/${_npmscope}/${_npmname}/-/${_npmscope}/${_npmname}-${pkgver}.tgz")
sha256sums=('7b688d5797e9c1d48a218f6fd230e4674125f27eb2a630d358a3762d76318ec6')
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
}
