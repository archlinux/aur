
# Maintainer: Jiří Kořenek
pkgname=fuzzy
pkgver=0.0.2
pkgrel=2
pkgdesc="Dynamic live fuzzy finder in C# using ripgrep"
arch=('x86_64')
url="https://github.com/wallach-game/fuzzy-csharp"
license=('MIT')
depends=('dotnet-runtime' 'ripgrep')
makedepends=('dotnet-sdk')
source=("git+https://github.com/wallach-game/fuzzy-csharp.git")
sha256sums=('SKIP')  # Git repos usually skip checksum


build() {
    cd "$srcdir/fuzzy-csharp"
    dotnet publish fuzzy.csproj -c Release -o publish
}

package() {
    install -d "$pkgdir/usr/lib/fuzzy"
    install -d "$pkgdir/usr/bin"

    # Copy the published output
    cp -r "$srcdir/fuzzy-csharp/publish/"* "$pkgdir/usr/lib/fuzzy/"
    chmod +x "$pkgdir/usr/lib/fuzzy/fuzzy"

    # Create wrapper script in /usr/bin
    cat > "$pkgdir/usr/bin/fuzzy" << 'EOF'
#!/bin/bash
exec /usr/lib/fuzzy/fuzzy "$@"
EOF
    chmod +x "$pkgdir/usr/bin/fuzzy"
}
