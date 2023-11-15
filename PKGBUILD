# Maintainer: Ricardo Grim Cabrita <grim@kriegor.net>

pkgname=kotlin-language-server-git
_pkgname=kotlin-language-server
pkgver=r1444.80fc538
pkgrel=1
pkgdesc="Smart code completion, diagnostics and more for Kotlin using the Language Server Protocol"
arch=(any)
url="https://github.com/fwcd/kotlin-language-server.git"
license=('MIT')
conflicts=('kotlin-language-server')
provides=('kotlin-language-server')
depends=('java-runtime=11')
makedepends=('java-environment=11' 'git')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
    jdk="$(find /usr/lib/jvm -maxdepth 1 -name "*11*jdk" | head -1)" &&
      test -n "$jdk" && export JAVA_HOME="$jdk"
    cd "${srcdir}/${_pkgname}"
    ./gradlew server:installDist
}

package() {
    mkdir -p \
      "${pkgdir}/usr/share/kotlin" \
      "${pkgdir}/usr/bin"
    cp -r \
      "${srcdir}/${_pkgname}/server/build/install/server/" \
      "${pkgdir}/usr/share/kotlin/kotlin-language-server"
    ln -srf \
      "${pkgdir}/usr/share/kotlin/kotlin-language-server/bin/kotlin-language-server" \
      "${pkgdir}/usr/bin/kotlin-language-server"
}

