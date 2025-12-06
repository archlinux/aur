# Maintainer: ind4skylivey <https://github.com/ind4skylivey>
pkgname=optiscaler-universal
pkgver=0.1.1_alpha2
pkgrel=1
pkgdesc="Intelligent OptiScaler configuration tool for Linux gaming - automatically optimizes GPU settings"
arch=('any')
url="https://github.com/ind4skylivey/0ptiscaler4linux"
license=('MIT')
depends=('bash>=4.0' 'pciutils')
optdepends=(
    'mesa-utils: for Mesa/AMD/Intel GPU detection'
    'git-lfs: for downloading OptiScaler binaries'
    'python: for advanced YAML parsing'
)
source=("$pkgname-${pkgver/_/-}.tar.gz::$url/archive/v${pkgver/_/-}.tar.gz")
sha256sums=('af15ed06b5eab1a7175b30ac1838c897ecd5969809da5e5296f6bdd2cd2a90eb')

package() {
    cd "$srcdir/0ptiscaler4linux-${pkgver/_/-}"

    # Create directories
    install -dm755 "$pkgdir/usr/share/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"

    # Install core files
    cp -r core "$pkgdir/usr/share/$pkgname/"
    cp -r lib "$pkgdir/usr/share/$pkgname/"
    cp -r profiles "$pkgdir/usr/share/$pkgname/"
    cp -r scripts "$pkgdir/usr/share/$pkgname/"
    cp -r templates "$pkgdir/usr/share/$pkgname/"

    # Install binaries directory structure
    install -dm755 "$pkgdir/usr/share/$pkgname/binaries"
    cp -r binaries/* "$pkgdir/usr/share/$pkgname/binaries/"

    # Create wrapper scripts in /usr/bin to handle path resolution correctly
    for script in install uninstall update diagnose benchmark; do
        cat << EOF > "$pkgdir/usr/bin/optiscaler-$script"
#!/bin/bash
exec /usr/share/$pkgname/scripts/$script.sh "\$@"
EOF
        chmod 755 "$pkgdir/usr/bin/optiscaler-$script"
    done

    # Install documentation
    cp -r docs/* "$pkgdir/usr/share/doc/$pkgname/"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 PROJECT_DESIGN.md "$pkgdir/usr/share/doc/$pkgname/PROJECT_DESIGN.md"
    install -Dm644 PROJECT_STATUS.md "$pkgdir/usr/share/doc/$pkgname/PROJECT_STATUS.md"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install version file
    install -Dm644 VERSION "$pkgdir/usr/share/$pkgname/VERSION"
}
