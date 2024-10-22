# Maintainer: D7OM <hello@d7om.dev>

pkgname=keyvis
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple and lightweight keystroke visualisation tool"
arch=('any')
url="https://github.com/d7omdev/keyvis"
license=('MIT')
depends=('gjs' 'gtk4' 'keyd' 'bun')
makedepends=('git' 'bun' 'npm' 'typescript')
provides=('keyvis')
conflicts=('keyvis')
source=("git+https://github.com/d7omdev/keyvis.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/keyvis"
    version=$(jq -r .version package.json)
    echo "$version"
}

build() {
    cd "${srcdir}/keyvis"
    bun install
    bun run build:app
}

package() {
    cd "${srcdir}/keyvis"

    # Create necessary directories
    install -dm755 "${pkgdir}/usr/lib/keyvis"
    install -dm755 "${pkgdir}/usr/bin"

    # Check if the dist directory exists and contains main.js
    if [[ -f "dist/main.js" ]]; then
        # Install compiled JavaScript
        install -Dm644 dist/main.js "${pkgdir}/usr/lib/keyvis/main.js"
    else
        echo "Error: dist/main.js not found. Please ensure the build step completed successfully."
        exit 1
    fi

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Create and install the executable script for keyvis
    cat >"${pkgdir}/usr/bin/keyvis" <<EOF
#!/usr/bin/env bash

if [ \$# -eq 0 ]; then
    gjs -m /usr/lib/keyvis/main.js > /dev/null 2>&1 &
else
    gjs -m /usr/lib/keyvis/main.js "\$@"
fi
EOF

    # Ensure the keyvis script is executable
    chmod 755 "${pkgdir}/usr/bin/keyvis"

    # Add a shebang to the JavaScript file for easier execution
    echo "#!/usr/bin/env gjs" | cat - "${pkgdir}/usr/lib/keyvis/main.js" >temp && mv temp "${pkgdir}/usr/lib/keyvis/main.js"
    chmod +x "${pkgdir}/usr/lib/keyvis/main.js"
}
