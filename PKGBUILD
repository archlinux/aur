# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Popolon <popolon@popolon.org> (just upgraded to 5.8.1 and added the conflict with nodejs-shelljs)
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=nodejs-pkg
pkgver=5.8.1
pkgrel=1
pkgdesc="Package your Node.js project into an executable"
arch=('x86_64')
url="https://github.com/zeit/pkg"
license=('MIT')
makedepends=('npm')
conflicts=('nodejs-shelljs')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zeit/pkg/archive/${pkgver}.tar.gz")
sha512sums=('bdf0c04743e338393b8a942c7ae53e531ad260a7bcb1bca2560238b13a55f214a9f384d4d122679a1ccab0f471fef0beb35a5b197563b5e8ee141854d1558086')
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
