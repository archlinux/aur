# Maintainer: Dwi Mulia Mokoginta <dwi-mulia-mokoginta@protonmail.com>
# Contributor: dreamscached <dreamscache.d@gmail.com>

_pkgname=recaf
pkgname="${_pkgname}"
pkgver=2.21.13
pkgrel=1
pkgdesc="A modern Java bytecode editor"
arch=("any")
url="https://github.com/Col-E/Recaf"
license=("MIT")

depends=("java-runtime" "java-openjfx" "ttf-font")
makedepends=("jdk17-openjdk")

conflicts=("$_pkgname-bin" "$_pkgname-git")
replaces=("$_pkgname")
provides=("$_pkgname")

source=(
    "https://github.com/Col-E/Recaf/archive/refs/tags/$pkgver.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/Col-E/Recaf/$pkgver/LICENSE"
)
sha256sums=(
    "c0b76ece9e838253b065a8703404e75363e52b4ca9cd6e47c5b680642bd8340c"
    "a13cb1a246bc0986c7185510a7ea9880e9f8eaf6d3a0437e2f3f2e2e85e9abb5"
)

build() {
  cd "$srcdir/Recaf-$pkgver"

  JAVA_HOME="/usr/lib/jvm/java-17-openjdk/" ./mvnw clean package
}

package() {
    cd "$srcdir/Recaf-$pkgver"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "src/main/resources/icons/logo.png" "$pkgdir/usr/share/pixmaps/recaf.png"

    install -Dm755 "target/$_pkgname-$pkgver-J8-jar-with-dependencies.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"

    printf '#!/usr/bin/env bash\nexec java -cp "/usr/lib/jvm/default-runtime/lib/*:/usr/share/java/%s/%s.jar" "me.coley.recaf.Recaf" "$@"' "$_pkgname" "$_pkgname" > "$srcdir/recaf"
    install -Dm755 "$srcdir/recaf" "$pkgdir/usr/bin/recaf"

    printf "[Desktop Entry]\nType=Application\nVersion=1.0\nName=Recaf\nComment=%s\nPath=/usr/bin\nExec=sh -c 'if [ -n \"\$0\" ]; then recaf --input=\"\$0\"; else recaf; fi' %%u\nIcon=recaf\nTerminal=false\nMimeType=application/java-archive\nCategories=Development;Java" "$pkgdesc" > "$srcdir/recaf.desktop"
    install -Dm644 "$srcdir/recaf.desktop" "$pkgdir/usr/share/applications/recaf.desktop"

    chmod 775 "$pkgdir/usr/bin/$_pkgname"
}
