# Maintainer: khvalera <khvalera@ukr.net>
pkgname=gsender
pkgver=1.6.4
pkgrel=2
pkgdesc="Connect to and control Grbl-based CNCs"
arch=('x86_64')
url="https://github.com/Sienci-Labs/${pkgname}"
license=('MIT')

depends=('nodejs>=22.12.0')
makedepends=('npm' 'yarn' 'libxcrypt-compat' 'debugedit' 'node-gyp')

source=("https://github.com/Sienci-Labs/${pkgname}/archive/v$pkgver.tar.gz")
sha512sums=('62a5cdcfcb6369daf586df3b6fbcc6b70e99cb2de5d335d70bc163171116d7be7f89030d67b125498f21930a8154081ce82a8293cd0274c34ec530aa6c1740ce')

build() {
    cd "$pkgname-$pkgver"

    echo "Node.js: $(node -v)"
    echo "Yarn: $(yarn -v)"

    node -e 'if (parseInt(process.versions.node) < 22) process.exit(1)'

    export NODE_OPTIONS="--openssl-legacy-provider --max-old-space-size=4096"

    yarn install --frozen-lockfile
    yarn build-prod
    yarn build:linux-x64
}

package() {
    cd "$pkgname-$pkgver"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt/gSender"

    cp -dr --no-preserve=ownership ./output/linux-unpacked/* "${pkgdir}/opt/gSender/"

    ln -sf '/opt/gSender/gsender' "${pkgdir}/usr/bin/gsender"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
