# Maintainer: Madeline Mewmews <maddie at mewmews dot gay>
# Contributor: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: <asamk(at)gmx.de>

pkgver=22.0.0
java_=${pkgver%%.*}
graal_=${java_}+36.1
pkgname="jdk${java_}-graalvm-bin"
pkgrel=1
pkgdesc="Universal virtual machine for running applications written in a variety of languages (JVM-based, LLVM-based, or other), Java ${java_} version"
arch=('x86_64'
      'aarch64')
url='https://www.graalvm.org/'
license=('custom')
depends=('java-runtime-common'
         'java-environment-common')
makedepends=()
provides=("java-runtime=${java_}"
          "java-environment=${java_}")
replaces=("native-image-jdk${java_}-bin")
options=('staticlibs')
install="$pkgname.install"
source=('graalvm-rebuild-libpolyglot.hook')
sha256sums=('eae72b5a2a2826eed7e4be5710d33f82934622a390ab6a9f009ed7753359e02e')
sha256sums_x86_64=('e5eeb486a23101753f18181d002c3ede9da13c463fb61d3ea448abe774db0657')
sha256sums_aarch64=('da9a0e11b110ebccff33ade502516d00f574ec3247868007e452cef4143e0904')
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-${pkgver}/graalvm-community-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-${pkgver}/graalvm-community-jdk-${pkgver}_linux-aarch64_bin.tar.gz")

package() {
    cd "graalvm-community-openjdk-${graal_}"
    mkdir -p "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/"
    cp -a -t "$pkgdir/usr/lib/jvm/java-${java_}-graalvm/" *
    install -DTm644 LICENSE_NATIVEIMAGE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    sed "s/JAVA/${java_}/g" < "../graalvm-rebuild-libpolyglot.hook" > "graalvm-jdk${java_}-rebuild-libpolyglot.hook"
    install -DTm644 "graalvm-jdk${java_}-rebuild-libpolyglot.hook" "$pkgdir/usr/share/libalpm/hooks/graalvm-jdk${java_}-rebuild-libpolyglot.hook"
}
