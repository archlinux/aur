# Maintainer: Kirill Goncharov <kdgoncharov at gmail dot com>
pkgname=aragon-cli
_npmscope=@aragon
_npmname=cli
pkgver=7.0.0
pkgrel=1
pkgdesc="CLI for creating and publishing Aragon apps"
arch=('any')
options=(!strip)
url="https://github.com/aragon/aragon-cli"
license=('GPL')
depends=('nodejs')
makedepends=('nodejs' 'npm')
source=("http://registry.npmjs.org/${_npmscope}/${_npmname}/-/${_npmscope}/${_npmname}-${pkgver}.tgz")
sha256sums=('d82169f61bb9c18154523133c05c6e7ee9028b311ec3ae7a1b251fec19b984a1')
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
