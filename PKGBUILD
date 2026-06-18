# Maintainer: Ralph Torres <mail at ralphptorr dot es>

_pkgname=proton-drive-cli
pkgname=$_pkgname-git
pkgver=0.4.6.r0.f21e74c
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
    cd "$srcdir"/sdk
    _cliver=$(git describe --tags --abbrev=0 --match 'cli/v*' | \
        sed 's|^cli/v||')
    _jsver=$(git tag -l 'js/v*' --sort=-v:refname | \
        head -1 | sed 's|^js/v||')
    _shorthash=$(git rev-parse --short HEAD)

    cd js/sdk
    bun install

    cd ../cli
    bun install --frozen-lockfile
    mkdir -p release

    NODE_ENV=production bun build \
        --target=bun \
        --format=esm \
        --minify \
        --sourcemap=inline \
        --define "APP_VERSION='cli-drive-archlinux@$_cliver+$_shorthash'" \
        --define "SDK_VERSION='js@$_jsver+$_shorthash'" \
        --define "SENTRY_DSN=''" \
        src/proton-drive.ts \
        --outfile=release/proton-drive.js
}

package() {
    cd "$srcdir"/sdk/js/cli
    install -Dm644 -t "$pkgdir"/usr/lib/$_pkgname release/proton-drive.js
    cat > ${_pkgname%-cli} << 'EOF'
#!/bin/sh
exec bun /usr/lib/proton-drive-cli/proton-drive.js "$@"
EOF
    install -Dm755 -t "$pkgdir"/usr/bin ${_pkgname%-cli}
    install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname ../../LICENSE.md
    install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname CHANGELOG.md README.md
}
