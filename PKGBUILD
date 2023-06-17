# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

graal_=20.0.1+9.1
jdk_=${graal_%%+*}
java_=${jdk_%%.*}
pkgname="jdk${java_}-graalvm-bin"
pkgver=23.0.0
pkgrel=2
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://www.graalvm.org/'
license=('custom')
depends=('java-runtime-common'
         'java-environment-common')
makedepends=()
optdepends=("graaljs-jdk${java_}-bin: JavaScript component (used to be bundled with this package before the 22.2.0 release)"
            "graal-llvm-jdk${java_}-bin: LLVM component (used to be bundled with this package before the 22.2.0 release)"
            "graal-visualvm-jdk${java_}-bin: VisualVM component (used to be bundled with this package before the 22.2.0 release)")
provides=("java-runtime=${java_}"
          "java-environment=${java_}")
options=('staticlibs')
install="$pkgname.install"
source=('graalvm-rebuild-libpolyglot.hook')
sha256sums=('SKIP')
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-${jdk_}/graalvm-community-jdk-${jdk_}_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-${jdk_}/graalvm-community-jdk-${jdk_}_linux-aarch64_bin.tar.gz")
sha256sums_x86_64=('1c965f4698a5435bb8d094c9b2a13f7079e43d9934915964a2ee15fb81b53a79')
sha256sums_aarch64=('ffb205a6fc0b84cbc5d38e86ce12fe01294ba1507c1a72535f63a57c57513a35')

package() {
    cd "graalvm-community-openjdk-${graal_}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/JAVA/${java_}/g" < "../graalvm-rebuild-libpolyglot.hook" > "graalvm-jdk${java_}-rebuild-libpolyglot.hook"
    install -DTm644 "graalvm-jdk${java_}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-jdk${java_}-rebuild-libpolyglot.hook"
}
