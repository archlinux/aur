pkgname=intellij-idea-community-edition-bin
pkgver=2026.2.1
pkgrel=1
pkgdesc="IntelliJ IDEA Community Edition – JetBrains IDE for JVM development"
arch=('x86_64')
url="https://www.jetbrains.com/idea/"
license=('Apache')
depends=('java-runtime')
optdepends=('git: version control integration' 'svgo: svg optimization' 'oxipng: png optimization')
provides=('intellij-idea-community')
conflicts=('intellij-idea-community')

source=("idea-$pkgver.tar.gz::https://github.com/JetBrains/intellij-community/releases/download/idea%2F${pkgver}-preview/idea-2026.2.0.1.tar.gz")
sha256sums=('1a95024d3e6fa9cb015dab168500fe57a891d1bc20854c8b3ed58ed53d2827a6')

package() {
    local srcdir_idea
    srcdir_idea="$(fd -t d '^idea-' "$srcdir" 2>/dev/null | head -n1 || find "$srcdir" -maxdepth 1 -type d -name 'idea-*' | head -n1)"

    if command -v svgo >/dev/null 2>&1; then
        svgo . -r --multipass
    fi

    if command -v oxipng >/dev/null 2>&1; then
        oxipng -o max -r -p -s -v -t "$(nproc)" -z --zi 100 --ziwi 10 --brute-level 5 --brute-lines 16 .
    fi

    if [[ -z "$srcdir_idea" ]]; then
        printf "ERROR: IntelliJ directory not found in srcdir\n"
        exit 1
    fi

    install -d "$pkgdir/opt/intellij-idea-community"
    cp -r "$srcdir_idea"/* "$pkgdir/opt/intellij-idea-community/"

    install -d "$pkgdir/usr/bin"
    ln -s /opt/intellij-idea-community/bin/idea.sh "$pkgdir/usr/bin/idea-community"

    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/intellij-idea-community.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=IntelliJ IDEA Community
Exec=/opt/intellij-idea-community/bin/idea.sh
Icon=/opt/intellij-idea-community/bin/idea.png
Terminal=false
Categories=Development;IDE;
EOF
}
