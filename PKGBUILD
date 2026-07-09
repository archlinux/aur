pkgname=intellij-idea-community-edition-bin
pkgver=2026.1.4
pkgrel=1
pkgdesc="IntelliJ IDEA Community Edition – JetBrains IDE for JVM development"
arch=('x86_64')
url="https://www.jetbrains.com/idea/"
license=('Apache')
depends=('java-runtime')
optdepends=('git: version control integration')
provides=('intellij-idea-community')
conflicts=('intellij-idea-community')

source=("idea-$pkgver.tar.gz::https://github.com/JetBrains/intellij-community/releases/download/idea%2F${pkgver}/idea-${pkgver}.tar.gz")
sha256sums=('54d7938d7d892fc738890986b74115cf4ed11d7e74bac6888e912ecd783db837')

package() {
    local srcdir_idea
    srcdir_idea="$(fd -t d '^idea-' "$srcdir" | head -n1)"

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
