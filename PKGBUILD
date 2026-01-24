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
sha256sums=('ad3e5447209df27fbb4778b4e5255b327a309f325834acbe1d011562794d4dba') 

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