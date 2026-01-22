# Maintainer: yogh-io <info@yogh.nl>
pkgname=diffstalker-git
pkgver=0.1.4.r0.g592e42c
pkgrel=1
pkgdesc="Terminal UI for git staging, committing, and reviewing changes"
arch=('any')
url="https://github.com/yogh-io/diffstalker"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'git')
provides=('diffstalker')
conflicts=('diffstalker')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.1.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$pkgname"
    npm ci --ignore-scripts
    npm run bundle
}

package() {
    cd "$pkgname"

    # Install bundled files to /usr/lib/diffstalker
    install -dm755 "$pkgdir/usr/lib/diffstalker"
    cp -r dist/bundle/* "$pkgdir/usr/lib/diffstalker/"

    # Create wrapper script
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/diffstalker" << 'EOF'
#!/bin/sh
exec node /usr/lib/diffstalker/index.js "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/diffstalker"

    # Install license and documentation
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
