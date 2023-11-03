# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>
pkgname=yang-lsp-git
pkgrel=1
pkgver=0.7.3.r4.g2ce0935
license=('Apache')
arch=('any')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
pkgdesc="A Language Server for YANG"
makedepends=('git' 'jdk11-openjdk')
depends=('bash' 'java-runtime=11')
url="https://github.com/theia-ide/yang-lsp"
source=("git+https://github.com/theia-ide/yang-lsp.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    VERSION="$(git tag | tail -n1 | sed s/v//)"
    COMMIT_COUNT="$(git rev-list --count v"$VERSION"..)"
    echo "$VERSION.r$COMMIT_COUNT.g$(git rev-parse --short HEAD)"
}

build() {
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
    cd "$srcdir/${pkgname%-git}/yang-lsp"
    ./gradlew --no-daemon build -x test
}

check() {
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
    cd "$srcdir/${pkgname%-git}/yang-lsp"
    ./gradlew --no-daemon test
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
