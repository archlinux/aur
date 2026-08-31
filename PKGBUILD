# Maintainer: ltdk <usr@ltdk.xyz>
pkgname=junixsocket
pkgver=2.11.1
_java=25
pkgrel=3
pkgdesc='Unix Domain Sockets for all Java versions 7 and newer (AF_UNIX), AF_TIPC, AF_VSOCK, and more'
arch=(any)
url="https://github.com/kohlschutter/$pkgname"
license=('Apache')
depends=('java-runtime-headless>=8')
makedepends=('maven' 'clang' 'gcc' "java-environment=$_java" 'strip-nondeterminism')
source=("https://github.com/kohlschutter/$pkgname/archive/refs/tags/$pkgname-$pkgver.tar.gz")
sha256sums=('dabdcaa89395e8aff3b21f1821fce26ec58c80f3bd8e989510cc7711bffd19c3')
validpgpkeys=('F2F098DD0383FE75CD5C6D3A0321BEE8AA36B734')
_jars=(
    junixsocket-common
    junixsocket-jetty
    junixsocket-mysql
    junixsocket-native-common
    junixsocket-native-custom
    junixsocket-rmi
    junixsocket-selftest
    junixsocket-server
    junixsocket-ssl
    junixsocket-tipc
    junixsocket-vsock
)
_maven=(
    mvn
    -am
    -Dretrolambda=false
    -Dignorant
    -DskipTests
    -Dproject.build.outputTimestamp="$(date --rfc-3339=s ${SOURCE_DATE_EPOCH:+--date=@$SOURCE_DATE_EPOCH} | tr ' ' T)"
    -Dmaven.javadoc.skip=true
    -Dmaven.repo.local="./out"
)

prepare() {
    cd "$pkgname-$pkgname-$pkgver"
    export PATH="/usr/lib/jvm/java-$_java-openjdk/bin:$PATH"
    mkdir -p out
    "${_maven[@]}" generate-sources
}

build() {
    cd "$pkgname-$pkgname-$pkgver"
    export PATH="/usr/lib/jvm/java-$_java-openjdk/bin:$PATH"
    mkdir -p out
    "${_maven[@]}" clean install
    for jar in "${_jars[@]}"; do
        strip-nondeterminism "out/com/kohlschutter/$pkgname/$jar/$pkgver/$jar-$pkgver.jar"
    done
    strip-nondeterminism "out/com/kohlschutter/$pkgname/junixsocket-selftest/$pkgver/junixsocket-selftest-$pkgver-jar-with-dependencies.jar"
}

package() {
    cd "$pkgname-$pkgname-$pkgver"
    export PATH="/usr/lib/jvm/java-$_java-openjdk/bin:$PATH"
    for jar in "${_jars[@]}"; do
        install -m644 -D "out/com/kohlschutter/$pkgname/$jar/$pkgver/$jar-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$jar-$pkgver.jar"
        ln -s "$pkgname/$jar-$pkgver.jar" "$pkgdir/usr/share/java/$jar.jar"
    done
    install -m644 -D "out/com/kohlschutter/$pkgname/junixsocket-selftest/$pkgver/junixsocket-selftest-$pkgver-jar-with-dependencies.jar" "$pkgdir/usr/share/java/$pkgname/junixsocket-selftest-$pkgver-jar-with-dependencies.jar"
    ln -s "$pkgname/junixsocket-selftest-$pkgver-jar-with-dependencies.jar" "$pkgdir/usr/share/java/junixsocket-selftest-jar-with-dependencies.jar"
}

check() {
    cd "$pkgname-$pkgname-$pkgver"
    export PATH="/usr/lib/jvm/java-$_java-openjdk/bin:$PATH"

    java \
        -Dselftest.skip.MappedMemoryTest=true \
        -Dselftest.skip.SharedMemoryTest=true \
        -jar out/com/kohlschutter/$pkgname/junixsocket-selftest/$pkgver/junixsocket-selftest-$pkgver-jar-with-dependencies.jar
}
