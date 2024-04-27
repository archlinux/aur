# Maintainer: dreamscached <dreamscache.d@gmail.com>
_pkgname=recaf
pkgname="${_pkgname}-bin"
pkgver=2.21.14
pkgrel=6
pkgdesc="A modern Java bytecode editor"
arch=("any")
url="https://github.com/Col-E/Recaf"
license=("MIT")
depends=("java-environment-openjdk=21" "ttf-font")
conflicts=("$_pkgname" "$_pkgname-git")
replaces=("$_pkgname")
provides=("$_pkgname")
makedepends=("jdk-openjdk")
noextract=("$_pkgname-$pkgver-J8-jar-with-dependencies.jar")
source=(
    "https://github.com/Col-E/Recaf/releases/download/$pkgver/$_pkgname-$pkgver-J8-jar-with-dependencies.jar"
    "https://raw.githubusercontent.com/Col-E/Recaf/$pkgver/LICENSE"
)
sha256sums=(
    "8d14fc007e2a90a0d2331e5170cfce0f899ad96631aa7565623dea997c6bcb84"
    "a13cb1a246bc0986c7185510a7ea9880e9f8eaf6d3a0437e2f3f2e2e85e9abb5"
)

prepare() {
    jar xf "$srcdir/$_pkgname-$pkgver-J8-jar-with-dependencies.jar" icons/logo.png
}

package() {
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm755 "$srcdir/$_pkgname-$pkgver-J8-jar-with-dependencies.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
    install -Dm644 "$srcdir/icons/logo.png" "$pkgdir/usr/share/pixmaps/recaf.png"
    printf '#!/usr/bin/env bash\nexec java -cp "/usr/lib/jvm/java-21-openjdk/lib/*:/usr/share/java/%s/%s.jar" "me.coley.recaf.Recaf" "$@"' "$_pkgname" "$_pkgname" > "$srcdir/recaf"
    printf "[Desktop Entry]\nType=Application\nVersion=1.0\nName=Recaf\nComment=%s\nPath=/usr/bin\nExec=sh -c 'if [ -n \"\$0\" ]; then recaf --input=\"\$0\"; else recaf; fi' %%u\nIcon=recaf\nTerminal=false\nMimeType=application/java-archive\nCategories=Development;Java" "$pkgdesc" > "$srcdir/recaf.desktop"
    install -Dm755 "$srcdir/recaf" "$pkgdir/usr/bin/recaf"
    install -Dm644 "$srcdir/recaf.desktop" "$pkgdir/usr/share/applications/recaf.desktop"
    chmod 775 "$pkgdir/usr/bin/$_pkgname"
}
