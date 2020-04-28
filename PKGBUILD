# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=jdrive
pkgver=2.3.1
pkgrel=2
pkgdesc="Google Drive sync daemon"
arch=(any) #Any that can fill the dependencies
url="https://gitlab.com/mrvik/${pkgname}"
depends=("nodejs>=10" "nodejs<14")
license=("GPL2")
provides=("jdrive")
replaces=("nodejs-jdrive")
conflicts=("nodejs-jdrive")
makedepends=(npm python2)
optdepends=(
    "jdrive-client: See JDrive progress using JDrive socket"
)
source=("jdrive.tgz::${url}/-/jobs/artifacts/v${pkgver}/raw/jdrive.tgz?job=Build%20npm%20tarball")
noextract=("jdrive.tgz")
sha512sums=('956bb70be1b797ec7de8308f6ac5db63151dc932154eea0848b2ab7cc9f2150c83f38bd32aeb9181ded9084f242b46ce81ddc600a751e934cea9c6ce59a7352a')

prepare(){
    tar --strip=1 -axf jdrive.tgz package/init
}
package(){
    npm install --only=prod --user=root -g --prefix="${pkgdir}/usr" --cache="${srcdir}/npm-cache" jdrive.tgz
    find "${pkgdir}" -type d -exec chmod 755 {} +
    mkdir -p "$pkgdir"/usr/lib/systemd/user
    install -m644 -o0 -g0 "$srcdir"/init/jdrive@.service "$pkgdir"/usr/lib/systemd/user/jdrive@.service
}
