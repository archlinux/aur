# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nodejs-pkg
pkgver=4.4.8
pkgrel=1
pkgdesc="Package your Node.js project into an executable"
arch=('x86_64')
url="https://github.com/zeit/pkg"
license=('MIT')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zeit/pkg/archive/${pkgver}.tar.gz")
sha512sums=('b051f589c4fba7628c70bf5dde3fe69ac8223b87204ef014a853ae3e2a45b316eb9077a25b8e4a9e9dace80e3ed56f4f2a25c8d5c5bad6459b361d2c3c4858ad')
noextract=("${pkgname}-${pkgver}.tar.gz")

package() {
    #npm install -g --user root --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tar.gz"
    npm install -g pkg@${pkgver} --user root --prefix "${pkgdir}/usr"

    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    # npm gives ownership of ALL FILES to build user
    # https://bugs.archlinux.org/task/63396
    chown -R root:root "${pkgdir}"
}
