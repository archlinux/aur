# Maintainer: Jeremy Symon <jtsymon@gmail.com>
pkgbase='key-logic'
pkgname=("$pkgbase" "$pkgbase-examples")
pkgver=2.4.1
pkgrel=1
pkgdesc="A dynamic logic proof tool"
arch=('any')
url="http://www.key-project.org"
license=('GPL2')
depends=('jdk')
makedepends=()
checkdepends=()
optdepends=()
source=("$url/download/releases/$pkgver/KeY-${pkgver}.tgz")
sha256sums=('865e7186a031b4eb8d1575114dbf1a7da1179e00341568d89324462e84083321')

prepare() {
    jar xf setup.jar de/uka/ilkd/key/util/install/startProver_linux
    sed \
        -e '1a KEY_HOME="/usr/lib/'$pkgname'"\nKEY_LIB=/usr/share/java/"'$pkgname'-ext"' \
        -i de/uka/ilkd/key/util/install/startProver_linux
    mkdir -p examples
    pushd examples
    jar xf ../examples.jar
    popd
}

package_key-logic() {
    optdepends=("$pkgbase-examples")
    depends+=("$pkgbase-ext")
    install -Dm755 de/uka/ilkd/key/util/install/startProver_linux \
        $pkgdir/usr/bin/$pkgbase
    install -Dm644 key.jar $pkgdir/usr/lib/$pkgbase/system/key.jar
}

package_key-logic-examples() {
    pkgdesc="Example proofs for KeY"
    depends=("$pkgbase")
    install -d $pkgdir/usr/lib/$pkgbase
    cp -rT examples $pkgdir/usr/lib/$pkgbase/examples
}
