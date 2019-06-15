# Maintainer: Ricardo Grim Cabrita <grimkriegor@krutt.org>

pkgname=java-language-server-git
_pkgname=java-language-server
pkgver=0.2.19.r1227.ce5b939
pkgrel=2
pkgdesc="Java language server using the Java compiler API"
arch=('any')
url="https://github.com/georgewfraser/java-language-server.git"
license=('MIT')
conflicts=('java-language-server')
provides=('java-language-server')
depends=('java-runtime')
makedepends=('git' 'maven')
source=("${_pkgname}::git+${url}"
        "launcher.sh")
sha256sums=('SKIP'
            '2010843d40c0612dd7884d53645435001190623c471b43a2e71d5434e9bca6e3')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.%s" \
    "$(sed -nE 's/^\s*"version": "(.*?)",$/\1/p' package.json)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
    export JAVA_HOME="/usr/lib/jvm/default"
    cd "${srcdir}/${_pkgname}"
    ./scripts/link_mac.sh
}

package() {
    mkdir -p \
      "${pkgdir}/usr/share/java" \
      "${pkgdir}/usr/bin"
    cp -r \
      "${srcdir}/${_pkgname}/dist/mac" \
      "${pkgdir}/usr/share/java/java-language-server"
    install \
      "${srcdir}/launcher.sh" \
      "${pkgdir}/usr/bin/java-language-server"
}
