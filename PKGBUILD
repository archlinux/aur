# Maintainer: ind4skylivey <https://github.com/ind4skylivey>
pkgname=optiscaler-universal-git
pkgver=r50.179fdf7
pkgrel=1
pkgdesc="Intelligent OptiScaler configuration tool for Linux gaming (development version)"
arch=('any')
url="https://github.com/ind4skylivey/0ptiscaler4linux"
license=('MIT')
depends=('bash>=4.0' 'pciutils')
makedepends=('git')
optdepends=(
    'mesa-utils: for Mesa/AMD/Intel GPU detection'
    'git-lfs: for downloading OptiScaler binaries'
    'python: for advanced YAML parsing'
)
provides=('optiscaler-universal')
conflicts=('optiscaler-universal')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/0ptiscaler4linux"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/0ptiscaler4linux"

    # Create directories
    install -dm755 "$pkgdir/usr/share/optiscaler-universal"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/doc/optiscaler-universal"
    install -dm755 "$pkgdir/usr/share/licenses/optiscaler-universal"

    # Install core files and data
    cp -r core "$pkgdir/usr/share/optiscaler-universal/"
    cp -r lib "$pkgdir/usr/share/optiscaler-universal/"
    cp -r profiles "$pkgdir/usr/share/optiscaler-universal/"
    cp -r scripts "$pkgdir/usr/share/optiscaler-universal/"
    cp -r templates "$pkgdir/usr/share/optiscaler-universal/"
    cp -r config "$pkgdir/usr/share/optiscaler-universal/"
    cp -r src "$pkgdir/usr/share/optiscaler-universal/"

    # Install binaries directory structure
    install -dm755 "$pkgdir/usr/share/optiscaler-universal/binaries"
    cp -r binaries/* "$pkgdir/usr/share/optiscaler-universal/binaries/"

    # Create wrapper scripts in /usr/bin to handle path resolution correctly
    for script in install uninstall update diagnose benchmark; do
        cat << EOF > "$pkgdir/usr/bin/optiscaler-$script"
#!/bin/bash
exec /usr/share/optiscaler-universal/scripts/$script.sh "\$@"
EOF
        chmod 755 "$pkgdir/usr/bin/optiscaler-$script"
    done

    # Install documentation
    cp -r docs/* "$pkgdir/usr/share/doc/optiscaler-universal/"
    install -Dm644 README.md "$pkgdir/usr/share/doc/optiscaler-universal/README.md"
    install -Dm644 PROJECT_DESIGN.md "$pkgdir/usr/share/doc/optiscaler-universal/PROJECT_DESIGN.md"
    install -Dm644 PROJECT_STATUS.md "$pkgdir/usr/share/doc/optiscaler-universal/PROJECT_STATUS.md"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/optiscaler-universal/LICENSE"

    # Install version file
    install -Dm644 VERSION "$pkgdir/usr/share/optiscaler-universal/VERSION"
}
