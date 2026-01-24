# Maintainer: Omar Semgey <omar.semgey@gmail.com>
pkgname=forgefoundary
pkgver=1.0.1
pkgrel=1
pkgdesc="Flexible, framework-agnostic scaffolding tool"
arch=('any')
url="https://github.com/omarSemgey/ForgeFoundary"
license=('MIT')
depends=('php>=8.2' 'composer' 'git')
source=("https://github.com/omarSemgey/ForgeFoundary/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c032f81208f0f6226c1b5a68360dda9a95c1ef4604a1893ea46693fceb031fde') 

package() {
    mkdir -p "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/ForgeFoundary-$pkgver/"* "$pkgdir/opt/$pkgname/"

    cd "$pkgdir/opt/$pkgname"
    export COMPOSER_ALLOW_SUPERUSER=1
    composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist

    # Copy documentation
    install -Dm644 README.MD "$pkgdir/usr/share/doc/$pkgname/README.MD"

    # Create the CLI wrapper script directly
    cat > "$pkgdir/usr/bin/ForgeFoundary" <<'EOF'
#!/bin/sh
php /opt/forgefoundary/ForgeFoundary "$@"
EOF
    chmod +x "$pkgdir/usr/bin/ForgeFoundary"
}