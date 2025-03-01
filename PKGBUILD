# Maintainer: Dwi Mulia Mokoginta <dwi-mulia-mokoginta@protonmail.com>
# Contributor: dreamscached <dreamscache.d@gmail.com>

_pkgname="recaf"
pkgname="$_pkgname"
pkgver=2.21.14
pkgrel=1
pkgdesc="A modern Java bytecode editor"
url="https://github.com/Col-E/Recaf"
license=('MIT')

arch=("any")
depends=('java-environment-openjdk=23' "ttf-font")
makedepends=('jdk23-openjdk')

conflicts=("$_pkgname-bin" "$_pkgname-git")
replaces=("$_pkgname")
provides=("$_pkgname" "$_pkgname-git")

source=(
    "$_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/Col-E/Recaf/$pkgver/LICENSE"
    "$_pkgname"
    "$_pkgname.desktop"
)

build() {
  cd "Recaf-$pkgver"

  JAVA_HOME="/usr/lib/jvm/java-23-openjdk" ./mvnw clean package -Dmaven.test.skip -Dcheckstyle.skip
}

sha256sums=(
    'ae0a25f167f331aab374db74021c5ef162b3fb38768c369ae06e8b8242f01f7e'
    'a13cb1a246bc0986c7185510a7ea9880e9f8eaf6d3a0437e2f3f2e2e85e9abb5'
    'SKIP'
    'SKIP'
)

package() {
    cd "Recaf-$pkgver"

    sed -i "/^Version=/c\Version=$pkgver" "$srcdir/$_pkgname.desktop"
    sed -i "/^Comment=/c\Comment=$pkgdesc" "$srcdir/$_pkgname.desktop"

    install -Dm755 "target/$_pkgname-$pkgver-J8-jar-with-dependencies.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/recaf"
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

    install -Dm644 "src/main/resources/icons/logo-full.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
