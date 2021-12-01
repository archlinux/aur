# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
pkgname=yang-lsp-git
pkgrel=1
pkgver=r302275e
license=('Apache')
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="A Language Server for YANG"
makedepends=('git' 'jdk11-openjdk')
depends=('bash' 'java-runtime=11')
url="https://github.com/theia-ide/yang-lsp"
source=("git+https://github.com/theia-ide/yang-lsp.git#branch=dh-check-build") # `master` is currently broken, dh-check-build has a fix
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s" "$(git rev-parse --short HEAD)"
}

build() {
    export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
    cd "$srcdir/${pkgname%-git}/yang-lsp"
    ./gradlew --no-daemon build
}

package() {
    cd "$srcdir/${pkgname%-git}/"
    install -d "${pkgdir}/usr/share/${pkgname%-git}" "${pkgdir}/usr/bin"
    rm yang-lsp/io.typefox.yang.diagram/build/install/yang-language-server/bin/yang-language-server.bat
    cp -r yang-lsp/io.typefox.yang.diagram/build/install/yang-language-server/{lib,bin} "${pkgdir}/usr/share/${pkgname%-git}"

    EXECUTABLE_NAME="yang-language-server"
    sed -i '/Determine the Java/aexport PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"' \
        "${pkgdir}/usr/share/${pkgname%-git}/bin/$EXECUTABLE_NAME"

    ln -s "/usr/share/${pkgname%-git}/bin/$EXECUTABLE_NAME" "${pkgdir}/usr/bin/$EXECUTABLE_NAME"
}
