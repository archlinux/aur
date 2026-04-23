# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Gemini 3.1 Pro.

pkgname=l2pe-git
pkgver=2.4.0.r23.gbca6fbb
pkgrel=1
pkgdesc="Lineage 2 unreal object properties editor"
arch=('any')
url="https://github.com/acmi/L2pe"
license=('MIT')
depends=('java-runtime=8')
makedepends=('git' 'java-environment=8')
provides=('l2pe')
conflicts=('l2pe')
source=("git+https://github.com/acmi/L2pe.git"
        "java8-openjfx.pkg.tar.zst::https://github.com/guglovich/java8-openjfx-bin/releases/download/v8.u202-11/java8-openjfx-8.u202-11-x86_64.pkg.tar.zst"
        "l2pe.sh"
        "l2pe.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd "L2pe"
    _ver=$(grep -E "^version '.*'" build.gradle | sed -n "s/^version '\(.*\)'/\1/p")
    printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "L2pe"
    chmod +x gradlew
}

build() {
    cd "L2pe"
    export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
    ./gradlew jar
}

package() {
    # Install L2pe
    cd "L2pe"
    install -Dm644 "build/libs/L2pe.jar" "$pkgdir/usr/share/java/l2pe/L2pe.jar"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install launcher and desktop entry
    cd "$srcdir"
    install -Dm755 "l2pe.sh" "$pkgdir/usr/bin/l2pe"
    install -Dm644 "l2pe.desktop" "$pkgdir/usr/share/applications/l2pe.desktop"
    
    # Bundle JavaFX
    mkdir -p "$pkgdir/usr/share/java/l2pe/jfx"
    cp -r "usr/lib/jvm/java-8-openjdk/jre/lib/ext" "$pkgdir/usr/share/java/l2pe/jfx/"
    cp -r "usr/lib/jvm/java-8-openjdk/jre/lib/amd64" "$pkgdir/usr/share/java/l2pe/jfx/"
}
