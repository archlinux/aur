# Maintainer: Ricardo Grim Cabrita <grim@kriegor.net>

pkgname=java-language-server
pkgver=0.2.39
pkgrel=1
pkgdesc="Java language server using the Java compiler API"
arch=(any)
url="https://github.com/georgewfraser/java-language-server"
license=('MIT')
provides=('java-language-server')
depends=('java-runtime>=14')
makedepends=('maven' 'java-environment>=14')
source=("${url}/archive/v${pkgver}.tar.gz"
        "launcher.sh")
sha256sums=('c06a3e5fbe387ed883c0652aece79ea00603e6e6d2a4f54400701807185b7eef'
            '26eb4214d744c16cd4e8976e495f6cad8c7c98d4ffad3ec79b71b6241e0a1bbf')

build() {
    jdk="$(find /usr/lib/jvm -maxdepth 1 -regex ".*1[4-9].*" | head -1)" &&
      test -n "$jdk" && export JAVA_HOME="$jdk"
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./scripts/link_linux.sh
    mvn package -DskipTests
}

package() {
    mkdir -p \
      "${pkgdir}/usr/share/java" \
      "${pkgdir}/usr/bin"
    cp -r \
      "${srcdir}/${pkgname}-${pkgver}/dist" \
      "${pkgdir}/usr/share/java/java-language-server"
    install \
      "${srcdir}/launcher.sh" \
      "${pkgdir}/usr/bin/java-language-server"
}
