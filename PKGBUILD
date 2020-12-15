# Maintainer: dreamscached <dreamscache.d@gmail.com>
pkgname=recaf
pkgver=2.14.0
pkgrel=1
pkgdesc="A modern Java bytecode editor"
arch=("any")
url="https://github.com/Col-E/Recaf"
license=("MIT")
depends=("java-runtime" "java-openjfx")
makedepends=("jdk-openjdk")
noextract=("$pkgname-$pkgver-J8-jar-with-dependencies.jar")
source=(
    "https://github.com/Col-E/Recaf/releases/download/$pkgver/$pkgname-$pkgver-J8-jar-with-dependencies.jar"
    "https://raw.githubusercontent.com/Col-E/Recaf/$pkgver/LICENSE"
)
sha256sums=(
    "SKIP"
    "SKIP"
)

prepare() {
    # Extract logo
    jar xf "$srcdir/$pkgname-$pkgver-J8-jar-with-dependencies.jar" icons/logo.png
}

package() {
    # Install LICENSE to canonical location
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install JAR to canonical location
    install -Dm755 "$srcdir/$pkgname-$pkgver-J8-jar-with-dependencies.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"

    # Install logo to canonical location
    install -Dm644 "$srcdir/icons/logo.png" "$pkgdir/usr/share/pixmaps/recaf.png"

    # Build exec script
    printf '#!/usr/bin/env bash\nexec java -cp "/usr/lib/jvm/default-runtime/lib/*:/usr/share/java/%s/%s.jar" "me.coley.recaf.Recaf" "$@"' "$pkgname" "$pkgname" > "$srcdir/recaf"

    # Write .desktop file
    printf "[Desktop Entry]\nType=Application\nVersion=1.0\nName=Recaf\nComment=%s\nPath=/usr/bin\nExec=recaf %%u\nIcon=recaf\nTerminal=false\nCategories=Development;Java" "$pkgdesc" > "$srcdir/recaf.desktop"

    # Install exec script to canonical location
    install -Dm755 "$srcdir/recaf" "$pkgdir/usr/bin/recaf"

    # Install .desktop to canonical location
    install -Dm644 "$srcdir/recaf.desktop" "$pkgdir/usr/share/applications/recaf.desktop"

    # Modify permissions
    chmod 775 "$pkgdir/usr/bin/$pkgname"
}
