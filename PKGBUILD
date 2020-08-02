# Maintainer: Jace Bennest <jacebennest87 at gmail dot com>
# Contributor: skydrome <skydrome at protonmail dot com>
# Contributor: StevensNJD4 <github dot com slash StevensNJD4>

pkgname=lazyman-git
pkgver=2.4.0.20200224
pkgrel=1
pkgdesc="A simple program that lets you stream every NHL and MLB game"
url="https://github.com/StevensNJD4/LazyMan"
license=('GPL2')
arch=('any')
depends=('java-runtime>=8' 'streamlink' 'mpv')
makedepends=('java-environment>=8' 'apache-ant' 'go' 'git')
provides=('lazyman')
conflicts=('lazyman')
backup=('usr/share/java/lazyman/config.properties')

source=('git+https://github.com/skydrome/LazyMan.git#branch=gui'
        'git+https://github.com/jwallet/go-mlbam-proxy.git'
        'config.properties'
        lazyman.{sh,png,desktop})

md5sums=('SKIP'
         'SKIP'
         'cae201808fa8b54bfb89333b5f05e3af'
         'b387dc6c2bdf54718d6d2e48f9f37e3d'
         '41aebb968e8b6856d1b73cabd6a8c5d2'
         '1b259947cc8e14cd1b0bcad4d05094d9')

pkgver() {
    cd LazyMan/LazyMan
    cat resources/VERSION.txt
}

prepare() {
    cd LazyMan/LazyMan

    # shorten path to the proxy
    sed -i src/Objects/Proxy.java \
        -e 's|mitm = "linux".*|mitm = "mlbamproxy";|'

    # ant wont do this itself without netbeans
    printf "Manifest-Version: 1.0\nClass-Path: lib/gson-2.7.jar lib/jcalendar-1.4.jar lib/AppleJavaExtens
 ions-1.4.jar" >manifest.mf
}

build() {
    cd LazyMan/LazyMan
    rm -rf build dist store
    ant jar

    cd ../../go-mlbam-proxy
    go build -o ../LazyMan/LazyMan/mlbamproxy
}

package() {
    cd LazyMan/LazyMan
    install -dm755 "$pkgdir"/usr/bin
    install -dm755 "$pkgdir"/usr/share/applications
    install -dm755 "$pkgdir"/usr/share/icons
    install -dm755 "$pkgdir"/usr/share/java/lazyman/lib

    install -Dm644 dist/LazyMan.jar        "$pkgdir"/usr/share/java/lazyman/LazyMan.jar
    install -Dm644 src/lazyman/*.jar       "$pkgdir"/usr/share/java/lazyman/lib/
    install -Dm755 mlbamproxy              "$pkgdir"/usr/share/java/lazyman/mlbamproxy/mlbamproxy
    install -Dm755 ../../lazyman.sh        "$pkgdir"/usr/bin/lazyman
    install -Dm644 ../../lazyman.desktop   "$pkgdir"/usr/share/applications/lazyman.desktop
    install -Dm644 ../../lazyman.png       "$pkgdir"/usr/share/icons/lazyman.png
    install -Dm777 ../../config.properties "$pkgdir"/usr/share/java/lazyman/config.properties
}
