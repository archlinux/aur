# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=proton-drive-cli
pkgname=$_pkgname-git
pkgver=0.4.6.r46.f249616
pkgrel=1
pkgdesc='Official Proton Drive command-line client'
arch=(x86_64 aarch64)
url=https://github.com/protondriveapps/sdk
license=(MIT)

provides=($_pkgname)
conflicts=($_pkgname)
depends=('bun>=1.3.14' libsecret)
makedepends=(git)
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"/sdk
    git describe --tags --long --abbrev=7 --match 'cli/v*' | \
        sed 's|^cli/v||; s/\([^-]*-\)g/r\1/; s/-/./g'
}

build() {
    cd "$srcdir"/sdk/client/js
    bun install

    cd ../../incubating/account/js
    bun install

    cd ../../../cli
    bun install --frozen-lockfile
    mkdir -p release

    CLI_APP_VERSION_NAME=cli-drive-archlinux \
    SENTRY_DSN="" \
    bun run build:bundle
}

package() {
    cd "$srcdir"/sdk/cli
    install -Dm644 -t "$pkgdir"/usr/lib/$_pkgname release/proton-drive.js
    cat > ${_pkgname%-cli} << 'EOF'
#!/bin/sh
exec bun /usr/lib/proton-drive-cli/proton-drive.js "$@"
EOF
    install -Dm755 -t "$pkgdir"/usr/bin ${_pkgname%-cli}
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname ../LICENSE.md
    install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname CHANGELOG.md README.md

    cd ../client/js
    install -Dm644 CHANGELOG.md "$pkgdir"/usr/share/doc/$_pkgname/CHANGELOG-sdk.md
    install -Dm644 README.md "$pkgdir"/usr/share/doc/$_pkgname/README-sdk.md
}
