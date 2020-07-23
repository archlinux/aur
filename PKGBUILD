# Maintainer: Colin Arnott <colin@urandom.co.uk>
pkgname="gitern"
pkgver=1.0.0
pkgrel=1
pkgdesc="a git host for hackers"
arch=('any')
url="https://gitern.com"
license=('MIT')
depends=('npm')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tgz::https://files.gitern.com/gitern-linux-x64.tar.gz")
noextract=("${pkgname}-${pkgver}.tgz")
sha512sums=('bdb87ef8542f120d0c2b75754b89029d01ed5e9397dcbfb36ee73cb16fafa7611914d4685e6ab0b7eabf75cd87ed289dcd2f49a2a12155375793d51763f772b6')

package() {
    npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
