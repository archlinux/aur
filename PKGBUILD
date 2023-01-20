# Maintainer: RealStickman <mrc+aur _a_ frm01 _d_ net>

pkgname=tachidesk-jui-git
_pkgname=Tachidesk-JUI
pkgver=v1.3.0.r294.gea791a8b
_pkgver=1.3.0 # likely needs to be updated after major version releases
pkgrel=1
pkgdesc='A free and open source manga reader to read manga from a Tachidesk-Server instance.'
arch=('x86_64')
url='https://github.com/Suwayomi/Tachidesk-JUI'
license=('MPL2')
depends=('jre-openjdk>=17')
makedepends=('git'
             'jdk-openjdk>=17')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git"
        "${pkgname%-git}.desktop"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'ce97f5451bc5cc13a17c7fbc4302ff5c7d5761f7981dc85abca5005add76a84b'
            '74b5ba775456612d207c21b6be40a7b37544155987782065b60897505f27864a')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    # change into source
    cd "$srcdir/${pkgname%-git}"
    # build jar
    ./gradlew packageUberJarForCurrentOS
}

package() {
    # change into source directory
    pushd "$srcdir/${pkgname%-git}"
    install -Dm644 "desktop/build/compose/jars/${_pkgname}-linux-x64-${_pkgver}.jar" "$pkgdir/usr/share/java/${pkgname%-git}/${pkgname%-git}.jar"
    install -Dm644 "resources/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
    popd

    # main directory
    install -Dm644 "${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm755 "${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
}
