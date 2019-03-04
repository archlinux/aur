# Maintainer: Víctor González <mrvikxd@gmail.com>
pkgname=jdrive
pkgver=2.1.1
pkgrel=1
pkgdesc="Google Drive sync daemon"
arch=(any) #Any that can fill the dependencies
url="https://gitlab.com/mrvik/${pkgname}"
depends=("nodejs>=10")
license=("GPL2")
provides=("jdrive")
replaces=("nodejs-jdrive")
makedepends=(npm python2)
optdepends=(
    "jdrive-client: See JDrive progress using JDrive socket"
)
source=("jdrive.tgz::${url}/-/jobs/artifacts/v${pkgver}/raw/jdrive.tgz?job=Build%20npm%20tarball")
noextract=("jdrive.tgz")
sha512sums=('47cd4e15c720bcdf4c9c12b59c4b04792bf2cb3ad178a1632c221590cf348733b9b1ae4858b94cb7b75a519fbe6e455466b946fcf9c5ee3ce81b868e7ccb8674')

prepare(){
    tar --strip=1 -axf jdrive.tgz package/init
}
package(){
    npm install --only=prod --user=root -g --prefix="${pkgdir}/usr" --cache="${srcdir}/npm-cache" jdrive.tgz
    find "${pkgdir}" -type d -exec chmod 755 {} +
    mkdir -p "$pkgdir"/usr/lib/systemd/user
    install -m644 -o0 -g0 "$srcdir"/init/jdrive@.service "$pkgdir"/usr/lib/systemd/user/jdrive@.service
}
