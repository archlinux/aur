# Maintainer: Jace Bennest <jacebennest87 at gmail dot com>
# Contributor: skydrome <skydrome at protonmail dot com>
# Contributor: StevensNJD4 <github dot com slash StevensNJD4>

pkgname=lazyman-git
pkgver=2.4.0.20191028
pkgrel=2
pkgdesc="A simple program that lets you stream every NHL and MLB game"
url="https://github.com/StevensNJD4/LazyMan"
license=('GPL2')
arch=('any')
depends=('java-runtime>=8' 'streamlink' 'mpv')
makedepends=('java-environment>=8' 'apache-ant' 'go' 'git')
provides=('lazyman')
conflicts=('lazyman')
backup=('usr/share/java/lazyman/config.properties')

source=('git+https://github.com/StevensNJD4/LazyMan.git'
        'git+https://github.com/jwallet/go-mlbam-proxy.git'
        'update-to-java-13.patch'
        'config.properties'
        lazyman.{sh,png,desktop})

md5sums=('SKIP'
         'SKIP'
         '96d5ba5fd23360767fb365b46c0bfc3e'
         '16522ba6bdc10dfa827e0d8afbfd3c2e'
         'b76d76bc5941418f8f3048b941fa8228'
         '41aebb968e8b6856d1b73cabd6a8c5d2'
         '1b259947cc8e14cd1b0bcad4d05094d9')

pkgver() {
    cd LazyMan
    cat VERSION
}

prepare() {
    cd LazyMan
    patch -Np1 -i ../update-to-java-13.patch

    sed -i src/Objects/Proxy.java \
        -e 's|mitm = "linux".*|mitm = "mlbamproxy";|'
}

build() {
    cd LazyMan
    rm -rf build dist store
    ant jar

    cd ../go-mlbam-proxy
    go build -o ../LazyMan/mlbamproxy
}

package() {
    cd LazyMan
    install -dm755 "$pkgdir"/usr/bin
    install -dm755 "$pkgdir"/usr/share/applications
    install -dm755 "$pkgdir"/usr/share/icons
    install -dm755 "$pkgdir"/usr/share/java/lazyman/lib

    install -Dm644 dist/LazyMan.jar     "$pkgdir"/usr/share/java/lazyman/LazyMan.jar
    install -Dm644 src/lazyman/*.jar    "$pkgdir"/usr/share/java/lazyman/lib/
    install -Dm755 mlbamproxy           "$pkgdir"/usr/share/java/lazyman/mlbamproxy/mlbamproxy

    install -Dm755 ../lazyman.sh        "$pkgdir"/usr/bin/lazyman
    install -Dm644 ../lazyman.desktop   "$pkgdir"/usr/share/applications/lazyman.desktop
    install -Dm644 ../lazyman.png       "$pkgdir"/usr/share/icons/lazyman.png
    install -Dm777 ../config.properties "$pkgdir"/usr/share/java/lazyman/config.properties
}
