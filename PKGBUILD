# Maintainer: soymadip 
pkgname=autotitle
pkgver=1.12.0
pkgrel=1
pkgdesc="Automated media file renamer using online databases"
arch=('x86_64' 'aarch64')
url="https://github.com/mydehq/autotitle"
license=('GPL3')

depends=('glibc' 'mkvtoolnix-cli' 'atomicparsley')
makedepends=('mise')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

backup=('etc/autotitle/config.yml')

prepare() {
    cd "${pkgname}-${pkgver}"

    # Trust the mise.toml
    mise trust --yes
}

build() {
    cd "${pkgname}-${pkgver}"

    # Set version metadata for version.sh (since build from tarball has no .git)
    export VERSION="v${pkgver}"
    export COMMIT="v${pkgver}"
    export DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ')

    # Use mise to run the release task
    mise run release
}


package() {
    cd "${pkgname}-${pkgver}"

    msg2 "Packaging binary..."
    install -Dm755 bin/autotitle "$pkgdir/usr/bin/autotitle"
    install -Dm644 src/config.yml "$pkgdir/etc/autotitle/config.yml"

    msg2 "Packaging Docs, License..."
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
