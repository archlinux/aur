# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

java_=8
pkgname="jdk${java_}-graalvm-bin"
pkgver=21.2.0
pkgrel=2
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${java_} version"
arch=('x86_64')
url='https://www.graalvm.org/'
license=('custom')
depends=('java-runtime-common'
         'java-environment-common')
makedepends=()
optdepends=("graal-nodejs-jdk${java_}-bin: Node.js component (used to be bundled with this package before the 21.1.0 release)")
provides=("java-runtime=${java_}"
          "java-environment=${java_}")
install="$pkgname.install"
source=("https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${pkgver}/graalvm-ce-java${java_}-linux-amd64-${pkgver}.tar.gz"
        'graalvm-rebuild-libpolyglot.hook')
sha256sums=('0ea16ff2fe178800195e2918ee7ceee352601d4161a17eac67979febaaecfe05'
            'SKIP')

package() {
    cd "graalvm-ce-java${java_}-${pkgver}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/JAVA/${java_}/g" < "../graalvm-rebuild-libpolyglot.hook" > "graalvm-jdk${java_}-rebuild-libpolyglot.hook"
    install -DTm644 "graalvm-jdk${java_}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-jdk${java_}-rebuild-libpolyglot.hook"
}
