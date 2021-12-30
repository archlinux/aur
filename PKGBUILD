# Maintainer: dreamscached <dreamscache.d@gmail.com>
_pkgname=recaf
pkgname="${_pkgname}-bin"
pkgver=2.21.8
pkgrel=1
pkgdesc="A modern Java bytecode editor"
arch=("any")
url="https://github.com/Col-E/Recaf"
license=("MIT")
depends=("java-runtime" "java-openjfx" "ttf-font")
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
    "9b3fa9f1bd1697db3ef5bcff93283d172b6c6edba84a35a3cfa214bc17a2bdd7"
    "a13cb1a246bc0986c7185510a7ea9880e9f8eaf6d3a0437e2f3f2e2e85e9abb5"
)

prepare() {
    jar xf "$srcdir/$_pkgname-$pkgver-J8-jar-with-dependencies.jar" icons/logo.png
}

package() {
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm755 "$srcdir/$_pkgname-$pkgver-J8-jar-with-dependencies.jar" "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
    install -Dm644 "$srcdir/icons/logo.png" "$pkgdir/usr/share/pixmaps/recaf.png"
    printf '#!/usr/bin/env bash\nexec java -cp "/usr/lib/jvm/default-runtime/lib/*:/usr/share/java/%s/%s.jar" "me.coley.recaf.Recaf" "$@"' "$_pkgname" "$_pkgname" > "$srcdir/recaf"
    printf "[Desktop Entry]\nType=Application\nVersion=1.0\nName=Recaf\nComment=%s\nPath=/usr/bin\nExec=recaf %%u\nIcon=recaf\nTerminal=false\nCategories=Development;Java" "$pkgdesc" > "$srcdir/recaf.desktop"
    install -Dm755 "$srcdir/recaf" "$pkgdir/usr/bin/recaf"
    install -Dm644 "$srcdir/recaf.desktop" "$pkgdir/usr/share/applications/recaf.desktop"
    chmod 775 "$pkgdir/usr/bin/$_pkgname"
}
