# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

graal_=20.0.2+9.1
jdk_=${graal_%%+*}
java_=${jdk_%%.*}
pkgname="jdk${java_}-graalvm-bin"
pkgver=23.0.1
pkgrel=1
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
sha256sums_x86_64=('941a85a690e7b1c4e1fcfac321561ca46033bba3ac4882dd15d4f45edd06726c')
sha256sums_aarch64=('6022709c124191da5087d0b0c62c3246943b3d5a386717c8d1af593637217028')

package() {
    cd "graalvm-community-openjdk-${graal_}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" *
    install -DTm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/JAVA/${java_}/g" < "../graalvm-rebuild-libpolyglot.hook" > "graalvm-jdk${java_}-rebuild-libpolyglot.hook"
    install -DTm644 "graalvm-jdk${java_}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-jdk${java_}-rebuild-libpolyglot.hook"
}
